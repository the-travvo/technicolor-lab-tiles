data:extend{
    {
        name = 'tech-tiles-number-of-tiles',
        type = 'int-setting',
        setting_type = "startup",
        allowed_values = { 8, 27, 64, 125 },
        default_value = 125,
        order = 'ba',
    },
    {
        name = 'tech-tiles-recipe-level',
        type = 'string-setting',
        setting_type = 'startup',
        allowed_values = { 'Simple', 'Involved'},
        default_value = "Involved",
        order = 'aa',
    },
    {
        name = 'tech-tiles-show-beveled-edge',
        type = 'string-setting',
        setting_type = 'startup',
        allowed_values = {'Show tile edge', 'Untextured'},
        default_value = 'Untextured',
        order = 'ca'
    }
}