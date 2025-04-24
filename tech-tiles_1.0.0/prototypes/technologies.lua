local config = require("prototypes.config")

---@param prereqs string
---@return data.TechnologyPrototype
local function tech(prereqs)
    ---@type data.TechnologyPrototype
    local techno = {
        type = 'technology',
        name = 'tech-tiles',
        icons = {
            {
                -- plastic pack modeled by travvo in paint3d lol,
                -- droplets are reprocessed copies of the 64x64 lubricant icon (c) WUBE
                -- shadow done poorly in paint3d
                -- all assembled and sized using python PIL
                icon = "__tech-tiles__/graphics/Pigment_cartridge_drops_med.png",
                icon_size = 128,
            },
        },
        prerequisites = prereqs,
        unit = {
            count = 50,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack",   1},
                {"chemical-science-pack",   1},
                },
            time = 60,
        },
        order = "a-a-a",
        effects = {},
    }
    if settings.startup['tech-tiles-recipe-level'].value == "Involved" then
        techno.effects = {
            {type = "unlock-recipe", recipe = "tech-tile-pigment-pack"}
        }
    end
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
    for r_ind,r_chan in pairs(clr_values) do
        for g_ind,g_chan in pairs(clr_values) do
            for b_ind,b_chan in pairs(clr_values) do
                clr_name = r_chan.name..g_chan.name..b_chan.name
                clr_val = {r = r_chan.val, g = g_chan.val, b = b_chan.val, a = 1}
                table.insert(techno.effects, {type = "unlock-recipe", recipe = "tech-tile-"..clr_name})
            end
        end
    end
    return(techno)
end

-- Adjusts based on whether running Space Age with 'involved' level tech
if settings.startup['tech-tiles-recipe-level'].value == "Involved" and feature_flags.space_travel then
    data:extend({tech({"lithium-processing"})})
else
    data:extend({tech({"advanced-oil-processing","concrete"})})
end