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


local clr_name
local clr_val
for r_ind,r_chan in pairs(clr_values) do
    for g_ind,g_chan in pairs(clr_values) do
        for b_ind,b_chan in pairs(clr_values) do
            clr_name = r_chan.name..g_chan.name..b_chan.name
            clr_val = {r = r_chan.val, g = g_chan.val, b = b_chan.val, a = 1}
            local tile = util.table.deepcopy(data.raw["tile"]["concrete"])
            tile.name = "tech-tile-"..clr_name
            tile.next_direction = nil
            if settings.startup['tech-tiles-show-beveled-edge'].value == 'Show tile edge' then
                -- Created in Paint3D and heavily edited with python PIL
                tile.variants.material_background.picture = "__tech-tiles__/graphics/terrain4.png"
            else
                tile.variants.material_background.picture = "__tech-tiles__/graphics/terrain.png"
            end
            tile.layer = 127
            tile.variants.empty_transitions = true
            tile.transitions = nil
            tile.transition_merges_with_tile = nil
            tile.tint = clr_val
            tile.map_color = clr_val
            tile.decorative_removal_probability = 1
            tile.minable = {
                result = "tech-tile-"..clr_name,
                count = 1,
                mining_time = 1,
            }
            tile.walking_speed_modifier = 1.8
            tile.max_health = 1000
            data:extend{tile}
        end
    end
end