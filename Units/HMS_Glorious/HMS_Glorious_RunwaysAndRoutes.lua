-- ============================================================================
-- HMS Glorious (77) - Runways, Landing Strip, Taxi Routes & Arresting Gear
-- Full Squadron Deck Park: 16 Aircraft (1 on Takeoff Line + 15 in Chevron Park)
-- Local Coordinate System (LCS):
--   X: Longitudinal (+X = Bow / Forward, -X = Stern / Aft)
--   Y: Vertical (+Y = Altitude above waterline / Deck level)
--   Z: Lateral (+Z = Starboard / Right, -Z = Port / Left)
-- ============================================================================

local deck_level = 17.65       -- Flat landing & aft deck elevation (m)
local fwd_deck_level = 18.95   -- Forward flight deck elevation (m)
local cable_level = 17.80     -- Cable elevation above deck for hook physics

-- ############################################################################
-- ###                              RUNWAYS                                 ###
-- ############################################################################
-- In DCS World:
--   Entry 1 in GT.RunWays is reserved exclusively for Landing / Recovery.
--   Entry 2 is the primary takeoff roll runway (RunwayIdx = 1, starts at X = -33.0m).
--   Entries 3..18 define the 16 selectable Parking Spots (PRK 1..16) in the ME.
--   All 16 spots have RunwayIdx = 1, queuing aircraft one-by-one with zero contention.

