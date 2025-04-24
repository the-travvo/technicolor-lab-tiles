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

if settings.startup['tech-tiles-recipe-level'].value == "Involved" then
    data:extend({{
        name = 'tech-tile-pigment-pack',
        type = 'item',
        stack_size = 200,
        -- travvo OC icon made in Paint3D, yes it's trash
        icon = "__tech-tiles__/graphics/pigment_pack_icon.png",
        icon_size = 64,
        order = "b-b-b",
        subgroup = "tech-tiles-pigment", 
    }})
end

local clr_name
local clr_val
local i = 0
local pad
for r_ind,r_chan in pairs(clr_values) do
    for g_ind,g_chan in pairs(clr_values) do
        for b_ind,b_chan in pairs(clr_values) do
            clr_name = r_chan.name..g_chan.name..b_chan.name
            clr_val = {r = r_chan.val, g = g_chan.val, b = b_chan.val, a = 1}

            if i < 10 then pad = "00" elseif i < 100 then pad = "0" else pad = "" end
            
            local item = util.table.deepcopy(data.raw["item"]["refined-concrete"])
            item.name = "tech-tile-"..clr_name
            item.icons = {
                {
                    -- Created using python PIL
                    icon = "__tech-tiles__/graphics/icon.png",
                    tint = clr_val,
                    icon_size = 64,
                },
            }
            
            item.icon = nil
            item.tint = nil
            item.icon_size = nil
        
            item.order = "c-"..pad..i.."-"..clr_name
            item.subgroup = "tech-tiles"
            item.stack_size = 50
            item.place_as_tile.result = "tech-tile-"..clr_name
            item.weight = item.weight * 4
            i = i + 1
            data:extend({item})
        end
    end
end
