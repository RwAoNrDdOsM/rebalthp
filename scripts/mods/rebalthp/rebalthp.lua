local mod = get_mod("rebalthp")

-- Bloodlust Health
mod:dofile("scripts/mods/rebalthp/bloodlust_health")
-- Replace Localize
local _language_id = Application.user_setting("language_id")
local _localization_database = {}
mod._quick_localize = function (self, text_id)
    local mod_localization_table = _localization_database
    if mod_localization_table then
        local text_translations = mod_localization_table[text_id]
        if text_translations then
            return text_translations[_language_id] or text_translations["en"]
        end
    end
end
function mod.add_text(self, text_id, text)
    if type(text) == "table" then
        _localization_database[text_id] = text
    else
        _localization_database[text_id] = {
            en = text
        }
    end
end
mod:hook("Localize", function(func, text_id)
    local str = mod:_quick_localize(text_id)
    if str then return str end
    return func(text_id)
end)

-- Add thp on enemy death?
mod:hook_origin(ActionShieldSlam, "_hit", function (self, world, can_damage, owner_unit, current_action)
	local network_manager = Managers.state.network
	local physics_world = World.get_data(world, "physics_world")
	local attacker_unit_id = network_manager:unit_game_object_id(owner_unit)
	local first_person_unit = self.first_person_unit
	local unit_forward = Quaternion.forward(Unit.local_rotation(first_person_unit, 0))
	local first_person_extension = ScriptUnit.extension(owner_unit, "first_person_system")
	local self_pos = first_person_extension:current_position()
	local forward_offset = current_action.forward_offset or 1
	local attack_pos = self_pos + unit_forward * forward_offset
	local radius = current_action.push_radius
	local collision_filter = "filter_melee_sweep"
	local actors, actors_n = PhysicsWorld.immediate_overlap(physics_world, "shape", "sphere", "position", attack_pos, "size", radius, "types", "dynamics", "collision_filter", collision_filter, "use_global_table")
	local inner_forward_offset = forward_offset + radius * 0.65
	local inner_attack_pos = self_pos + unit_forward * inner_forward_offset
	local inner_attack_pos_near = self_pos + unit_forward
	local inner_radius = current_action.inner_push_radius or radius * 0.4
	local inner_radius_sq = inner_radius * inner_radius
	local inner_hit_units = self.inner_hit_units
	local hit_units = self.hit_units
	local unit_get_data = Unit.get_data

	if script_data.debug_weapons then
		self._drawer:sphere(attack_pos, radius, Color(255, 0, 0))
		self._drawer:sphere(inner_attack_pos_near, inner_radius, Color(0, 255, 0))
		self._drawer:sphere(inner_attack_pos, inner_radius, Color(0, 255, 0))
	end

	local target_breed_unit = self.target_breed_unit
	local target_breed_unit_health_extension = Unit.alive(target_breed_unit) and ScriptUnit.extension(target_breed_unit, "health_system")

	if target_breed_unit_health_extension then
		if not target_breed_unit_health_extension:is_alive() then
			target_breed_unit = nil
		end
	else
		target_breed_unit = nil
	end

	local side = Managers.state.side.side_by_unit[owner_unit]
	local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
	local total_hits = 0
	local hit_unit_index = 1

	for i = 1, actors_n, 1 do
		repeat
			local hit_actor = actors[i]
			local hit_unit = Actor.unit(hit_actor)
			local breed = unit_get_data(hit_unit, "breed")
			local dummy = not breed and unit_get_data(hit_unit, "is_dummy")
			local hit_self = hit_unit == owner_unit
			local target_is_friendly_player = table.contains(player_and_bot_units, hit_unit)

			if not target_is_friendly_player and (breed or dummy) and not hit_units[hit_unit] then
				hit_units[hit_unit] = true
				hit_unit_index = total_hits
				total_hits = total_hits + 1

				self._num_targets_hit = self._num_targets_hit + 1

				if hit_unit == target_breed_unit then
					break
				end

				local node = Actor.node(hit_actor)
				local hit_zone = breed and breed.hit_zones_lookup[node]
				local target_hit_zone_name = (hit_zone and hit_zone.name) or "torso"
				local target_hit_position = Unit.has_node(hit_unit, "j_spine") and Unit.world_position(hit_unit, Unit.node(hit_unit, "j_spine"))
				local target_world_position = POSITION_LOOKUP[hit_unit] or Unit.world_position(hit_unit, 0)
				local hit_position = target_hit_position or target_world_position
				self.target_hit_zones_names[hit_unit] = target_hit_zone_name
				self.target_hit_unit_positions[hit_unit] = hit_position
				local attack_direction = Vector3.normalize(hit_position - self_pos)
				local hit_unit_id = network_manager:unit_game_object_id(hit_unit)
				local hit_zone_id = NetworkLookup.hit_zones[target_hit_zone_name]

				if self:_is_infront_player(self_pos, unit_forward, hit_position) then
					local distance_to_inner_position_sq = math.min(Vector3.distance_squared(target_hit_position, inner_attack_pos), Vector3.distance_squared(target_hit_position, inner_attack_pos_near))

					if distance_to_inner_position_sq <= inner_radius_sq then
						inner_hit_units[hit_unit] = true
					else
						local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)
						local damage_source = self.item_name
						local damage_source_id = NetworkLookup.damage_sources[damage_source]
						local weapon_system = self.weapon_system
						local power_level = self.power_level
						local is_server = self.is_server
						local damage_profile = self.damage_profile_aoe
						local target_index = hit_unit_index
						local is_critical_strike = self._is_critical_strike

						if not dummy then
							ActionSweep._play_character_impact(self, is_server, owner_unit, hit_unit, breed, hit_position, target_hit_zone_name, current_action, damage_profile, target_index, power_level, attack_direction, shield_blocked, self.melee_boost_curve_multiplier, is_critical_strike)
						end

						weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, self.damage_profile_aoe_id, "power_level", power_level, "hit_target_index", target_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", self._is_critical_strike, "can_damage", true, "can_stagger", true, "first_hit", self._num_targets_hit == 1)
					end
				end
			elseif not target_is_friendly_player and not hit_units[hit_unit] and not hit_self and ScriptUnit.has_extension(hit_unit, "health_system") then
				local hit_unit_id, is_level_unit = Managers.state.network:game_object_or_level_id(hit_unit)

				if is_level_unit then
					hit_units[hit_unit] = true
					local no_player_damage = unit_get_data(hit_unit, "no_damage_from_players")

					if not no_player_damage then
						local target_hit_position = Unit.world_position(hit_unit, 0)
						local distance_to_inner_position_sq = math.min(Vector3.distance_squared(target_hit_position, inner_attack_pos), Vector3.distance_squared(target_hit_position, inner_attack_pos_near))

						if distance_to_inner_position_sq <= inner_radius_sq then
							inner_hit_units[hit_unit] = true
						else
							local hit_zone_name = "full"
							local target_index = 1
							local damage_profile = self.damage_profile_aoe
							local damage_source = self.item_name
							local power_level = self.power_level
							local is_critical_strike = self._is_critical_strike
							local attack_direction = Vector3.normalize(target_hit_position - self_pos)

							DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, self.melee_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)
						end
					end
				else
					hit_units[hit_unit] = true
					local hit_position = POSITION_LOOKUP[hit_unit] or Unit.world_position(hit_unit, 0)
					local distance_to_inner_position_sq = math.min(Vector3.distance_squared(hit_position, inner_attack_pos), Vector3.distance_squared(hit_position, inner_attack_pos_near))

					if distance_to_inner_position_sq <= inner_radius_sq then
						inner_hit_units[hit_unit] = true
					end

					local damage_source = self.item_name
					local damage_source_id = NetworkLookup.damage_sources[damage_source]
					local weapon_system = self.weapon_system
					local power_level = self.power_level
					local hit_zone_id = NetworkLookup.hit_zones.full
					local attack_direction = Vector3.normalize(hit_position - self_pos)

					weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, self.damage_profile_aoe_id, "power_level", power_level, "hit_target_index", nil, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", self._is_critical_strike, "can_damage", true, "can_stagger", true)
				end
			end
		until true
	end

	if Unit.alive(target_breed_unit) and not self.hit_target_breed_unit then
		inner_hit_units[target_breed_unit] = true
	end

	local hit_index = 1

	for hit_unit, _ in pairs(inner_hit_units) do
		local breed = unit_get_data(hit_unit, "breed")
		local dummy = not breed and unit_get_data(hit_unit, "is_dummy")
		local hit_zone_name = self.target_hit_zones_names[hit_unit] or "torso"
		local target_hit_position = Unit.has_node(hit_unit, "j_spine") and Unit.world_position(hit_unit, Unit.node(hit_unit, "j_spine"))
		local target_world_position = POSITION_LOOKUP[hit_unit] or Unit.world_position(hit_unit, 0)
		local hit_position = target_hit_position or target_world_position
		local attack_direction = Vector3.normalize(hit_position - self_pos)
		local hit_unit_id, is_level_unit = network_manager:game_object_or_level_id(hit_unit)
		local hit_zone_id = NetworkLookup.hit_zones[hit_zone_name]

		if (breed or dummy) and self:_is_infront_player(self_pos, unit_forward, hit_position, current_action.push_dot) then
			local is_server = self.is_server
			local hit_default_target = hit_unit == target_breed_unit
			local damage_profile = (hit_default_target and self.damage_profile_target) or self.damage_profile
			local damage_profile_id = (hit_default_target and self.damage_profile_target_id) or self.damage_profile_id
			local target_index = 1
			local power_level = self.power_level
			local is_critical_strike = self._is_critical_strike
			local shield_blocked = AiUtils.attack_is_shield_blocked(hit_unit, owner_unit)
			local actor = Unit.find_actor(hit_unit, "c_spine") and Unit.actor(hit_unit, "c_spine")
			local actor_position_hit = actor and Actor.center_of_mass(actor)

			if not dummy and actor_position_hit then
				ActionSweep._play_character_impact(self, is_server, owner_unit, hit_unit, breed, actor_position_hit, hit_zone_name, current_action, damage_profile, target_index, power_level, attack_direction, shield_blocked, self.melee_boost_curve_multiplier, is_critical_strike)
			end

			local send_to_server = true
			local charge_value = damage_profile.charge_value or "heavy_attack"
			local buff_type = DamageUtils.get_item_buff_type(self.item_name)

			DamageUtils.buff_on_attack(owner_unit, hit_unit, charge_value, is_critical_strike, hit_zone_name, hit_index, send_to_server, buff_type)

			local damage_source_id = NetworkLookup.damage_sources[self.item_name]
			local weapon_system = self.weapon_system

			weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", hit_index, "blocking", shield_blocked, "shield_break_procced", false, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", true, "can_stagger", true, "first_hit", self._num_targets_hit == 1)

			if self.is_critical_strike and self.critical_strike_particle_id then
				World.destroy_particles(self.world, self.critical_strike_particle_id)

				self.critical_strike_particle_id = nil
			end

			if not Managers.player:owner(self.owner_unit).bot_player then
				Managers.state.controller_features:add_effect("rumble", {
					rumble_effect = "handgun_fire"
				})
			end

			self.hit_target_breed_unit = true
			hit_index = hit_index + 1
		elseif ScriptUnit.has_extension(hit_unit, "health_system") then
			if is_level_unit then
				local no_player_damage = unit_get_data(hit_unit, "no_damage_from_players")

				if not no_player_damage then
					hit_zone_name = "full"
					local target_index = 1
					local damage_profile = self.damage_profile
					local damage_source = self.item_name
					local power_level = self.power_level
					local is_critical_strike = self._is_critical_strike
					target_hit_position = Unit.world_position(hit_unit, 0)
					attack_direction = Vector3.normalize(target_hit_position - self_pos)

					DamageUtils.damage_level_unit(hit_unit, owner_unit, hit_zone_name, power_level, self.melee_boost_curve_multiplier, is_critical_strike, damage_profile, target_index, attack_direction, damage_source)
				end
			else
				local damage_source = self.item_name
				local damage_source_id = NetworkLookup.damage_sources[damage_source]
				local weapon_system = self.weapon_system
				local power_level = self.power_level
				hit_zone_id = NetworkLookup.hit_zones.full
				target_hit_position = Unit.world_position(hit_unit, 0)
				attack_direction = Vector3.normalize(target_hit_position - self_pos)

				weapon_system:send_rpc_attack_hit(damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, target_hit_position, attack_direction, self.damage_profile_id, "power_level", power_level, "hit_target_index", nil, "boost_curve_multiplier", self.melee_boost_curve_multiplier, "is_critical_strike", self._is_critical_strike, "can_damage", true, "can_stagger", true)
			end
		end
	end

	self.state = "hit"
end)

local damage_source_procs = {
	charge_ability_hit_blast = "on_charge_ability_hit_blast",
	charge_ability_hit = "on_charge_ability_hit"
}
local unit_get_data = Unit.get_data

mod:hook_origin(DamageUtils, "server_apply_hit", function (t, attacker_unit, target_unit, hit_zone_name, hit_position, attack_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit, backstab_multiplier, first_hit, total_hits, source_attacker_unit)
	local buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

	if buff_extension and damage_source_procs[damage_source] then
		buff_extension:trigger_procs(damage_source_procs[damage_source], target_unit, target_index)
	end

	local target_alive = AiUtils.unit_alive(target_unit)
	local just_died = false

	if not blocking then
		local attack_power_level = power_level

		if not can_damage then
			attack_power_level = 0
		end

		if damage_profile.charge_value == "heavy_attack" and DamageUtils.is_player_unit(attacker_unit) then
			local status_extension = ScriptUnit.has_extension(attacker_unit, "status_system")

			if status_extension then
				local current_fall_distance = status_extension:fall_distance()

				if MinFallDistanceForBonus <= current_fall_distance then
					attack_power_level = attack_power_level * FallingPowerLevelBonusMultiplier
				end
			end
		end

		local custom_dot = nil

		if buff_extension then
			if (buff_extension:has_buff_perk("victor_witchhunter_bleed_on_critical_hit") and (damage_profile.charge_value == "light_attack" or damage_profile.charge_value == "heavy_attack")) or (buff_extension:has_buff_perk("kerillian_critical_bleed_dot") and damage_profile.charge_value == "projectile") then
				custom_dot = "weapon_bleed_dot_whc"
			end

			if buff_extension:has_buff_perk("sienna_unchained_burn_push") and damage_profile and damage_profile.is_push then
				custom_dot = "burning_1W_dot_unchained_push"
			end
		end

		local source_attacker_unit = source_attacker_unit or attacker_unit
		local added_dot = nil

		if not damage_profile.require_damage_for_dot or attack_power_level ~= 0 then
			added_dot = DamageUtils.apply_dot(damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, nil, source_attacker_unit, custom_dot)
		end

		
		DamageUtils.add_damage_network_player(damage_profile, target_index, attack_power_level, target_unit, attacker_unit, hit_zone_name, hit_position, attack_direction, damage_source, hit_ragdoll_actor, boost_curve_multiplier, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier, source_attacker_unit)
		if not target_alive then
			just_died = true
		end
	elseif shield_breaking_hit then
		local shield_extension = ScriptUnit.has_extension(target_unit, "ai_shield_system")

		if shield_extension then
			shield_extension:break_shield()
		end

		blocking = false
	end

	if target_alive and not damage_profile.no_stagger or just_died and not damage_profile.no_stagger then
		local stagger_power_level = power_level

		if not can_stagger then
			stagger_power_level = 0
		end

		DamageUtils.stagger_ai(t, damage_profile, target_index, stagger_power_level, target_unit, attacker_unit, hit_zone_name, attack_direction, boost_curve_multiplier, is_critical_strike, blocking, damage_source)
	end

	if unit_get_data(target_unit, "is_dummy") and not damage_profile.no_stagger and can_stagger then
		local buff_system = Managers.state.entity:system("buff_system")
		local target_settings = (damage_profile.targets and damage_profile.targets[1]) or damage_profile.default_target
		local attack_template_name = target_settings.attack_template
		local attack_template = AttackTemplates[attack_template_name]
		local stagger_value = (attack_template and attack_template.stagger_value) or 1

		for i = 1, stagger_value, 1 do
			buff_system:add_buff(target_unit, "dummy_stagger", attacker_unit, false)
		end

		local attacker_buff_extension = attacker_unit and ScriptUnit.has_extension(attacker_unit, "buff_system")

		if attacker_buff_extension then
			local item_data = rawget(ItemMasterList, damage_source)
			local weapon_template_name = item_data and item_data.template

			if weapon_template_name then
				local weapon_template = Weapons[weapon_template_name]
				local buff_type = weapon_template.buff_type

				attacker_buff_extension:trigger_procs("on_stagger", target_unit, damage_profile, attacker_unit, 1, 1, stagger_value, buff_type, target_index)
			end
		end
	end
end)

