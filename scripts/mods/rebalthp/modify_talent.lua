local mod = get_mod("rebalthp")

--Text Localization
mod:add_text("bloodlust_name", "Bloodlust")
mod:add_text("reaper_name", "Reaper")
mod:add_text("vanguard_name", "Vanguard")
mod:add_text("regrowth_name", "Regrowth")
mod:add_text("rebalthp_regrowth_desc", "Melee critical stikes gives you 1.5 temporary health and melee headshots restore 3.5 temporary health. Mellee critical headshots restore 5 temporary health.")
mod:add_text("smiter_name", "Smiter")
mod:add_text("enhanced_power_name", "Enhanced Power")
mod:add_text("assassin_name", "Assassin")
mod:add_text("bulwark_name", "Bulwark")
mod:add_text("rebalthp_tank_unbalance_desc", "Enemies you stagger take 10%% more damage from all sources for 5 seconds.\n\nDeal 20%% more damage to staggered enemies, increased to 40%% against targets afflicted by more than one stagger effect.")
mod:add_text("rebalthp_finesse_unbalance_desc", "Deal 20%% more damage to staggered enemies.\n\nEach hit against a staggered enemy adds another count of stagger. Headshots instead inflict 40%% bonus damage, as do strikes against enemies afflicted by more than one stagger effect.")

local talent_first_row = {
	{
		"es_knight",
		"es_mercenary",
		"es_questingknight",
		"dr_ironbreaker",
		"wh_zealot",
		"bw_unchained",
	},
	{
		"es_huntsman",
		"dr_ranger",
		"dr_engineer",
		"wh_captain",
		"bw_scholar",
		"bw_adept",
	},
	{
		"dr_slayer",
		"we_shade",
		"we_maidenguard",
		"we_waywatcher",
		"wh_bountyhunter",
		"we_thornsister",
	},
}

for i=1, #talent_first_row[1] do
	local career = talent_first_row[1][i]
	mod:modify_talent(career, 1, 1, {
		name = "vanguard_name",
		description = "vanguard_desc",
		buffs = {
			"rebalthp_vanguard"
		}
	})
	mod:modify_talent(career, 1, 2, {
		name = "reaper_name",
		description = "reaper_desc",
		buffs = {
			"rebalthp_reaper"
		},
		description_values = {
			{
				value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
			}
		},
	})
	mod:modify_talent(career, 1, 3, {
		name = "bloodlust_name",
		description = "bloodlust_desc_3",
		buffs = {
			"rebalthp_bloodlust"
		}
	})
end
for i=1, #talent_first_row[2] do
	local career = talent_first_row[2][i]
	mod:modify_talent(career, 1, 1, {
		name = "vanguard_name",
		description = "vanguard_desc",
		buffs = {
			"rebalthp_vanguard"
		}
	})
	mod:modify_talent(career, 1, 2, {
		name = "reaper_name",
		description = "reaper_desc",
		buffs = {
			"rebalthp_reaper"
		},
		description_values = {
			{
				value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
			}
		},
	})
	mod:modify_talent(career, 1, 3, {
		name = "regrowth_name",
		description = "rebalthp_regrowth_desc",
		buffs = {
			"rebalthp_regrowth"
		},
		description_values = {},
	})
end
for i=1, #talent_first_row[3] do
	local career = talent_first_row[3][i]
	mod:modify_talent(career, 1, 1, {
		name = "reaper_name",
		description = "reaper_desc",
		buffs = {
			"rebalthp_reaper"
		},
		description_values = {
			{
				value = BuffTemplates.rebalthp_reaper.buffs[1].max_targets
			}
		},
	})
	mod:modify_talent(career, 1, 2, {
		name = "bloodlust_name",
		description = "bloodlust_desc_3",
		buffs = {
			"rebalthp_bloodlust"
		}
	})
	mod:modify_talent(career, 1, 3, {
		name = "regrowth_name",
		description = "rebalthp_regrowth_desc",
		buffs = {
			"rebalthp_regrowth"
		},
		description_values = {},
	})
end

local talent_third_row = {
	{
		"es_mercenary",
		"es_huntsman",
		"dr_ranger",
		"dr_slayer",
		"we_waywatcher",
		"we_shade",
		"we_thornsister",
		"wh_captain",
		"wh_bountyhunter",
		"wh_zealot",
		"bw_scholar",
	},
	{
		"es_knight",
		"es_questingknight",
		"dr_ironbreaker",
		"dr_engineer",
		"we_maidenguard",
		"bw_adept",
		"bw_unchained",
	},
}
for i=1, #talent_third_row[1] do
	local career = talent_third_row[1][i]
	mod:modify_talent(career, 3, 1, {
		name = "smiter_name",
		description = "smiter_unbalance_desc",
		buffs = {
			"rebalthp_smiter_unbalance"
		},
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.rebalthp_smiter_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.rebalthp_smiter_unbalance.buffs[1].max_display_multiplier
			}
		}
	})
	mod:modify_talent(career, 3, 2, {
		name = "assassin_name",
		description = "rebalthp_finesse_unbalance_desc",
		buffs = {
			"rebalthp_finesse_unbalance"
		},
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.rebalthp_tank_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.rebalthp_tank_unbalance.buffs[1].max_display_multiplier
			}
		}
	})
	mod:modify_talent(career, 3, 3, {
		name = "enhanced_power_name",
		description = "power_level_unbalance_desc",
		buffs = {
			"rebalthp_power_level_unbalance"
		},
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.rebalthp_power_level_unbalance.buffs[1].multiplier
			}
		}
	})
end
for i=1, #talent_third_row[2] do
	local career = talent_third_row[2][i]
	mod:modify_talent(career, 3, 1, {
		name = "smiter_name",
		description = "smiter_unbalance_desc",
		buffs = {
			"rebalthp_smiter_unbalance"
		},
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.rebalthp_smiter_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.rebalthp_smiter_unbalance.buffs[1].max_display_multiplier
			}
		}
	})
	mod:modify_talent(career, 3, 2, {
		name = "bulwark_name",
		description = "rebalthp_tank_unbalance_desc",
		buffs = {
			"rebalthp_tank_unbalance"
		},
		description_values = {},
	})
	mod:modify_talent(career, 3, 3, {
		name = "enhanced_power_name",
		description = "power_level_unbalance_desc",
		buffs = {
			"rebalthp_power_level_unbalance"
		},
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.rebalthp_power_level_unbalance.buffs[1].multiplier
			}
		}
	})
end