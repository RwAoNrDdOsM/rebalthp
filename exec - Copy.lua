--local mod = get_mod("RegrowthBloodlust")

local string_table = {}

string_table["bloodlust_name"] = "Bloodlust"
string_table["reaper_name"] = "Reaper"
string_table["vanguard_name"] = "Vanguard"

local original_data = {}

--[[
	Hooks
--]]

mod:hook("Localize", function (func, text, ...)
	return string_table[text] or func(text, ...)
end)


--[[
	Callbacks
--]]
-- Called when the checkbox for this mod is unchecked
mod.on_disabled = function(is_first_call)
	for career, value in pairs(original_data.talents) do
		for talent_name, talent in pairs(value) do
			Talents[career][talent_name].name = talent.name
			Talents[career][talent_name].description = talent.description
			if Talents[career][talent_name].buffs then
				Talents[career][talent_name].buffs[1] = talent.buffs[1]
			end
		end
	end
	WeaponTraits.traits.necklace_heal_self_on_heal_other = original_data.weapon_traits.traits.necklace_heal_self_on_heal_other
end

-- Called when the checkbox for this is checked
mod.on_enabled = function(is_first_call)
	if is_first_call then
		original_data.talents = table.clone(Talents)
		original_data.weapon_traits = table.clone(WeaponTraits)
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
				value = buff_tweak_data.trait_necklace_heal_self_on_heal_other.multiplier
			}
		}
	}
	
	Talents.empire_soldier[1].name = "vanguard_name"
	Talents.empire_soldier[1].description = "vanguard_desc"
	Talents.empire_soldier[1].buffs[1] = "vanguard"
	Talents.empire_soldier[2].name = "reaper_name"
	Talents.empire_soldier[2].description = "reaper_desc"
	Talents.empire_soldier[2].buffs[1] = "reaper"
	Talents.empire_soldier[3].name = "bloodlust_name"
	Talents.empire_soldier[3].description = "bloodlust_desc_3"
	Talents.empire_soldier[3].buffs[1] = "bloodlust"

	Talents.empire_soldier[19].name = "vanguard_name"
	Talents.empire_soldier[19].description = "vanguard_desc"
	Talents.empire_soldier[19].buffs[1] = "vanguard"
	Talents.empire_soldier[20].name = "reaper_name"
	Talents.empire_soldier[20].description = "reaper_desc"
	Talents.empire_soldier[20].buffs[1] = "reaper"
	Talents.empire_soldier[21].name = "bloodlust_name"
	Talents.empire_soldier[21].description = "bloodlust_desc_3"
	Talents.empire_soldier[21].buffs[1] = "bloodlust"

	Talents.empire_soldier[38].name = "vanguard_name"
	Talents.empire_soldier[38].description = "vanguard_desc"
	Talents.empire_soldier[38].buffs[1] = "vanguard"
	Talents.empire_soldier[39].name = "reaper_name"
	Talents.empire_soldier[39].description = "reaper_desc"
	Talents.empire_soldier[39].buffs[1] = "reaper"
	Talents.empire_soldier[40].name = "bloodlust_name"
	Talents.empire_soldier[40].description = "bloodlust_desc_3"
	Talents.empire_soldier[40].buffs[1] = "bloodlust"

	Talents.empire_soldier[57].name = "vanguard_name"
	Talents.empire_soldier[57].description = "vanguard_desc"
	Talents.empire_soldier[57].buffs[1] = "vanguard"
	Talents.empire_soldier[58].name = "reaper_name"
	Talents.empire_soldier[58].description = "reaper_desc"
	Talents.empire_soldier[58].buffs[1] = "reaper"
	Talents.empire_soldier[59].name = "bloodlust_name"
	Talents.empire_soldier[59].description = "bloodlust_desc_3"
	Talents.empire_soldier[59].buffs[1] = "bloodlust"


	Talents.dwarf_ranger[1].name = "vanguard_name"
	Talents.dwarf_ranger[1].description = "vanguard_desc"
	Talents.dwarf_ranger[1].buffs[1] = "vanguard"
	Talents.dwarf_ranger[2].name = "reaper_name"
	Talents.dwarf_ranger[2].description = "reaper_desc"
	Talents.dwarf_ranger[2].buffs[1] = "reaper"
	Talents.dwarf_ranger[3].name = "bloodlust_name"
	Talents.dwarf_ranger[3].description = "bloodlust_desc_3"
	Talents.dwarf_ranger[3].buffs[1] = "bloodlust"

	Talents.dwarf_ranger[19].name = "vanguard_name"
	Talents.dwarf_ranger[19].description = "vanguard_desc"
	Talents.dwarf_ranger[19].buffs[1] = "vanguard"
	Talents.dwarf_ranger[20].name = "reaper_name"
	Talents.dwarf_ranger[20].description = "reaper_desc"
	Talents.dwarf_ranger[20].buffs[1] = "reaper"
	Talents.dwarf_ranger[21].name = "bloodlust_name"
	Talents.dwarf_ranger[21].description = "bloodlust_desc_3"
	Talents.dwarf_ranger[21].buffs[1] = "bloodlust"

	Talents.dwarf_ranger[38].name = "vanguard_name"
	Talents.dwarf_ranger[38].description = "vanguard_desc"
	Talents.dwarf_ranger[38].buffs[1] = "vanguard"
	Talents.dwarf_ranger[39].name = "reaper_name"
	Talents.dwarf_ranger[39].description = "reaper_desc"
	Talents.dwarf_ranger[39].buffs[1] = "reaper"
	Talents.dwarf_ranger[40].name = "bloodlust_name"
	Talents.dwarf_ranger[40].description = "bloodlust_desc_3"
	Talents.dwarf_ranger[40].buffs[1] = "bloodlust"

	Talents.dwarf_ranger[57].name = "vanguard_name"
	Talents.dwarf_ranger[57].description = "vanguard_desc"
	Talents.dwarf_ranger[57].buffs[1] = "vanguard"
	Talents.dwarf_ranger[58].name = "reaper_name"
	Talents.dwarf_ranger[58].description = "reaper_desc"
	Talents.dwarf_ranger[58].buffs[1] = "reaper"
	Talents.dwarf_ranger[59].name = "bloodlust_name"
	Talents.dwarf_ranger[59].description = "bloodlust_desc_3"
	Talents.dwarf_ranger[59].buffs[1] = "bloodlust"


	Talents.wood_elf[1].name = "vanguard_name"
	Talents.wood_elf[1].description = "vanguard_desc"
	Talents.wood_elf[1].buffs[1] = "vanguard"
	Talents.wood_elf[2].name = "reaper_name"
	Talents.wood_elf[2].description = "reaper_desc"
	Talents.wood_elf[2].buffs[1] = "reaper"
	Talents.wood_elf[3].name = "bloodlust_name"
	Talents.wood_elf[3].description = "bloodlust_desc_3"
	Talents.wood_elf[3].buffs[1] = "bloodlust"

	Talents.wood_elf[19].name = "vanguard_name"
	Talents.wood_elf[19].description = "vanguard_desc"
	Talents.wood_elf[19].buffs[1] = "vanguard"
	Talents.wood_elf[20].name = "reaper_name"
	Talents.wood_elf[20].description = "reaper_desc"
	Talents.wood_elf[20].buffs[1] = "reaper"
	Talents.wood_elf[21].name = "bloodlust_name"
	Talents.wood_elf[21].description = "bloodlust_desc_3"
	Talents.wood_elf[21].buffs[1] = "bloodlust"

	Talents.wood_elf[38].name = "vanguard_name"
	Talents.wood_elf[38].description = "vanguard_desc"
	Talents.wood_elf[38].buffs[1] = "vanguard"
	Talents.wood_elf[39].name = "reaper_name"
	Talents.wood_elf[39].description = "reaper_desc"
	Talents.wood_elf[39].buffs[1] = "reaper"
	Talents.wood_elf[40].name = "bloodlust_name"
	Talents.wood_elf[40].description = "bloodlust_desc_3"
	Talents.wood_elf[40].buffs[1] = "bloodlust"

	Talents.witch_hunter[1].name = "vanguard_name"
	Talents.witch_hunter[1].description = "vanguard_desc"
	Talents.witch_hunter[1].buffs[1] = "vanguard"
	Talents.witch_hunter[2].name = "reaper_name"
	Talents.witch_hunter[2].description = "reaper_desc"
	Talents.witch_hunter[2].buffs[1] = "reaper"
	Talents.witch_hunter[3].name = "bloodlust_name"
	Talents.witch_hunter[3].description = "bloodlust_desc_3"
	Talents.witch_hunter[3].buffs[1] = "bloodlust"

	Talents.witch_hunter[19].name = "vanguard_name"
	Talents.witch_hunter[19].description = "vanguard_desc"
	Talents.witch_hunter[19].buffs[1] = "vanguard"
	Talents.witch_hunter[20].name = "reaper_name"
	Talents.witch_hunter[20].description = "reaper_desc"
	Talents.witch_hunter[20].buffs[1] = "reaper"
	Talents.witch_hunter[21].name = "bloodlust_name"
	Talents.witch_hunter[21].description = "bloodlust_desc_3"
	Talents.witch_hunter[21].buffs[1] = "bloodlust"

	Talents.witch_hunter[38].name = "vanguard_name"
	Talents.witch_hunter[38].description = "vanguard_desc"
	Talents.witch_hunter[38].buffs[1] = "vanguard"
	Talents.witch_hunter[39].name = "reaper_name"
	Talents.witch_hunter[39].description = "reaper_desc"
	Talents.witch_hunter[39].buffs[1] = "reaper"
	Talents.witch_hunter[40].name = "bloodlust_name"
	Talents.witch_hunter[40].description = "bloodlust_desc_3"
	Talents.witch_hunter[40].buffs[1] = "bloodlust"
	

	Talents.bright_wizard[1].name = "vanguard_name"
	Talents.bright_wizard[1].description = "vanguard_desc"
	Talents.bright_wizard[1].buffs[1] = "vanguard"
	Talents.bright_wizard[2].name = "reaper_name"
	Talents.bright_wizard[2].description = "reaper_desc"
	Talents.bright_wizard[2].buffs[1] = "reaper"
	Talents.bright_wizard[3].name = "bloodlust_name"
	Talents.bright_wizard[3].description = "bloodlust_desc_3"
	Talents.bright_wizard[3].buffs[1] = "bloodlust"

	Talents.bright_wizard[19].name = "vanguard_name"
	Talents.bright_wizard[19].description = "vanguard_desc"
	Talents.bright_wizard[19].buffs[1] = "vanguard"
	Talents.bright_wizard[20].name = "reaper_name"
	Talents.bright_wizard[20].description = "reaper_desc"
	Talents.bright_wizard[20].buffs[1] = "reaper"
	Talents.bright_wizard[21].name = "bloodlust_name"
	Talents.bright_wizard[21].description = "bloodlust_desc_3"
	Talents.bright_wizard[21].buffs[1] = "bloodlust"

	Talents.bright_wizard[38].name = "vanguard_name"
	Talents.bright_wizard[38].description = "vanguard_desc"
	Talents.bright_wizard[38].buffs[1] = "vanguard"
	Talents.bright_wizard[39].name = "reaper_name"
	Talents.bright_wizard[39].description = "reaper_desc"
	Talents.bright_wizard[39].buffs[1] = "reaper"
	Talents.bright_wizard[40].name = "bloodlust_name"
	Talents.bright_wizard[40].description = "bloodlust_desc_3"
	Talents.bright_wizard[40].buffs[1] = "bloodlust"
end
