-- ============================================================================
-- Royal Navy Fire Control Directors & Searchlight Tracking Stations
-- Standardized DCS GT_t.WS_t Mount Templates
--
-- HISTORICAL & TECHNICAL SOURCES:
-- 1. Hodges, Peter (1979). "The Big Gun: Battleship Main Armament 1860-1945".
--    - Admiralty Fire Control Table (AFCT) Mk I, 15-ft / 40-ft rangefinders.
--    - Director Control Tower (DCT) traverse mechanisms and gyro stabilization.
-- 2. Campbell, John (1985). "Naval Weapons of World War Two". Naval Institute Press.
--    - Type 284 Gunnery Radar (50 cm, 600 MHz) fitted to Main Battery DCT (1940-1941).
--    - Type 285 AA/Secondary Fire Control Radar (50 cm, 600 MHz) fitted to HACS & 6" DCTs.
-- 3. Friedman, Norman (2014). "Naval Anti-Aircraft Guns and Gunnery". Seaforth Publishing.
--    - High Angle Control System (HACS) Mk III/IV computation delays and tachymetric tracking.
-- ============================================================================

-- Ensure DCS global weapon station template table exists
GT_t = GT_t or {}
GT_t.WS_t = GT_t.WS_t or {}
GT_t.LN_t = GT_t.LN_t or {}

