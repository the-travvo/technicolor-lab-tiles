local config = require("prototypes.config")


local clr_values
local clr_count = settings.startup['tech-tiles-number-of-tiles'].value
if clr_count == 8 then
    clr_values = config.clr_val2
elseif clr_count == 27 then
    clr_values = config.clr_val3
elseif clr_count == 64 then
    clr_values = config.clr_val4
elseif clr_count == 125 then
    clr_values = config.clr_val5
end

-- adjust the recipe of the tiles based on recipe level == Involved, adds other planet mats if Space Age too
local ingreds = {
    {type = "item", name = "uranium-ore", amount = 1},
    {type = "item", name = "refined-concrete", amount = 10},
    {type = "item", name = "plastic-bar", amount = 20},
}
-- for involved, adjust the machine category to either chem plant 
-- or if in Space Age, Biochamber for the pigment pack and then foundry or AM for the tiles
local category = 'crafting'

if settings.startup['tech-tiles-recipe-level'].value == "Involved" then
    
    if mods['space-age'] then
        ingreds = {
            {type = "item", name = "uranium-235", amount = 1},
            {type = "item", name = "refined-concrete", amount = 10},
            {type = "item", name = "plastic-bar", amount = 50},
            {type = "item", name = "tech-tile-pigment-pack", amount = 1},
            {type = "item", name = "carbon-fiber", amount = 10},
        }
        category = 'metallurgy-or-assembling'
        data:extend({{
            type = 'recipe',
            name = 'tech-tile-pigment-pack',
            ingredients = {
                {type = "fluid", name = "light-oil", amount = 10},
                {type = "fluid", name = "sulfuric-acid", amount = 10},
                {type = "item", name = "copper-ore", amount = 1},
                {type = "item", name = "tungsten-ore", amount = 1},
                {type = "item", name = "lithium", amount = 1},
                {type = "item", name = "yumako-seed", amount = 1},
                {type = "item", name = "biter-egg", amount = 1},
                {type = "item", name = "plastic-bar", amount = 1},
            },
            category = 'organic',
            enabled = false,
            results = { {type = "item", name = "tech-tile-pigment-pack", amount = 1} },
            allow_productivity = true,
        }})
    else
        ingreds = {
            {type = "item", name = "uranium-235", amount = 1},
            {type = "item", name = "refined-concrete", amount = 10},
            {type = "item", name = "plastic-bar", amount = 50},
            {type = "item", name = "tech-tile-pigment-pack", amount = 1},
        }
        category = 'chemistry'
        data:extend({{
            type = 'recipe',
            name = 'tech-tile-pigment-pack',
            ingredients = {
                {type = "fluid", name = "light-oil", amount = 10},
                {type = "fluid", name = "sulfuric-acid", amount = 10},
                {type = "item", name = "iron-ore", amount = 1},
                {type = "item", name = "copper-ore", amount = 1},
                {type = "item", name = "coal", amount = 1},
                {type = "item", name = "plastic-bar", amount = 1},
            },
            category = 'chemistry',
            enabled = false,
            results = { {type = "item", name = "tech-tile-pigment-pack", amount = 1} },
            allow_productivity = true,
        }})
    end
end


-- Each unique color needs its own recipe
for r_ind,r_chan in pairs(clr_values) do
    for g_ind,g_chan in pairs(clr_values) do
        for b_ind,b_chan in pairs(clr_values) do
            clr_name = r_chan.name..g_chan.name..b_chan.name
            data:extend({
                {
                    type = "recipe",
                    name = "tech-tile-"..clr_name,
                    enabled = false,
                    ingredients = ingreds,
                    results = { {type = "item", name = "tech-tile-"..clr_name, amount = 10} },
                    energy_required = 1,
                    category = category,
                },
            })
        end
    end
end
