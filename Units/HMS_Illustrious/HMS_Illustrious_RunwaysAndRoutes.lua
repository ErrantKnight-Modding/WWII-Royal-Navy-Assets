-- ============================================================================
-- HMS Illustrious (87) - Runways, Landing Strip, Taxi Routes & Arresting Gear
-- 12 Aircraft Park: Shifted back 1 row, Center set back 1m, Outer 4.0 deg inward
-- Local Coordinate System (LCS):
--   X: Longitudinal (+X = Bow / Forward, -X = Stern / Aft)
--   Y: Vertical (+Y = Altitude above waterline / Deck level)
--   Z: Lateral (+Z = Starboard / Right, -Z = Port / Left)
-- ============================================================================

local deck_level = 12.30       -- Flat landing & aft deck elevation (m)
local fwd_deck_level = 12.30   -- Forward flight deck elevation (m)
local cable_level = 12.45     -- Cable elevation above deck for hook physics

-- ############################################################################
-- ###                              RUNWAYS                                 ###
-- ############################################################################
GT.RunWays = {
    -- 1. Landing Strip Definition (FIRST entry in table - Mandatory)
    {
        { -40.0, deck_level, 0.0 },
        360.0, 115.0, 15.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5
    },
    -- 2. Primary Takeoff Runway (RunwayIdx = 1)
    { { -31.0, deck_level, 0.0 }, 360.0, 137.0, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },

    -- ========================================================================
    -- ROW 1 (Spots 1, 2, 3)
    -- ========================================================================
    -- PRK  1: Row 1 Center (X =  -52.5m, Z =  0.0m, Roll = 158.5m)
    { {  -52.5, deck_level,  0.0 }, 360.0, 158.5, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  2: Row 1 Port   (X =  -57.0m, Z =  -6.8m, Roll = 163.0m, +4.0 deg inward)
    { {  -57.0, deck_level,  -6.8 }, 360.0, 163.0, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  3: Row 1 Stbd   (X =  -57.0m, Z =   6.8m, Roll = 163.0m, -4.0 deg inward)
    { {  -57.0, deck_level,   6.8 }, 360.0, 163.0, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- ========================================================================
    -- ROW 2 (Spots 4, 5, 6)
    -- ========================================================================
    -- PRK  4: Row 2 Center (X =  -65.0m, Z =  0.0m, Roll = 171.0m)
    { {  -65.0, deck_level,  0.0 }, 360.0, 171.0, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  5: Row 2 Port   (X =  -69.5m, Z =  -6.8m, Roll = 175.5m, +4.0 deg inward)
    { {  -69.5, deck_level,  -6.8 }, 360.0, 175.5, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  6: Row 2 Stbd   (X =  -69.5m, Z =   6.8m, Roll = 175.5m, -4.0 deg inward)
    { {  -69.5, deck_level,   6.8 }, 360.0, 175.5, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- ========================================================================
    -- ROW 3 (Spots 7, 8, 9)
    -- ========================================================================
    -- PRK  7: Row 3 Center (X =  -77.5m, Z =  0.0m, Roll = 183.5m)
    { {  -77.5, deck_level,  0.0 }, 360.0, 183.5, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  8: Row 3 Port   (X =  -82.0m, Z =  -6.8m, Roll = 188.0m, +4.0 deg inward)
    { {  -82.0, deck_level,  -6.8 }, 360.0, 188.0, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  9: Row 3 Stbd   (X =  -82.0m, Z =   6.8m, Roll = 188.0m, -4.0 deg inward)
    { {  -82.0, deck_level,   6.8 }, 360.0, 188.0, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- ========================================================================
    -- ROW 4 (Spots 10, 11, 12)
    -- ========================================================================
    -- PRK 10: Row 4 Center (X =  -90.0m, Z =  0.0m, Roll = 196.0m)
    { {  -90.0, deck_level,  0.0 }, 360.0, 196.0, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK 11: Row 4 Port   (X =  -94.5m, Z =  -6.8m, Roll = 200.5m, +4.0 deg inward)
    { {  -94.5, deck_level,  -6.8 }, 360.0, 200.5, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK 12: Row 4 Stbd   (X =  -94.5m, Z =   6.8m, Roll = 200.5m, -4.0 deg inward)
    { {  -94.5, deck_level,   6.8 }, 360.0, 200.5, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
}

GT.RunWays.RunwaysNumber = #GT.RunWays

-- ############################################################################
-- ###                          ARRESTING GEARS                             ###
-- ############################################################################
GT.ArrestingGears = {
    { Left = { pos = {-72.0, cable_level, -11.5} }, Right = { pos = {-72.0, cable_level, 11.5} } }, -- Wire 1
    { Left = { pos = {-64.0, cable_level, -11.5} }, Right = { pos = {-64.0, cable_level, 11.5} } }, -- Wire 2
    { Left = { pos = {-56.0, cable_level, -11.5} }, Right = { pos = {-56.0, cable_level, 11.5} } }, -- Wire 3
    { Left = { pos = {-48.0, cable_level, -11.5} }, Right = { pos = {-48.0, cable_level, 11.5} } }, -- Wire 4
}

GT.ArrestingGears.ArrestingGearsNumber = #GT.ArrestingGears

-- ############################################################################
-- ###             TAXI FOR TAKEOFF (SPAWN POINTS & TO ROUTES)              ###
-- ############################################################################
GT.TaxiForTORoutes = {
    -- ========================================================================
    -- ROW 1 (Spots 1, 2, 3)
    -- ========================================================================
    { -- Spot  1: Row 1 Center (PRK  1, X =  -52.5m, Z = 0.0m, straight roll)
        RunwayIdx = 1,
        Points = {
            {{  -52.5, deck_level,  0.0 }, 1.0, 20.0},
            {{  -44.2, deck_level,  0.0 }, 3.0},
            {{  -36.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot  2: Row 1 Port (PRK  2, X =  -57.0m, Z =  -6.8m, +4.0 deg inward)
        RunwayIdx = 1,
        Points = {
            {{  -57.0, deck_level,  -6.8 }, 1.0, 20.0},
            {{  -51.0, deck_level, -6.38 }, 3.0},
            {{  -42.0, deck_level, -6.38 }, 3.0},
            {{  -38.0, deck_level,  -3.0 }, 3.0},
            {{  -36.0, deck_level,   0.0 }, 3.0},
        }
    },
    { -- Spot  3: Row 1 Starboard (PRK  3, X =  -57.0m, Z =   6.8m, -4.0 deg inward)
        RunwayIdx = 1,
        Points = {
            {{  -57.0, deck_level,   6.8 }, 1.0, 20.0},
            {{  -51.0, deck_level,  6.38 }, 3.0},
            {{  -42.0, deck_level,  6.38 }, 3.0},
            {{  -38.0, deck_level,   3.0 }, 3.0},
            {{  -36.0, deck_level,   0.0 }, 3.0},
        }
    },
    -- ========================================================================
    -- ROW 2 (Spots 4, 5, 6)
    -- ========================================================================
    { -- Spot  4: Row 2 Center (PRK  4, X =  -65.0m, Z = 0.0m, straight roll)
        RunwayIdx = 1,
        Points = {
            {{  -65.0, deck_level,  0.0 }, 1.0, 20.0},
            {{  -50.5, deck_level,  0.0 }, 3.0},
            {{  -36.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot  5: Row 2 Port (PRK  5, X =  -69.5m, Z =  -6.8m, +4.0 deg inward)
        RunwayIdx = 1,
        Points = {
            {{  -69.5, deck_level,  -6.8 }, 1.0, 20.0},
            {{  -63.5, deck_level, -6.38 }, 3.0},
            {{  -42.0, deck_level, -6.38 }, 3.0},
            {{  -38.0, deck_level,  -3.0 }, 3.0},
            {{  -36.0, deck_level,   0.0 }, 3.0},
        }
    },
    { -- Spot  6: Row 2 Starboard (PRK  6, X =  -69.5m, Z =   6.8m, -4.0 deg inward)
        RunwayIdx = 1,
        Points = {
            {{  -69.5, deck_level,   6.8 }, 1.0, 20.0},
            {{  -63.5, deck_level,  6.38 }, 3.0},
            {{  -42.0, deck_level,  6.38 }, 3.0},
            {{  -38.0, deck_level,   3.0 }, 3.0},
            {{  -36.0, deck_level,   0.0 }, 3.0},
        }
    },
    -- ========================================================================
    -- ROW 3 (Spots 7, 8, 9)
    -- ========================================================================
    { -- Spot  7: Row 3 Center (PRK  7, X =  -77.5m, Z = 0.0m, straight roll)
        RunwayIdx = 1,
        Points = {
            {{  -77.5, deck_level,  0.0 }, 1.0, 20.0},
            {{  -56.8, deck_level,  0.0 }, 3.0},
            {{  -36.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot  8: Row 3 Port (PRK  8, X =  -82.0m, Z =  -6.8m, +4.0 deg inward)
        RunwayIdx = 1,
        Points = {
            {{  -82.0, deck_level,  -6.8 }, 1.0, 20.0},
            {{  -76.0, deck_level, -6.38 }, 3.0},
            {{  -42.0, deck_level, -6.38 }, 3.0},
            {{  -38.0, deck_level,  -3.0 }, 3.0},
            {{  -36.0, deck_level,   0.0 }, 3.0},
        }
    },
    { -- Spot  9: Row 3 Starboard (PRK  9, X =  -82.0m, Z =   6.8m, -4.0 deg inward)
        RunwayIdx = 1,
        Points = {
            {{  -82.0, deck_level,   6.8 }, 1.0, 20.0},
            {{  -76.0, deck_level,  6.38 }, 3.0},
            {{  -42.0, deck_level,  6.38 }, 3.0},
            {{  -38.0, deck_level,   3.0 }, 3.0},
            {{  -36.0, deck_level,   0.0 }, 3.0},
        }
    },
    -- ========================================================================
    -- ROW 4 (Spots 10, 11, 12)
    -- ========================================================================
    { -- Spot 10: Row 4 Center (PRK 10, X =  -90.0m, Z = 0.0m, straight roll)
        RunwayIdx = 1,
        Points = {
            {{  -90.0, deck_level,  0.0 }, 1.0, 20.0},
            {{  -63.0, deck_level,  0.0 }, 3.0},
            {{  -36.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot 11: Row 4 Port (PRK 11, X =  -94.5m, Z =  -6.8m, +4.0 deg inward)
        RunwayIdx = 1,
        Points = {
            {{  -94.5, deck_level,  -6.8 }, 1.0, 20.0},
            {{  -88.5, deck_level, -6.38 }, 3.0},
            {{  -42.0, deck_level, -6.38 }, 3.0},
            {{  -38.0, deck_level,  -3.0 }, 3.0},
            {{  -36.0, deck_level,   0.0 }, 3.0},
        }
    },
    { -- Spot 12: Row 4 Starboard (PRK 12, X =  -94.5m, Z =   6.8m, -4.0 deg inward)
        RunwayIdx = 1,
        Points = {
            {{  -94.5, deck_level,   6.8 }, 1.0, 20.0},
            {{  -88.5, deck_level,  6.38 }, 3.0},
            {{  -42.0, deck_level,  6.38 }, 3.0},
            {{  -38.0, deck_level,   3.0 }, 3.0},
            {{  -36.0, deck_level,   0.0 }, 3.0},
        }
    },
}

GT.TaxiForTORoutes.RoutesForTONumber = #GT.TaxiForTORoutes

GT.TaxiRoutes = {
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 45.0, deck_level, -6.0 }, 3.0}, {{ 78.0, deck_level, -8.0 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 42.0, deck_level, -6.0 }, 3.0}, {{ 70.0, deck_level, -8.5 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 38.0, deck_level, -6.0 }, 3.0}, {{ 62.0, deck_level, -8.5 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 35.0, deck_level, -7.0 }, 3.0}, {{ 54.0, deck_level, -9.0 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 33.0, deck_level, -7.0 }, 3.0}, {{ 46.0, deck_level, -9.0 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 38.0, deck_level, -9.5 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 45.0, deck_level,  6.0 }, 3.0}, {{ 78.0, deck_level,  8.0 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 42.0, deck_level,  6.0 }, 3.0}, {{ 70.0, deck_level,  8.5 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 38.0, deck_level,  6.0 }, 3.0}, {{ 62.0, deck_level,  8.5 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 38.0, deck_level,  7.0 }, 3.0}, {{ 54.0, deck_level,  9.0 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 36.0, deck_level,  7.0 }, 3.0}, {{ 46.0, deck_level,  9.0 }, 1.5, 300.0} },
    { {{ 0.0, deck_level, 0.0 }, 4.0}, {{ 25.0, deck_level, 0.0 }, 4.0}, {{ 38.0, deck_level,  9.5 }, 1.5, 300.0} },
}
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes

