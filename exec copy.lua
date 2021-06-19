NewBreedTweaks = NewBreedTweaks or {} --table.clone(BreedTweaks)
NewBreedTweaks.bloodlust_health = {
	beastmen_horde = 1.5,
	chaos_roamer = 3,
	skaven_special = 8,
	chaos_warrior = 30,
	skaven_elite = 8,
	beastmen_roamer = 3,
	chaos_elite = 15,
	beastmen_elite = 15,
	skaven_horde = 0.5,
	chaos_special = 10,
	skaven_roamer = 1,
	monster = 50,
	chaos_horde = 1
}

Breeds.beastmen_bestigor.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_elite
Breeds.beastmen_gor.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_roamer
Breeds.beastmen_gor_dummy.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_roamer
Breeds.beastmen_minotaur.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.beastmen_standard_bearer.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_elite
Breeds.beastmen_ungor_archer.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_horde
Breeds.beastmen_ungor.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_horde
Breeds.beastmen_ungor_dummy.bloodlust_health = NewBreedTweaks.bloodlust_health.beastmen_horde
Breeds.chaos_berzerker.loodlust_health = NewBreedTweaks.bloodlust_health.chaos_elite
Breeds.chaos_corruptor_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_special
Breeds.chaos_exalted_champion_warcamp.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.chaos_exalted_sorcerer_drachenfels.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.chaos_exalted_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.chaos_fanatic.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_horde
Breeds.chaos_marauder_with_shield.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_roamer
Breeds.chaos_marauder.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_roamer
Breeds.chaos_marauder_tutorial.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_roamer
Breeds.chaos_mutator_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_special
Breeds.chaos_plague_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_special
Breeds.chaos_raider.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_elite
Breeds.chaos_raider_tutorial.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_elite
Breeds.chaos_spawn.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.chaos_tentacle_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_special
Breeds.chaos_troll.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.chaos_vortex_sorcerer.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_special
Breeds.chaos_warrior.bloodlust_health = NewBreedTweaks.bloodlust_health.chaos_warrior
Breeds.skaven_clan_rat_with_shield.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_roamer
Breeds.skaven_clan_rat.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_roamer
Breeds.skaven_clan_rat_tutorial.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_roamer
Breeds.skaven_explosive_loot_rat.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_roamer
Breeds.skaven_grey_seer.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_gutter_runner.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special
Breeds.skaven_loot_rat.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special
Breeds.skaven_pack_master.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special
Breeds.skaven_plague_monk.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_elite
Breeds.skaven_poison_wind_globadier.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special
Breeds.skaven_rat_ogre.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_ratling_gunner.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special
Breeds.skaven_slave.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_horde
Breeds.skaven_storm_vermin_champion.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_storm_vermin_warlord.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_storm_vermin_with_shield.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_elite
Breeds.skaven_storm_vermin.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_elite
Breeds.skaven_storm_vermin_commander.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_elite
Breeds.skaven_stormfiend_boss.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_stormfiend.bloodlust_health = NewBreedTweaks.bloodlust_health.monster
Breeds.skaven_warpfire_thrower.bloodlust_health = NewBreedTweaks.bloodlust_health.skaven_special

local string_table = {}

string_table["bloodlust_name"] = "Bloodlust"
string_table["reaper_name"] = "Reaper"
string_table["vanguard_name"] = "Vanguard"

Localize = function(text_id)
	return string_table[text] or Managers.localizer:lookup(text_id)
end