-- Buff Changes
local function merge(dst, src)
    for k, v in pairs(src) do
        dst[k] = v
    end
    return dst
end

function mod.add_buff_template(self, buff_name, buff_data)   
    local new_talent_buff = {
        buffs = {
            merge({ name = buff_name }, buff_data),
        },
    }
    BuffTemplates[buff_name] = new_talent_buff
    local index = #NetworkLookup.buff_templates + 1
    NetworkLookup.buff_templates[index] = buff_name
    NetworkLookup.buff_templates[buff_name] = index
end
function mod.add_proc_function(self, name, func)
    ProcFunctions[name] = func
end

mod:add_buff_template("rebalthp_regrowth", {
	name = "regrowth",
	event_buff = true,
	buff_func = "reablthp_heal_finesse_damage_on_melee",
	event = "on_hit",
	perk = "ninja_healing",
	bonus_hs = 2,
	bonus_crit = 1,
})
mod:add_buff_template("rebalthp_vanguard", {
	multiplier = 1,
	name = "vanguard",
	event_buff = true,
	buff_func = "heal_stagger_targets_on_melee",
	event = "on_stagger",
	perk = "tank_healing"
})
mod:add_buff_template("rebalthp_reaper", {
	multiplier = -0.05,
	name = "reaper",
	event_buff = true,
	buff_func = "heal_damage_targets_on_melee",
	event = "on_player_damage_dealt",
	perk = "linesman_healing",
	max_targets = 5,
	bonus = 0.25
})
mod:add_proc_function("heal_percent_of_damage_dealt_on_melee", function (player, buff, params)
	if not Managers.state.network.is_server then
		return
	end

	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		local buff_type = params[6]

		if buff_type == "MELEE_1H" or buff_type == "MELEE_2H" then
			local hit_unit = params[1]
			local damage_amount = params[2]
			local hit_unit_health_extension = ScriptUnit.extension(hit_unit, "health_system")

			if hit_unit_health_extension and hit_unit_health_extension:current_health() <= damage_amount then
				local breed = AiUtils.unit_breed(hit_unit)

				if breed and not breed.is_hero then
					local heal_amount = breed.bloodlust_health or 0

					DamageUtils.heal_network(player_unit, player_unit, heal_amount, "heal_from_proc")
				end
			end
		end
	end
end)
mod:add_buff_template("rebalthp_bloodlust", {
	multiplier = 0.45,
	name = "bloodlust",
	event_buff = true,
	buff_func = "heal_percent_of_damage_dealt_on_melee",
	event = "on_player_damage_dealt",
	perk = "smiter_healing",
	heal_cap = 0.25
})
mod:add_buff_template("rebalthp_smiter_unbalance", {
	max_display_multiplier = 0.4,
	name = "smiter_unbalance",
	display_multiplier = 0.2,
	perk = "smiter_stagger_damage"
})
mod:add_buff_template("rebalthp_power_level_unbalance", {
	max_stacks = 1,
	name = "power_level_unbalance",
	stat_buff = "power_level",
	multiplier = 0.1 -- 0.075
}) 
mod:add_proc_function("heal_percent_of_damage_dealt_on_melee", function (player, buff, params)
	local player_unit = player.player_unit
	local hit_unit = params[1]
	local is_dummy = Unit.get_data(hit_unit, "is_dummy")

	if Unit.alive(player_unit) and (is_dummy or Unit.alive(hit_unit)) and Managers.player.is_server then
		local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

		if buff_extension then
			buff_extension:add_buff("rebalthp_tank_unbalance_buff")
		end
	end
end )
mod:add_buff_template("rebalthp_tank_unbalance", {
	max_display_multiplier = 0.4,
	name = "tank_unbalance",
	event_buff = true,
	buff_func = "heal_percent_of_damage_dealt_on_melee",
	event = "on_stagger",
	display_multiplier = 0.2
})
mod:add_buff_template("rebalthp_tank_unbalance_buff", {
	refresh_durations = true,
	name = "tank_unbalance_buff",
	stat_buff = "power_level",
	max_stacks = 1,
	duration = 5,
	multiplier = 0.1
})
mod:add_buff_template("rebalthp_finesse_unbalance", {
	max_display_multiplier = 0.4,
	name = "finesse_unbalance",
	display_multiplier = 0.2,
	perk = "finesse_stagger_damage"
})

-- Talent Changes
function mod.modify_talent(self, career_name, tier, index, new_talent_data)
	local career_settings = CareerSettings[career_name]
    local hero_name = career_settings.profile_name
	local talent_tree_index = career_settings.talent_tree_index

	local old_talent_name = TalentTrees[hero_name][talent_tree_index][tier][index]
	local old_talent_id_lookup = TalentIDLookup[old_talent_name]
	local old_talent_id = old_talent_id_lookup.talent_id
	local old_talent_data = Talents[hero_name][old_talent_id]

    Talents[hero_name][old_talent_id] = merge(old_talent_data, new_talent_data)
end

mod:dofile("scripts/mods/rebalthp/modify_talent")

-- Trait Changes
function mod.modify_trait(self, name, new_data)
	local old_data = WeaponTraits.traits[name]

    WeaponTraits.traits[name] = merge(old_data, new_data)
end
mod:modify_trait("necklace_heal_self_on_heal_other", {
	buff_name = "conqueror",
	advanced_description = "conqueror_desc_3",
})