GT.RunWays = {
    -- 1. Landing Strip Definition (FIRST entry in table - Mandatory)
    {
        { -45.0, deck_level, 0.0 },
        360.0, 110.0, 15.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5
    },
    -- 2. Primary Takeoff Runway (RunwayIdx = 1)
    { { -33.0, deck_level, 0.0 }, 360.0, 151.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },

    -- ========================================================================
    -- SPOT 1: LEAD AIRCRAFT AT TAKEOFF THRESHOLD
    -- ========================================================================
    -- PRK  1: Takeoff Position (X =  -39.0m, Z =  0.0m, Roll = 157.2m)
    { {  -39.0, deck_level,  0.0 }, 360.0, 157.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },

    -- ========================================================================
    -- ROW 1 (Spots 2, 3, 4)
    -- ========================================================================
    -- PRK  2: Row 1 Center (X =  -52.0m, Z =  0.0m, Roll = 170.2m)
    { {  -52.0, deck_level,  0.0 }, 360.0, 170.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  3: Row 1 Port   (X =  -57.0m, Z = -9.0m, Roll = 175.2m, +20 deg chevron)
    { {  -57.0, deck_level, -9.0 }, 360.0, 175.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  4: Row 1 Stbd   (X =  -58.5m, Z =  9.0m, Roll = 176.7m, -20 deg chevron)
    { {  -58.5, deck_level,  9.0 }, 360.0, 176.7, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- ========================================================================
    -- ROW 2 (Spots 5, 6, 7)
    -- ========================================================================
    -- PRK  5: Row 2 Center (X =  -64.0m, Z =  0.0m, Roll = 182.2m)
    { {  -64.0, deck_level,  0.0 }, 360.0, 182.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  6: Row 2 Port   (X =  -69.0m, Z = -9.0m, Roll = 187.2m, +20 deg chevron)
    { {  -69.0, deck_level, -9.0 }, 360.0, 187.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  7: Row 2 Stbd   (X =  -70.5m, Z =  9.0m, Roll = 188.7m, -20 deg chevron)
    { {  -70.5, deck_level,  9.0 }, 360.0, 188.7, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- ========================================================================
    -- ROW 3 (Spots 8, 9, 10)
    -- ========================================================================
    -- PRK  8: Row 3 Center (X =  -76.0m, Z =  0.0m, Roll = 194.2m)
    { {  -76.0, deck_level,  0.0 }, 360.0, 194.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK  9: Row 3 Port   (X =  -81.0m, Z = -9.0m, Roll = 199.2m, +20 deg chevron)
    { {  -81.0, deck_level, -9.0 }, 360.0, 199.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK 10: Row 3 Stbd   (X =  -82.5m, Z =  9.0m, Roll = 200.7m, -20 deg chevron)
    { {  -82.5, deck_level,  9.0 }, 360.0, 200.7, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- ========================================================================
    -- ROW 4 (Spots 11, 12, 13)
    -- ========================================================================
    -- PRK 11: Row 4 Center (X =  -88.0m, Z =  0.0m, Roll = 206.2m)
    { {  -88.0, deck_level,  0.0 }, 360.0, 206.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK 12: Row 4 Port   (X =  -93.0m, Z = -9.0m, Roll = 211.2m, +20 deg chevron)
    { {  -93.0, deck_level, -9.0 }, 360.0, 211.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK 13: Row 4 Stbd   (X =  -94.5m, Z =  9.0m, Roll = 212.7m, -20 deg chevron)
    { {  -94.5, deck_level,  9.0 }, 360.0, 212.7, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- ========================================================================
    -- ROW 5 (Spots 14, 15, 16)
    -- ========================================================================
    -- PRK 14: Row 5 Center (X = -100.0m, Z =  0.0m, Roll = 218.2m)
    { { -100.0, deck_level,  0.0 }, 360.0, 218.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK 15: Row 5 Port   (X = -105.0m, Z = -9.0m, Roll = 223.2m, +20 deg chevron)
    { { -105.0, deck_level, -9.0 }, 360.0, 223.2, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
    -- PRK 16: Row 5 Stbd   (X = -106.5m, Z =  9.0m, Roll = 224.7m, -20 deg chevron)
    { { -106.5, deck_level,  9.0 }, 360.0, 224.7, 10.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
}

GT.RunWays.RunwaysNumber = #GT.RunWays

-- ############################################################################
-- ###                          ARRESTING GEARS                             ###
-- ############################################################################

GT.ArrestingGears = {
    { Left = { pos = {-82.0, cable_level, -11.5} }, Right = { pos = {-82.0, cable_level, 11.5} } }, -- Wire 1
    { Left = { pos = {-74.0, cable_level, -11.5} }, Right = { pos = {-74.0, cable_level, 11.5} } }, -- Wire 2
    { Left = { pos = {-66.0, cable_level, -11.5} }, Right = { pos = {-66.0, cable_level, 11.5} } }, -- Wire 3
    { Left = { pos = {-58.0, cable_level, -11.5} }, Right = { pos = {-58.0, cable_level, 11.5} } }, -- Wire 4
    { Left = { pos = {-50.0, cable_level, -11.5} }, Right = { pos = {-50.0, cable_level, 11.5} } }, -- Wire 5
    { Left = { pos = {-42.0, cable_level, -11.5} }, Right = { pos = {-42.0, cable_level, 11.5} } }, -- Wire 6
}

GT.ArrestingGears.ArrestingGearsNumber = #GT.ArrestingGears

-- ############################################################################
-- ###             TAXI FOR TAKEOFF (SPAWN POINTS & TO ROUTES)              ###
-- ############################################################################
-- 1:1 DIRECT MATCH WITH GT.RunWays:
--   - Spot 1 is lined up right at the takeoff threshold.
--   - Spots 2..16 are arranged in a 5-row interleaved chevron deck park.
--   - All 16 routes end at Hold-Short (X = -38.0m), 5.0m before Runway 1.

GT.TaxiForTORoutes = {
    -- ========================================================================
    -- SPOT 1: LEAD AIRCRAFT AT TAKEOFF THRESHOLD
    -- ========================================================================
    { -- Spot  1: Takeoff Position (PRK  1, X = -39.0m, Z = 0.0m)
        RunwayIdx = 1,
        Points = {
            {{  -39.0, deck_level,  0.0 }, 1.0, 20.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    -- ========================================================================
    -- ROW 1 (Spots 2, 3, 4)
    -- ========================================================================
    { -- Spot  2: Row 1 Center (PRK  2, X =  -52.0m, Z =  0.0m, straight roll)
        RunwayIdx = 1,
        Points = {
            {{  -52.0, deck_level,  0.0 }, 1.0, 20.0},
            {{  -45.0, deck_level,  0.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot  3: Row 1 Port (PRK  3, X =  -57.0m, Z = -9.0m, +20 deg chevron)
        RunwayIdx = 1,
        Points = {
            {{  -57.0, deck_level, -9.0 }, 1.0, 20.0},
            {{  -51.0, deck_level, -5.0 }, 3.0},
            {{  -45.0, deck_level, -2.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot  4: Row 1 Starboard (PRK  4, X =  -58.5m, Z =  9.0m, -20 deg chevron)
        RunwayIdx = 1,
        Points = {
            {{  -58.5, deck_level,  9.0 }, 1.0, 20.0},
            {{  -52.5, deck_level,  5.0 }, 3.0},
            {{  -46.5, deck_level,  2.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    -- ========================================================================
    -- ROW 2 (Spots 5, 6, 7)
    -- ========================================================================
    { -- Spot  5: Row 2 Center (PRK  5, X =  -64.0m, Z =  0.0m, straight roll)
        RunwayIdx = 1,
        Points = {
            {{  -64.0, deck_level,  0.0 }, 1.0, 20.0},
            {{  -51.0, deck_level,  0.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot  6: Row 2 Port (PRK  6, X =  -69.0m, Z = -9.0m, +20 deg chevron)
        RunwayIdx = 1,
        Points = {
            {{  -69.0, deck_level, -9.0 }, 1.0, 20.0},
            {{  -63.0, deck_level, -5.0 }, 3.0},
            {{  -57.0, deck_level, -2.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot  7: Row 2 Starboard (PRK  7, X =  -70.5m, Z =  9.0m, -20 deg chevron)
        RunwayIdx = 1,
        Points = {
            {{  -70.5, deck_level,  9.0 }, 1.0, 20.0},
            {{  -64.5, deck_level,  5.0 }, 3.0},
            {{  -58.5, deck_level,  2.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    -- ========================================================================
    -- ROW 3 (Spots 8, 9, 10)
    -- ========================================================================
    { -- Spot  8: Row 3 Center (PRK  8, X =  -76.0m, Z =  0.0m, straight roll)
        RunwayIdx = 1,
        Points = {
            {{  -76.0, deck_level,  0.0 }, 1.0, 20.0},
            {{  -57.0, deck_level,  0.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot  9: Row 3 Port (PRK  9, X =  -81.0m, Z = -9.0m, +20 deg chevron)
        RunwayIdx = 1,
        Points = {
            {{  -81.0, deck_level, -9.0 }, 1.0, 20.0},
            {{  -75.0, deck_level, -5.0 }, 3.0},
            {{  -69.0, deck_level, -2.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot 10: Row 3 Starboard (PRK 10, X =  -82.5m, Z =  9.0m, -20 deg chevron)
        RunwayIdx = 1,
        Points = {
            {{  -82.5, deck_level,  9.0 }, 1.0, 20.0},
            {{  -76.5, deck_level,  5.0 }, 3.0},
            {{  -70.5, deck_level,  2.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    -- ========================================================================
    -- ROW 4 (Spots 11, 12, 13)
    -- ========================================================================
    { -- Spot 11: Row 4 Center (PRK 11, X =  -88.0m, Z =  0.0m, straight roll)
        RunwayIdx = 1,
        Points = {
            {{  -88.0, deck_level,  0.0 }, 1.0, 20.0},
            {{  -63.0, deck_level,  0.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot 12: Row 4 Port (PRK 12, X =  -93.0m, Z = -9.0m, +20 deg chevron)
        RunwayIdx = 1,
        Points = {
            {{  -93.0, deck_level, -9.0 }, 1.0, 20.0},
            {{  -87.0, deck_level, -5.0 }, 3.0},
            {{  -81.0, deck_level, -2.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot 13: Row 4 Starboard (PRK 13, X =  -94.5m, Z =  9.0m, -20 deg chevron)
        RunwayIdx = 1,
        Points = {
            {{  -94.5, deck_level,  9.0 }, 1.0, 20.0},
            {{  -88.5, deck_level,  5.0 }, 3.0},
            {{  -82.5, deck_level,  2.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    -- ========================================================================
    -- ROW 5 (Spots 14, 15, 16)
    -- ========================================================================
    { -- Spot 14: Row 5 Center (PRK 14, X = -100.0m, Z =  0.0m, straight roll)
        RunwayIdx = 1,
        Points = {
            {{ -100.0, deck_level,  0.0 }, 1.0, 20.0},
            {{  -69.0, deck_level,  0.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot 15: Row 5 Port (PRK 15, X = -105.0m, Z = -9.0m, +20 deg chevron)
        RunwayIdx = 1,
        Points = {
            {{ -105.0, deck_level, -9.0 }, 1.0, 20.0},
            {{  -99.0, deck_level, -5.0 }, 3.0},
            {{  -93.0, deck_level, -2.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
    { -- Spot 16: Row 5 Starboard (PRK 16, X = -106.5m, Z =  9.0m, -20 deg chevron)
        RunwayIdx = 1,
        Points = {
            {{ -106.5, deck_level,  9.0 }, 1.0, 20.0},
            {{ -100.5, deck_level,  5.0 }, 3.0},
            {{  -94.5, deck_level,  2.0 }, 3.0},
            {{  -38.0, deck_level,  0.0 }, 3.0},
        }
    },
}

GT.TaxiForTORoutes.RoutesForTONumber = #GT.TaxiForTORoutes

GT.TaxiRoutes = {
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 45.0, fwd_deck_level, -5.0 }, 3.0}, {{ 65.0, fwd_deck_level, -8.0 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 42.0, fwd_deck_level, -5.0 }, 3.0}, {{ 58.0, fwd_deck_level, -8.5 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 38.0, fwd_deck_level, -5.0 }, 3.0}, {{ 51.0, fwd_deck_level, -8.5 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 35.0, fwd_deck_level, -6.0 }, 3.0}, {{ 44.0, fwd_deck_level, -9.0 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 32.0, fwd_deck_level, -6.0 }, 3.0}, {{ 38.0, fwd_deck_level, -9.0 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 32.0, fwd_deck_level, -9.0 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 45.0, fwd_deck_level,  5.0 }, 3.0}, {{ 65.0, fwd_deck_level,  8.0 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 42.0, fwd_deck_level,  5.0 }, 3.0}, {{ 58.0, fwd_deck_level,  8.5 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 38.0, fwd_deck_level,  5.0 }, 3.0}, {{ 51.0, fwd_deck_level,  8.5 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 38.0, fwd_deck_level,  6.0 }, 3.0}, {{ 44.0, fwd_deck_level,  9.0 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 4.0}, {{ 37.0, fwd_deck_level,  7.0 }, 3.0}, {{ 40.0, fwd_deck_level,  9.5 }, 1.5, 300.0} },
    { {{ -10.0, deck_level, 0.0 }, 4.0}, {{ 25.0, fwd_deck_level, 0.0 }, 3.0}, {{ 36.5, fwd_deck_level,  9.5 }, 1.5, 300.0} },
}
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes

