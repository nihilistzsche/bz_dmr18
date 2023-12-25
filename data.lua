local BZ_DMR_18_Recipes = {}
local blacklist = { ["gold-ingot"] = true }
function bz_dmr18_add_recipes(mod_name)
    log("Adding recipes from "..mod_name)
	if not mods[mod_name] then
		return
	end
    local bz = require("__"..mod_name.."__/me")
	for i, recipe in pairs(bz.recipes) do
		-- add remaining recipes with direct items to find the icons
		if
			data.raw.recipe[recipe]
			and (data.raw.item[recipe] or data.raw.fluid[recipe] or data.raw.tool[recipe])
			and not BZ_DMR_18_Recipes[recipe]
			and not blacklist[recipe]
		then
			local research_level = 1
			for tech, tbl in pairs(data.raw.technology) do
				for _, effect in pairs(tbl.effects or {}) do
					if effect.type == "unlock-recipe" and effect.recipe == recipe then
						research_level = math.min(#tbl.unit.ingredients, 6)
					end
				end
			end
			BZ_DMR_18_Recipes[recipe] = research_level
		end
	end
end

bz_dmr18_add_recipes("bzaluminum")
bz_dmr18_add_recipes("bzgas")
bz_dmr18_add_recipes("bzcarbon")
bz_dmr18_add_recipes("bzchlorine")
bz_dmr18_add_recipes("bzgold")
bz_dmr18_add_recipes("bzlead")
bz_dmr18_add_recipes("bzsilicon")
bz_dmr18_add_recipes("bztin")
bz_dmr18_add_recipes("bztitanium")
bz_dmr18_add_recipes("bztungsten")
bz_dmr18_add_recipes("bzzirconium")

local repl_per_research_level = { "ore", "shape", "alloy", "device4", "device5" }

for recipe, research_level in pairs(BZ_DMR_18_Recipes) do
	log("Adding " .. recipe .. " to dark matter replicators")
	repltech_recipe(recipe, repl_per_research_level[research_level] or "device5")
end

if mods["bzaluminum"] then
	log("Adding aluminum ore to dark matter replicators")
	repltech_ore("aluminum-ore", 1, 6)
end
if mods["bzgas"] then
	log("Adding gas to dark matter replicators")
	repltech_ore("gas", 1, 8)
end
if mods["bzchlorine"] then
	log("Adding salt to dark matter replicators")
	repltech_ore("salt", 1, 3)
end
if mods["bzgold"] then
	log("Adding gold ore to dark matter replicators")
	repltech_ore("gold-ore", 1, 1)
end
if mods["bzlead"] then
	log("Adding lead ore to dark matter replicators")
	repltech_ore("lead-ore", 1, 6)
end
if mods["bztin"] then
	log("Adding tin ore to dark matter replicators")
	repltech_ore("tin-ore", 1, 3)
end
if mods["bztungsten"] then
	log("Adding tungsten ore to dark matter replicators")
	repltech_ore("tungsten-ore", 2, 4)
end
if mods["bzzirconium"] then
	log("Adding zircon to dark matter replicators")
	repltech_ore("zircon", 1, 4)
end
