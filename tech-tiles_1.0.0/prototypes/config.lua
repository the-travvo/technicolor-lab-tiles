
-- clr_values stores the gradation level of the color, 
-- for example 64 colors --> four values for each color band 
-- --> on scale of 0 to 1, will need values 0, 0.333, 0.667, 1.
-- --> in HEX, 00, 55, AA, FF
return {
    clr_val2 = {
        c0 = {val = 0.00, name = "00"},
        c1 = {val = 1.00, name = "FF"}
    },
    clr_val3 = {
        c0 = {val = 0.00, name = "00"},
        c1 = {val = 0.50, name = "80"},
        c2 = {val = 1.00, name = "FF"}
    },
    clr_val4 = {
        c0 = {val = 0.000, name = "00"},
        c1 = {val = 0.333, name = "55"},
        c2 = {val = 0.667, name = "AA"},
        c3 = {val = 1.000, name = "FF"}
    },
    clr_val5 = {
        c0 = {val = 0.00, name = "00"},
        c1 = {val = 0.25, name = "40"},
        c2 = {val = 0.50, name = "80"},
        c3 = {val = 0.75, name = "C0"},
        c4 = {val = 1.00, name = "FF"}
    }
}