BuffExtension.trigger_procs = function (self, event, ...)
	local event_buffs = self._event_buffs[event]
	local num_event_buffs = table.size(event_buffs)

	if num_event_buffs == 0 then
		return
	end

	local player = Managers.player:owner(self._unit)
	local num_args = select("#", ...)
	local params = FrameTable.alloc_table()
	local event_buffs_to_remove = FrameTable.alloc_table()

	for i = 1, num_args, 1 do
		local arg = select(i, ...)
		params[i] = arg
	end

	for index, buff in pairs(event_buffs) do
        if buff then
            local proc_chance = buff.proc_chance or 1
            if self:has_procced(proc_chance, buff) then
                local buff_func = ProcFunctions[buff.buff_func]
                if event == "on_player_damage_dealt" and buff_func == nil then
                    buff_func = function (player, buff, params)
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
                    end
                end
                local success = buff_func(player, buff, params)

                if success and buff.template.remove_on_proc then
                    event_buffs_to_remove[#event_buffs_to_remove + 1] = buff
                end
            end
        end
	end

	for i = 1, #event_buffs_to_remove, 1 do
		local buff = event_buffs_to_remove[i]
		local id = buff.id

		self:remove_buff(id)
	end
end

WeaponTraits.traits.necklace_heal_self_on_heal_other = {
	name = "necklace_heal_self_on_heal_other",
	display_name = "trait_necklace_heal_self_on_heal_other",
	buffer = "server",
	advanced_description = "conqueror_desc_3", --"description_trait_necklace_heal_self_on_heal_other",
	icon = "necklace_heal_self_on_heal_other",
	--buff_name = "trait_necklace_heal_self_on_heal_other",
	buff_name = "conqueror",
	description_values = {
		{
			value_type = "percent",
			value = 0.5
		}
	}
}

local function merge(dst, src)
    for k, v in pairs(src) do
        dst[k] = v
    end
    return dst
end

local function add_buff(buff_name, buff_data) 
    local new_buff = {
        buffs = {
            merge({ name = buff_name }, buff_data),
        },
    }
    BuffTemplates[buff_name] = new_buff
    local index = #NetworkLookup.buff_templates + 1
    NetworkLookup.buff_templates[index] = buff_name
    NetworkLookup.buff_templates[buff_name] = index
end

add_buff("rebalthp_vanguard", {
	multiplier = 1,
	name = "vanguard",
	event_buff = true,
	buff_func = "heal_stagger_targets_on_melee",
	event = "on_stagger",
	perk = "tank_healing"
})
add_buff("rebalthp_reaper", {
	multiplier = -0.05,
	name = "reaper",
	event_buff = true,
	buff_func = "heal_damage_targets_on_melee",
	event = "on_player_damage_dealt",
	perk = "linesman_healing",
	max_targets = 5,
	bonus = 0.25
})
add_buff("rebalthp_bloodlust", {
	multiplier = 0.45,
	name = "bloodlust",
	event_buff = true,
	buff_func = "heal_percent_of_damage_dealt_on_melee",
	event = "on_player_damage_dealt",
	perk = "smiter_healing",
	heal_cap = 0.25
})

Talents.empire_soldier[1].name = "vanguard_name"
Talents.empire_soldier[1].description = "vanguard_desc"
Talents.empire_soldier[1].buffs[1] = "rebalthp_vanguard"
Talents.empire_soldier[2].name = "reaper_name"
Talents.empire_soldier[2].description = "reaper_desc"
Talents.empire_soldier[2].buffs[1] = "rebalthp_reaper"
Talents.empire_soldier[2].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.empire_soldier[3].name = "bloodlust_name"
Talents.empire_soldier[3].description = "bloodlust_desc_3"
Talents.empire_soldier[3].buffs[1] = "rebalthp_bloodlust"

Talents.empire_soldier[19].name = "vanguard_name"
Talents.empire_soldier[19].description = "vanguard_desc"
Talents.empire_soldier[19].buffs[1] = "rebalthp_vanguard"
Talents.empire_soldier[20].name = "reaper_name"
Talents.empire_soldier[20].description = "reaper_desc"
Talents.empire_soldier[20].buffs[1] = "rebalthp_reaper"
Talents.empire_soldier[20].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.empire_soldier[21].name = "bloodlust_name"
Talents.empire_soldier[21].description = "bloodlust_desc_3"
Talents.empire_soldier[21].buffs[1] = "rebalthp_bloodlust"

Talents.empire_soldier[38].name = "vanguard_name"
Talents.empire_soldier[38].description = "vanguard_desc"
Talents.empire_soldier[38].buffs[1] = "rebalthp_vanguard"
Talents.empire_soldier[39].name = "reaper_name"
Talents.empire_soldier[39].description = "reaper_desc"
Talents.empire_soldier[39].buffs[1] = "rebalthp_reaper"
Talents.empire_soldier[39].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.empire_soldier[40].name = "bloodlust_name"
Talents.empire_soldier[40].description = "bloodlust_desc_3"
Talents.empire_soldier[40].buffs[1] = "rebalthp_bloodlust"

Talents.empire_soldier[57].name = "vanguard_name"
Talents.empire_soldier[57].description = "vanguard_desc"
Talents.empire_soldier[57].buffs[1] = "rebalthp_vanguard"
Talents.empire_soldier[58].name = "reaper_name"
Talents.empire_soldier[58].description = "reaper_desc"
Talents.empire_soldier[58].buffs[1] = "rebalthp_reaper"
Talents.empire_soldier[58].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.empire_soldier[59].name = "bloodlust_name"
Talents.empire_soldier[59].description = "bloodlust_desc_3"
Talents.empire_soldier[59].buffs[1] = "rebalthp_bloodlust"


Talents.dwarf_ranger[1].name = "vanguard_name"
Talents.dwarf_ranger[1].description = "vanguard_desc"
Talents.dwarf_ranger[1].buffs[1] = "rebalthp_vanguard"
Talents.dwarf_ranger[2].name = "reaper_name"
Talents.dwarf_ranger[2].description = "reaper_desc"
Talents.dwarf_ranger[2].buffs[1] = "rebalthp_reaper"
Talents.dwarf_ranger[2].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.dwarf_ranger[3].name = "bloodlust_name"
Talents.dwarf_ranger[3].description = "bloodlust_desc_3"
Talents.dwarf_ranger[3].buffs[1] = "rebalthp_bloodlust"

Talents.dwarf_ranger[19].name = "vanguard_name"
Talents.dwarf_ranger[19].description = "vanguard_desc"
Talents.dwarf_ranger[19].buffs[1] = "rebalthp_vanguard"
Talents.dwarf_ranger[20].name = "reaper_name"
Talents.dwarf_ranger[20].description = "reaper_desc"
Talents.dwarf_ranger[20].buffs[1] = "rebalthp_reaper"
Talents.dwarf_ranger[20].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.dwarf_ranger[21].name = "bloodlust_name"
Talents.dwarf_ranger[21].description = "bloodlust_desc_3"
Talents.dwarf_ranger[21].buffs[1] = "rebalthp_bloodlust"

Talents.dwarf_ranger[38].name = "vanguard_name"
Talents.dwarf_ranger[38].description = "vanguard_desc"
Talents.dwarf_ranger[38].buffs[1] = "rebalthp_vanguard"
Talents.dwarf_ranger[39].name = "reaper_name"
Talents.dwarf_ranger[39].description = "reaper_desc"
Talents.dwarf_ranger[39].buffs[1] = "rebalthp_reaper"
Talents.dwarf_ranger[39].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.dwarf_ranger[40].name = "bloodlust_name"
Talents.dwarf_ranger[40].description = "bloodlust_desc_3"
Talents.dwarf_ranger[40].buffs[1] = "rebalthp_bloodlust"

Talents.dwarf_ranger[57].name = "vanguard_name"
Talents.dwarf_ranger[57].description = "vanguard_desc"
Talents.dwarf_ranger[57].buffs[1] = "rebalthp_vanguard"
Talents.dwarf_ranger[58].name = "reaper_name"
Talents.dwarf_ranger[58].description = "reaper_desc"
Talents.dwarf_ranger[58].buffs[1] = "rebalthp_reaper"
Talents.dwarf_ranger[58].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.dwarf_ranger[59].name = "bloodlust_name"
Talents.dwarf_ranger[59].description = "bloodlust_desc_3"
Talents.dwarf_ranger[59].buffs[1] = "rebalthp_bloodlust"


Talents.wood_elf[1].name = "vanguard_name"
Talents.wood_elf[1].description = "vanguard_desc"
Talents.wood_elf[1].buffs[1] = "rebalthp_vanguard"
Talents.wood_elf[2].name = "reaper_name"
Talents.wood_elf[2].description = "reaper_desc"
Talents.wood_elf[2].buffs[1] = "rebalthp_reaper"
Talents.wood_elf[2].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.wood_elf[3].name = "bloodlust_name"
Talents.wood_elf[3].description = "bloodlust_desc_3"
Talents.wood_elf[3].buffs[1] = "rebalthp_bloodlust"

Talents.wood_elf[19].name = "vanguard_name"
Talents.wood_elf[19].description = "vanguard_desc"
Talents.wood_elf[19].buffs[1] = "rebalthp_vanguard"
Talents.wood_elf[20].name = "reaper_name"
Talents.wood_elf[20].description = "reaper_desc"
Talents.wood_elf[20].buffs[1] = "rebalthp_reaper"
Talents.wood_elf[20].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.wood_elf[21].name = "bloodlust_name"
Talents.wood_elf[21].description = "bloodlust_desc_3"
Talents.wood_elf[21].buffs[1] = "rebalthp_bloodlust"


Talents.wood_elf[37].name = "vanguard_name"
Talents.wood_elf[37].description = "vanguard_desc"
Talents.wood_elf[37].buffs[1] = "rebalthp_vanguard"
Talents.wood_elf[39].name = "reaper_name"
Talents.wood_elf[39].description = "reaper_desc"
Talents.wood_elf[39].buffs[1] = "rebalthp_reaper"
Talents.wood_elf[39].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.wood_elf[40].name = "bloodlust_name"
Talents.wood_elf[40].description = "bloodlust_desc_3"
Talents.wood_elf[40].buffs[1] = "rebalthp_bloodlust"

Talents.witch_hunter[1].name = "vanguard_name"
Talents.witch_hunter[1].description = "vanguard_desc"
Talents.witch_hunter[1].buffs[1] = "rebalthp_vanguard"
Talents.witch_hunter[2].name = "reaper_name"
Talents.witch_hunter[2].description = "reaper_desc"
Talents.witch_hunter[2].buffs[1] = "rebalthp_reaper"
Talents.witch_hunter[2].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.witch_hunter[3].name = "bloodlust_name"
Talents.witch_hunter[3].description = "bloodlust_desc_3"
Talents.witch_hunter[3].buffs[1] = "rebalthp_bloodlust"

Talents.witch_hunter[19].name = "vanguard_name"
Talents.witch_hunter[19].description = "vanguard_desc"
Talents.witch_hunter[19].buffs[1] = "rebalthp_vanguard"
Talents.witch_hunter[20].name = "reaper_name"
Talents.witch_hunter[20].description = "reaper_desc"
Talents.witch_hunter[20].buffs[1] = "rebalthp_reaper"
Talents.witch_hunter[20].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.witch_hunter[21].name = "bloodlust_name"
Talents.witch_hunter[21].description = "bloodlust_desc_3"
Talents.witch_hunter[21].buffs[1] = "rebalthp_bloodlust"

Talents.witch_hunter[37].name = "vanguard_name"
Talents.witch_hunter[37].description = "vanguard_desc"
Talents.witch_hunter[37].buffs[1] = "rebalthp_vanguard"
Talents.witch_hunter[38].name = "reaper_name"
Talents.witch_hunter[38].description = "reaper_desc"
Talents.witch_hunter[38].buffs[1] = "rebalthp_reaper"
Talents.witch_hunter[38].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.witch_hunter[39].name = "bloodlust_name"
Talents.witch_hunter[39].description = "bloodlust_desc_3"
Talents.witch_hunter[39].buffs[1] = "rebalthp_bloodlust"


Talents.bright_wizard[1].name = "vanguard_name"
Talents.bright_wizard[1].description = "vanguard_desc"
Talents.bright_wizard[1].buffs[1] = "rebalthp_vanguard"
Talents.bright_wizard[2].name = "reaper_name"
Talents.bright_wizard[2].description = "reaper_desc"
Talents.bright_wizard[2].buffs[1] = "rebalthp_reaper"
Talents.bright_wizard[2].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.bright_wizard[3].name = "bloodlust_name"
Talents.bright_wizard[3].description = "bloodlust_desc_3"
Talents.bright_wizard[3].buffs[1] = "rebalthp_bloodlust"

Talents.bright_wizard[19].name = "vanguard_name"
Talents.bright_wizard[19].description = "vanguard_desc"
Talents.bright_wizard[19].buffs[1] = "rebalthp_vanguard"
Talents.bright_wizard[20].name = "reaper_name"
Talents.bright_wizard[20].description = "reaper_desc"
Talents.bright_wizard[20].buffs[1] = "rebalthp_reaper"
Talents.bright_wizard[20].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.bright_wizard[21].name = "bloodlust_name"
Talents.bright_wizard[21].description = "bloodlust_desc_3"
Talents.bright_wizard[21].buffs[1] = "rebalthp_bloodlust"

Talents.bright_wizard[38].name = "vanguard_name"
Talents.bright_wizard[38].description = "vanguard_desc"
Talents.bright_wizard[38].buffs[1] = "rebalthp_vanguard"
Talents.bright_wizard[39].name = "reaper_name"
Talents.bright_wizard[39].description = "reaper_desc"
Talents.bright_wizard[39].buffs[1] = "rebalthp_reaper"
Talents.bright_wizard[39].description_values = {
	{
		value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
	}
}
Talents.bright_wizard[40].name = "bloodlust_name"
Talents.bright_wizard[40].description = "bloodlust_desc_3"
Talents.bright_wizard[40].buffs[1] = "rebalthp_bloodlust"
