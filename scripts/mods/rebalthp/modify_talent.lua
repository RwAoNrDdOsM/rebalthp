local mod = get_mod("rebalthp")

--Text Localization
mod:add_text("bloodlust_name", "Bloodlust")
mod:add_text("regrowth_name", "Reaper")
mod:add_text("vanguard_name", "Vanguard")
mod:add_text("regrowth_name", "Regrowth")
mod:add_text("rebalthp_regrowth_desc", "Melee critical stikes gives you 1.5 temporary health and melee headshots restore 3.5 temporary health. Mellee critical headshots restore 5 temporary health.")
mod:add_text("smiter_name", "Smiter")
mod:add_text("enhanced_power_name", "Enhanced Power")
mod:add_text("assassin_name", "Assassin")
mod:add_text("bulwark_name", "Bulwark")
mod:add_text("rebalthp_tank_unbalance_desc", "Enemies you stagger take 10%% more damage from all sources for 5 seconds.\n\nDeal 20%% more damage to staggered enemies, increased to 40%% against targets afflicted by more than one stagger effect.")
mod:add_text("rebalthp_finesse_unbalance_desc", "Deal 20%% more damage to staggered enemies.\n\nEach hit against a staggered enemy adds another count of stagger. Headshots instead inflict 40%% bonus damage, as do strikes against enemies afflicted by more than one stagger effect.")

