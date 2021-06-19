return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`rebalthp` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("rebalthp", {
			mod_script       = "scripts/mods/rebalthp/rebalthp",
			mod_data         = "scripts/mods/rebalthp/rebalthp_data",
			mod_localization = "scripts/mods/rebalthp/rebalthp_localization",
		})
	end,
	packages = {
		"resource_packages/rebalthp/rebalthp",
	},
}