-- ============================================================================
-- 1. Main Battery Director Control Tower (16-inch BL Mk I DCT)
-- ============================================================================
-- Fitted with Admiralty Fire Control Table (AFCT) Mk I optical rangefinder
-- and Type 284 Gunnery Radar (50 cm, 600 MHz) for surface ranging and bearing.
-- Controls 16-inch Main Battery Turrets A, B, and X.
-- Provides target acquisition for surface combat and shore bombardment (Fire at Point).
GT_t.WS_t.UK_DCT_Main_BL_16in = {
    name = "UK_DCT_Main_BL_16in",
    omegaY = 0.4,                  -- ~23 deg/s powered slewing
    omegaZ = 0.4,                  -- Internal optical depression/elevation
    pidY = {p=100, i=0.05, d=12, inn = 50},
    pidZ = {p=100, i=0.05, d=12, inn = 50},
    reference_angle_Z = math.rad(0),
    moveable = true,
    pos = {0.0, 0.0, 0.0},
    drawArgument2 = -1,            -- Azimuth rotation only (housing has no 3D pitch joint)
    LN = {
        [1] = {
            type = wsType_Radar_MissGun or 103, -- Multi-mode naval gun & surface fire control radar
            frequencyRange = {0.5e9, 0.6e9},    -- Type 284 50 cm band (500-600 MHz)
            distanceMin = 100,
            distanceMax = 40000,   -- 40 km tracking horizon
            reactionTime = 1.0,    -- 1.0 s optical/radar calculation window
            reflection_limit = 0.05,
            ECM_K = 0.5,
            min_trg_alt = -1,      -- Surface engagement at sea level (0 m) and low shorelines
            max_trg_alt = 15000,   -- Enables tracking targets on elevated coastal terrain
            max_number_of_missiles_channels = 6,
            beamWidth = math.rad(90),
            sensor = {},
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_DCT_Main_BL_16in.LN[1].sensor, GT_t.WSN_t[0])

-- ============================================================================
-- 2. Secondary Battery Director Control Tower (6-inch BL Mk XXII DCT)
-- ============================================================================
-- Director Control Tower Mk IV fitted with Type 285 ranging radar (600 MHz).
-- Controls Port and Starboard 6-inch Mark XXII twin secondary batteries.
GT_t.WS_t.UK_DCT_Secondary_MkIV = {
    name = "UK_DCT_Secondary_MkIV",
    omegaY = 0.4,                  -- ~23 deg/s powered slewing
    omegaZ = 0.4,
    pidY = {p=100, i=0.05, d=12, inn = 50},
    pidZ = {p=100, i=0.05, d=12, inn = 50},
    reference_angle_Z = math.rad(0),
    moveable = true,
    pos = {0.0, 0.0, 0.0},
    drawArgument2 = -1,            -- Azimuth rotation only
    LN = {
        [1] = {
            type = wsType_Radar_MissGun or 103, -- Multi-mode naval surface fire control radar
            frequencyRange = {0.5e9, 0.6e9},    -- Type 285 50 cm band (500-600 MHz)
            distanceMin = 100,
            distanceMax = 25000,   -- 25 km tracking limit
            reactionTime = 1.0,
            reflection_limit = 0.05,
            ECM_K = 0.5,
            min_trg_alt = -1,
            max_trg_alt = 10000,
            max_number_of_missiles_channels = 6,
            beamWidth = math.rad(90),
            sensor = {},
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_DCT_Secondary_MkIV.LN[1].sensor, GT_t.WSN_t[0])

-- ============================================================================
-- 3. High Angle Control System (HACS Mk III / Mk IV)
-- ============================================================================
-- Dual-purpose High Angle director with Type 285 metric radar.
-- Slaved to 4.7-inch QF Mk VIII High Angle heavy AA mounts.
-- Controls anti-aircraft barrage fire and surface target tracking.
GT_t.WS_t.UK_Director_HACS_MkIII = {
    name = "UK_Director_HACS_MkIII",
    omegaY = 0.8,                  -- ~46 deg/s high-speed anti-air slewing
    omegaZ = 0.8,
    pidY = GT_t.AAA_PIDY,
    pidZ = GT_t.AAA_PIDZ,
    reference_angle_Z = math.rad(0),
    moveable = true,
    pos = {0.0, 0.0, 0.0},
    drawArgument2 = -1,            -- Azimuth rotation only
    LN = {
        [1] = {
            type = wsType_Radar_MissGun or 103, -- Combined air defence & gun fire control
            frequencyRange = {0.5e9, 0.58e9},   -- Type 285 50 cm band (500-600 MHz)
            distanceMin = 100,
            distanceMax = 25000,
            reactionTime = 1.0,
            reflection_limit = 0.05,
            ECM_K = 0.5,
            min_trg_alt = -1,      -- Enables surface engagement as well as aerial
            max_trg_alt = 15000,
            max_number_of_missiles_channels = 2,
            beamWidth = math.rad(90),
            sensor = {},
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_Director_HACS_MkIII.LN[1].sensor, GT_t.WSN_t[0])

-- ============================================================================
-- 4. Fighting Searchlights: 44-inch (112 cm) Projectors (cLauncherSpotlight)
-- ============================================================================
-- Native DCS spotlight weapon launcher (type = 110) modeled on Flakscheinwerfer 37.
-- Provides autonomous nocturnal acquisition, tracking, and target illumination.
-- 2-axis articulation: azimuth fork (Arg 160/162) + elevation drum (Arg 161/163).
GT_t.WS_t.UK_Searchlight_44in = {
    name = "UK_Searchlight_44in",
    omegaY = 1.3962634,            -- ~80 deg/s slew rate (Flakscheinwerfer 37 baseline)
    omegaZ = 1.3962634,
    pidY = {p = 10, i = 0.2, d = 3, inn = 20},
    pidZ = {p = 10, i = 0.2, d = 3, inn = 20},
    moveable = true,
    pos = {0.0, 0.0, 0.0},
    LN = {
        [1] = {
            type = 110,            -- cLauncherSpotlight (DCS Native Searchlight Weapon)
            distanceMin = 50,
            distanceMax = 12000,   -- 12 km effective surface beam range
            distanceMaxAir = 10000,-- 10 km air defence ceiling (matching 4.7" dual-purpose gun)
            reactionTime = 2.0,
            reflection_limit = 0.01,
            min_trg_alt = -1,      -- Enables surface engagement (E-boats, destroyers)
            max_trg_alt = 10000,   -- Air defence coverage
            sightMasterMode = 1,
            sensor = {},
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_Searchlight_44in.LN[1].sensor, GT_t.WSN_t[0])

-- ============================================================================
-- 5. Destroyer Rangefinder Director (Destroyer DCT / Torpedo Director)
-- ============================================================================
-- 3-meter coincidence optical rangefinder atop bridge.
-- Provides surface targeting & bearing tracking for 4.7-inch main battery guns.
GT_t.WS_t.UK_DCT_Destroyer_Optic = {
    name = "UK_DCT_Destroyer_Optic",
    omegaY = 0.4,                  -- ~23 deg/s powered slewing
    omegaZ = 0.4,
    pidY = {p=100, i=0.05, d=12, inn = 50},
    pidZ = {p=100, i=0.05, d=12, inn = 50},
    reference_angle_Z = math.rad(0),
    moveable = true,
    pos = {0.0, 0.0, 0.0},
    drawArgument2 = -1,            -- Azimuth rotation only
    LN = {
        [1] = {
            type = wsType_Radar_MissGun or 103, -- Multi-mode naval gun & surface fire control tracker
            frequencyRange = {0.5e9, 0.6e9},
            distanceMin = 50,
            distanceMax = 25000,   -- 25 km optical horizon tracking limit
            reactionTime = 1.0,    -- 1.0 s calculation delay
            reflection_limit = 0.05,
            ECM_K = 0.5,
            min_trg_alt = -1,      -- Sea-level surface tracking
            max_trg_alt = 10000,
            max_number_of_missiles_channels = 6,
            beamWidth = math.rad(90),
            sensor = {},
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_DCT_Destroyer_Optic.LN[1].sensor, GT_t.WSN_t[0])

-- ============================================================================
-- 6. Pom-Pom Director Tower (PBDT / Director Mk III / Mk IV)
-- ============================================================================
-- Tachymetric optical/radar director dedicated to 2-pdr (40mm) multi-barrel Pom-Pom mounts.
-- Provides rapid lead calculation and target angle transmission for close-in AA defense.
GT_t.WS_t.UK_Director_PomPom_MkIII = {
    name = "UK_Director_PomPom_MkIII",
    omegaY = 1.2,                  -- ~70 deg/s rapid close-in AA tracking
    omegaZ = 1.2,
    pidY = GT_t.AAA_PIDY,
    pidZ = GT_t.AAA_PIDZ,
    reference_angle_Z = math.rad(0),
    moveable = true,
    pos = {0.0, 0.0, 0.0},
    drawArgument2 = -1,            -- Azimuth rotation only
    LN = {
        [1] = {
            type = wsType_Radar_MissGun or 103,
            frequencyRange = {0.5e9, 0.6e9},
            distanceMin = 20,
            distanceMax = 6000,    -- 6 km close-range tracking
            reactionTime = 0.3,    -- Fast tachymetric reaction
            reflection_limit = 0.1,
            ECM_K = 0.5,
            min_trg_alt = -1,
            max_trg_alt = 5000,
            max_number_of_missiles_channels = 1,
            beamWidth = math.rad(90),
            sensor = {},
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_Director_PomPom_MkIII.LN[1].sensor, GT_t.WSN_t[0])

-- Aliases
GT_t.WS_t.UK_Director_PBDT = GT_t.WS_t.UK_Director_PomPom_MkIII
GT_t.WS_t.UK_Director_HACS_MkIV = GT_t.WS_t.UK_Director_HACS_MkIII