-- Careers
--Huntsman
mod:modify_talent("es_huntsman", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("es_huntsman", 1, 2, {
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
mod:modify_talent("es_huntsman", 1, 3, {
	name = "regrowth_name",
	description = "rebalthp_regrowth_desc",
	buffs = {
		"rebalthp_regrowth"
	},
	description_values = {},
})
mod:modify_talent("es_huntsman", 3, 1, {
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
mod:modify_talent("es_huntsman", 3, 2, {
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
mod:modify_talent("es_huntsman", 3, 3, {
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

--Footknight
mod:modify_talent("es_knight", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("es_knight", 1, 2, {
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
mod:modify_talent("es_knight", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("es_knight", 3, 1, {
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
mod:modify_talent("es_knight", 3, 2, {
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
mod:modify_talent("es_knight", 3, 3, {
	name = "bulwark_name",
	description = "rebalthp_tank_unbalance_desc",
	buffs = {
		"rebalthp_tank_unbalance"
	},
	description_values = {
		{
			value_type = "percent",
			value = 0.1 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].bonus
		},
		{
			value = 5 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].duration
		},
		{
			value_type = "percent",
			value = 0.2 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].display_multiplier
		},
		{
			value_type = "percent",
			value = 0.4 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].max_display_multiplier
		}
	}
})

--Mercenary
mod:modify_talent("es_mercenary", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("es_mercenary", 1, 2, {
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
mod:modify_talent("es_mercenary", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("es_mercenary", 3, 1, {
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
mod:modify_talent("es_mercenary", 3, 2, {
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
mod:modify_talent("es_mercenary", 3, 3, {
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

-- Grail Knight
mod:modify_talent("es_questingknight", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("es_questingknight", 1, 2, {
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
mod:modify_talent("es_questingknight", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("es_questingknight", 3, 1, {
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
mod:modify_talent("es_questingknight", 3, 2, {
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
mod:modify_talent("es_questingknight", 3, 3, {
	name = "bulwark_name",
	description = "rebalthp_tank_unbalance_desc",
	buffs = {
		"rebalthp_tank_unbalance"
	},
	description_values = {
		{
			value_type = "percent",
			value = 0.1 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].bonus
		},
		{
			value = 5 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].duration
		},
		{
			value_type = "percent",
			value = 0.2 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].display_multiplier
		},
		{
			value_type = "percent",
			value = 0.4 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].max_display_multiplier
		}
	}
})

--Ironbreaker
mod:modify_talent("dr_ironbreaker", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("dr_ironbreaker", 1, 2, {
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
mod:modify_talent("dr_ironbreaker", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("dr_ironbreaker", 3, 1, {
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
mod:modify_talent("dr_ironbreaker", 3, 2, {
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
mod:modify_talent("dr_ironbreaker", 3, 3, {
	name = "bulwark_name",
	description = "rebalthp_tank_unbalance_desc",
	buffs = {
		"rebalthp_tank_unbalance"
	},
	description_values = {
		{
			value_type = "percent",
			value = 0.1 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].bonus
		},
		{
			value = 5 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].duration
		},
		{
			value_type = "percent",
			value = 0.2 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].display_multiplier
		},
		{
			value_type = "percent",
			value = 0.4 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].max_display_multiplier
		}
	}
})

--Slayer
mod:modify_talent("dr_slayer", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("dr_slayer", 1, 2, {
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
mod:modify_talent("dr_slayer", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("dr_slayer", 3, 1, {
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
mod:modify_talent("dr_slayer", 3, 2, {
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
mod:modify_talent("dr_slayer", 3, 3, {
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

--Ranger
mod:modify_talent("dr_ranger", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("dr_ranger", 1, 2, {
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
mod:modify_talent("dr_ranger", 1, 3, {
	name = "regrowth_name",
	description = "rebalthp_regrowth_desc",
	buffs = {
		"rebalthp_regrowth"
	},
	description_values = {},
})
mod:modify_talent("dr_ranger", 3, 1, {
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
mod:modify_talent("dr_ranger", 3, 2, {
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
mod:modify_talent("dr_ranger", 3, 3, {
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

--Engineer
mod:modify_talent("dr_engineer", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("dr_engineer", 1, 2, {
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
mod:modify_talent("dr_engineer", 1, 3, {
	name = "regrowth_name",
	description = "rebalthp_regrowth_desc",
	buffs = {
		"rebalthp_regrowth"
	},
	description_values = {},
})
mod:modify_talent("dr_engineer", 3, 1, {
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
mod:modify_talent("dr_engineer", 3, 2, {
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
mod:modify_talent("dr_engineer", 3, 3, {
	name = "bulwark_name",
	description = "rebalthp_tank_unbalance_desc",
	buffs = {
		"rebalthp_tank_unbalance"
	},
	description_values = {
		{
			value_type = "percent",
			value = 0.1 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].bonus
		},
		{
			value = 5 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].duration
		},
		{
			value_type = "percent",
			value = 0.2 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].display_multiplier
		},
		{
			value_type = "percent",
			value = 0.4 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].max_display_multiplier
		}
	}
})

--Shade
mod:modify_talent("we_shade", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("we_shade", 1, 2, {
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
mod:modify_talent("we_shade", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("we_shade", 3, 1, {
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
mod:modify_talent("we_shade", 3, 2, {
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
mod:modify_talent("we_shade", 3, 3, {
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

--Handmaiden
mod:modify_talent("we_maidenguard", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("we_maidenguard", 1, 2, {
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
mod:modify_talent("we_maidenguard", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("we_maidenguard", 3, 1, {
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
mod:modify_talent("we_maidenguard", 3, 2, {
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
mod:modify_talent("we_maidenguard", 3, 3, {
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

--Waywatcher
mod:modify_talent("we_waywatcher", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("we_waywatcher", 1, 2, {
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
mod:modify_talent("we_waywatcher", 1, 3, {
	name = "regrowth_name",
	description = "rebalthp_regrowth_desc",
	buffs = {
		"rebalthp_regrowth"
	},
	description_values = {},
})
mod:modify_talent("we_waywatcher", 3, 1, {
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
mod:modify_talent("we_waywatcher", 3, 2, {
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
mod:modify_talent("we_waywatcher", 3, 3, {
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

-- Sister of the Thorn
mod:modify_talent("we_thornsister", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("we_thornsister", 1, 2, {
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
mod:modify_talent("we_thornsister", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("we_thornsister", 3, 1, {
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
mod:modify_talent("we_thornsister", 3, 2, {
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
mod:modify_talent("we_thornsister", 3, 3, {
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

--Zealot
mod:modify_talent("wh_zealot", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("wh_zealot", 1, 2, {
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
mod:modify_talent("wh_zealot", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("wh_zealot", 3, 1, {
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
mod:modify_talent("wh_zealot", 3, 2, {
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
mod:modify_talent("wh_zealot", 3, 3, {
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

--Bountyhunter
mod:modify_talent("wh_bountyhunter", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("wh_bountyhunter", 1, 2, {
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
mod:modify_talent("wh_bountyhunter", 1, 3, {
	name = "regrowth_name",
	description = "rebalthp_regrowth_desc",
	buffs = {
		"rebalthp_regrowth"
	},
	description_values = {},
})
mod:modify_talent("wh_bountyhunter", 3, 1, {
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
mod:modify_talent("wh_bountyhunter", 3, 2, {
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
mod:modify_talent("wh_bountyhunter", 3, 3, {
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

--Witchhunter
mod:modify_talent("wh_captain", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("wh_captain", 1, 2, {
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
mod:modify_talent("wh_captain", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("wh_captain", 3, 1, {
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
mod:modify_talent("wh_captain", 3, 2, {
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
mod:modify_talent("wh_captain", 3, 3, {
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

--Pyromancer
mod:modify_talent("bw_scholar", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("bw_scholar", 1, 2, {
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
mod:modify_talent("bw_scholar", 1, 3, {
	name = "regrowth_name",
	description = "rebalthp_regrowth_desc",
	buffs = {
		"rebalthp_regrowth"
	},
	description_values = {},
})
mod:modify_talent("bw_scholar", 3, 1, {
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
mod:modify_talent("bw_scholar", 3, 2, {
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
mod:modify_talent("bw_scholar", 3, 3, {
	name = "bulwark_name",
	description = "rebalthp_tank_unbalance_desc",
	buffs = {
		"rebalthp_tank_unbalance"
	},
	description_values = {
		{
			value_type = "percent",
			value = 0.1 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].bonus
		},
		{
			value = 5 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].duration
		},
		{
			value_type = "percent",
			value = 0.2 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].display_multiplier
		},
		{
			value_type = "percent",
			value = 0.4 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].max_display_multiplier
		}
	}
})

--Bright wizard
mod:modify_talent("bw_adept", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("bw_adept", 1, 2, {
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
mod:modify_talent("bw_adept", 1, 3, {
	name = "regrowth_name",
	description = "rebalthp_regrowth_desc",
	buffs = {
		"rebalthp_regrowth"
	},
	description_values = {},
})
mod:modify_talent("bw_adept", 3, 1, {
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
mod:modify_talent("bw_adept", 3, 2, {
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
mod:modify_talent("bw_adept", 3, 3, {
	name = "bulwark_name",
	description = "rebalthp_tank_unbalance_desc",
	buffs = {
		"rebalthp_tank_unbalance"
	},
	description_values = {
		{
			value_type = "percent",
			value = 0.1 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].bonus
		},
		{
			value = 5 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].duration
		},
		{
			value_type = "percent",
			value = 0.2 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].display_multiplier
		},
		{
			value_type = "percent",
			value = 0.4 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].max_display_multiplier
		}
	}
})

--Unchained
mod:modify_talent("bw_unchained", 1, 1, {
	name = "vanguard_name",
	description = "vanguard_desc",
	buffs = {
		"rebalthp_vanguard"
	}
})
mod:modify_talent("bw_unchained", 1, 2, {
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
mod:modify_talent("bw_unchained", 1, 3, {
	name = "bloodlust_name",
	description = "bloodlust_desc_3",
	buffs = {
		"rebalthp_bloodlust"
	}
})
mod:modify_talent("bw_unchained", 3, 1, {
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
mod:modify_talent("bw_unchained", 3, 2, {
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
mod:modify_talent("bw_unchained", 3, 3, {
	name = "bulwark_name",
	description = "rebalthp_tank_unbalance_desc",
	buffs = {
		"rebalthp_tank_unbalance"
	},
	description_values = {
		{
			value_type = "percent",
			value = 0.1 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].bonus
		},
		{
			value = 5 --BuffTemplates.rebalthp_tank_unbalance_buff.buffs[1].duration
		},
		{
			value_type = "percent",
			value = 0.2 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].display_multiplier
		},
		{
			value_type = "percent",
			value = 0.4 --BuffTemplates.rebalthp_tank_unbalance.buffs[1].max_display_multiplier
		}
	}
})