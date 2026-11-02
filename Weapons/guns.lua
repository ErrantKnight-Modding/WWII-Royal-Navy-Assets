-- ============================================================================
-- Royal Navy Naval Artillery & Anti-Aircraft Weapon Systems
-- Standardized DCS GT_t.WS_t Mount Templates & Weapon Registry
-- Naming Convention:
-- (1) Commonly referred to whole-number units: UK_16in_*, UK_6in_*, UK_50cal_*, UK_40mm_*
-- (2) Fractional units converted to whole metric: UK_120mm_* (4.7-inch)
--
-- HISTORICAL & TECHNICAL SOURCES:
-- 1. Campbell, John (1985). "Naval Weapons of World War Two". Naval Institute Press.
--    - Traverse/elevation rates, cycle times, ammunition allocations.
-- 2. DiGiulian, Tony. "Naval Weapons of the World" (NavWeaps.com):
--    - 16"/45 Mk I:      http://www.navweaps.com/Weapons/WNBR_16-45_mk1.php
--    - 6"/50 Mk XXII:    http://www.navweaps.com/Weapons/WNBR_6-50_mk22.php
--    - 4.7"/40 Mk VIII:  http://www.navweaps.com/Weapons/WNBR_47-40_mk8.php
--    - 2-pdr Mk VIII:    http://www.navweaps.com/Weapons/WNBR_2pounder_mkviii.php
--    - 0.50"/62 Mk III:  http://www.navweaps.com/Weapons/WNBR_050-62_mk3.php
-- 3. Hodges, Peter (1979). "The Big Gun: Battleship Main Armament 1860-1945". Conway Maritime Press.
--    - Hydraulic gear speeds, director slaving, transmission dead-times.
-- 4. Friedman, Norman (2014). "Naval Anti-Aircraft Guns and Gunnery". Seaforth Publishing.
--    - HACS III/IV fire-control computation delays, Pom-Pom Director Mk III.
-- 5. Brown, D.K. (2000). "Nelson to Vanguard: Warship Design and Development 1923-1945".
--
-- DCS REACTION TIME EXPLANATION:
-- In DCS World, `reactionTime` (seconds) represents the sensor-to-trigger delay
-- before an AI gun station begins slewing and tracking an acquired target.
-- * Primary Directors: 1.0 s (optical/radar calculation delay).
-- * Slaved Heavy Battery: 2.0 s (transmission lag from DCT to gun pit + relay confirmation).
-- * Medium Secondaries: 1.0 s (rapid local gyro/director response).
-- * Light AA Autocannons: 0.5 s (director-assisted tachymetric tracking).
-- * Close-in MGs: 0.1-0.3 s (direct human sight alignment on bridge wings).
-- ============================================================================

-- Ensure DCS global weapon station template table exists
GT_t = GT_t or {}
GT_t.WS_t = GT_t.WS_t or {}
GT_t.LN_t = GT_t.LN_t or {}

-- ============================================================================
-- 1. Main Battery: 16-inch (406mm) BL Mark I (Triple Mount)
-- ============================================================================
-- 3x3 16"/45 caliber guns mounted in Turrets A, B, and X.
-- Historical Sources:
--   - Campbell (1985) pp. 21-23: Traverse rate 4 deg/s; Elevation rate 5.5-6 deg/s.
--   - Hodges (1979) pp. 84-88: Hydraulic training engines, 40-deg max elevation.
--   - Sustained rate of fire: 1.5 - 2.0 rounds per minute per gun.
--   - Reaction time: 2.0 s when slaved to Tower DCT (Arg 80) or Aft DCT (Arg 82).
--     (Autonomous local turret rangefinder fallback accounts for ~20 s initial acquisition).
GT_t.WS_t.UK_16in_BL_MkI_Triple = {
    name = "UK_16in_BL_MkI_Triple",
    omegaY = 0.07,                 -- ~4.0 deg/s (0.070 rad/s) hydraulic traverse (Campbell p. 22)
    omegaZ = 0.10,                 -- ~5.7 deg/s (0.100 rad/s) hydraulic elevation (Campbell p. 22)
    LN = {
        [1] = {
            type = WS_GUN_GROUND or 6, -- Hybrid anti-ship & shore bombardment logic
            distanceMin = 500,     -- Minimum tactical arming / trajectory limit
            distanceMax = 35000,   -- Max ballistic range at +40 deg elevation (Campbell p. 22)
            reactionTime = 2.0,    -- 2.0 s fire-control transmission delay from Tower DCT
            reflection_limit = 0.22,
            connectorFire = true,
            min_trg_alt = -1,      -- Enables surface engagement at sea level (0 m)
            max_trg_alt = 3000,    -- Allows shore bombardment against elevated terrain
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 100, -- 100 rounds per barrel (300 per turret; 900 total ship capacity)
                    shell_name = {"UK_16in_HE_Mk1", "UK_16in_AP_Mk1B"},
                    shot_delay = 30.0,  -- 2.0 rounds per minute per barrel (Hodges p. 86)
                    reload_time = 30.0,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_16in_BL_MkI_Triple.LN[1].sensor, GT_t.WSN_t[0])



-- ============================================================================
-- 2. Secondary Battery: 6-inch (152mm) BL Mark XXII (Twin Mount)
-- ============================================================================
-- 6x2 6"/50 caliber guns mounted in port & starboard Mark XVIII twin turrets.
-- Historical Sources:
--   - Campbell (1985) pp. 37-39: Hand/electric-hydraulic training ~8.6 deg/s (0.15 rad/s).
--   - Max elevation +60 deg, depression -5 deg.
--   - Rate of fire: 7-10 rounds per minute per barrel (shot delay 6.0 s).
--   - Reaction time: 1.0 s when slaved to Port/Starboard Secondary Directors (Args 90/92).
GT_t.WS_t.UK_6in_BL_MkXXII_Twin = {
    name = "UK_6in_BL_MkXXII_Twin",
    omegaY = 0.15,                 -- ~8.6 deg/s electric-hydraulic traverse (Campbell p. 38)
    omegaZ = 0.15,                 -- ~8.6 deg/s elevation
    LN = {
        [1] = {
            type = WS_GUN_GROUND or 6, -- Anti-surface and low-angle defense
            distanceMin = 200,
            distanceMax = 18000,   -- Max range at +45 deg is ~23,500 m; tactical limit 18,000 m
            reactionTime = 1.0,    -- 1.0 s director-slaved response time
            reflection_limit = 0.22,
            connectorFire = true,
            min_trg_alt = -1,      -- Anti-surface targeting
            max_trg_alt = 2000,
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 200, -- 150-200 rounds per gun (1,800 to 2,400 rounds ship total)
                    shell_name = {"UK_6in_HE_Mk22", "UK_6in_AP_Mk22"},
                    shot_delay = 6.0,   -- 10 rounds per minute sustained cyclic rate (Campbell p. 38)
                    reload_time = 6.0,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_6in_BL_MkXXII_Twin.LN[1].sensor, GT_t.WSN_t[0])



-- ============================================================================
-- 3. Heavy AA: 4.7-inch (120mm) QF Mark VIII (Single HA Mount)
-- ============================================================================
-- 6x1 120mm/45 caliber dual-purpose guns on Mark XII high-angle unshielded mountings.
-- Historical Sources:
--   - Campbell (1985) pp. 49-50: High-Angle Mark XII mounting, elevation -5 to +85 deg.
--   - Friedman (2014) pp. 110-112: HACS director calculation window and mechanical fuze setting.
--   - Rate of fire: 10-12 rounds per minute (shot delay 5.0 s).
--   - Reaction time: 2.0 s (accounts for HACS mechanical computer solution & fuze transmission).
GT_t.WS_t.UK_120mm_QF_MkVIII_Single = {
    name = "UK_120mm_QF_MkVIII_Single",
    omegaY = 0.5,                  -- ~30 deg/s powered slewing under director follow-the-pointer
    omegaZ = 0.5,                  -- ~30 deg/s powered elevation
    pidY = GT_t.AAA_PIDY,
    pidZ = GT_t.AAA_PIDZ,
    LN = {
        [1] = {
            type = WS_GUN_AA_HEAVY or 11, -- Timed Fuze/Flak logic with anti-surface capability
            distanceMin = 300,     -- Minimum fuze arming distance
            distanceMax = 14500,   -- Max surface horizontal range at +45 deg (15,780 yd / 14,430 m)
            distanceMaxAir = 9500, -- Slant AA ceiling (~31,000 ft max envelope; Campbell p. 49)
            min_trg_alt = -1,      -- Dual-purpose: engages surface vessels at 0 m
            max_trg_alt = 9000,
            reactionTime = 2.0,    -- 2.0 s HACS fire-control calculation & mechanical fuze setter delay
            reflection_limit = 0.22,
            connectorFire = true,
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 200, -- 200 rounds per mount (1,200 rounds total)
                    shell_name = {"UK_120mm_HE_Mk8"},
                    shot_delay = 5.0,  -- 12 rounds per minute (Campbell p. 49)
                    reload_time = 5.0,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_120mm_QF_MkVIII_Single.LN[1].sensor, GT_t.WSN_t[0])



-- ============================================================================
-- 3b. Dual-Purpose Battery: 5.25-inch (133mm) QF Mark I (Twin Mount)
-- ============================================================================
-- 5x2 133mm/50 caliber dual-purpose guns on Mark II twin mountings (HMS Dido).
-- Historical Sources:
--   - Campbell (1985) pp. 44-46: Electric-hydraulic training, elevation -5 to +70 deg.
--   - Training rate: 10-20 deg/s (0.175 - 0.35 rad/s); Elevation rate: 10 deg/s (0.175 rad/s).
--   - Rate of fire: Nominal 10-12 rounds/min, operational sustained 7-10 rounds/min (shot delay 5.0 s).
--   - Maximum surface range: 23,400 yd (21,400 m) at +45 deg.
--   - Effective AA ceiling: 36,000 ft (11,000 m); maximum slant ceiling: 46,500 ft (14,170 m).
--   - Reaction time: 1.5 s (slaved to HACS / DCT fire-control transmission and fuze-setting).
GT_t.WS_t.UK_133mm_QF_MkI_Twin = {
    name = "UK_133mm_QF_MkI_Twin",
    omegaY = 0.20,                 -- ~11.5 deg/s electric-hydraulic traverse (Campbell p. 44)
    omegaZ = 0.175,                -- ~10 deg/s powered elevation
    pidY = GT_t.AAA_PIDY,
    pidZ = GT_t.AAA_PIDZ,
    LN = {
        [1] = {
            type = WS_GUN_AA_HEAVY or 11, -- Timed Fuze/Flak logic with dual-purpose surface capability
            distanceMin = 200,
            distanceMax = 21400,   -- Max surface range at +45 deg (23,400 yd / 21,400 m)
            distanceMaxAir = 11500, -- Slant AA ceiling (~36,000 ft effective envelope)
            min_trg_alt = -1,      -- Anti-surface engagement at sea level (0 m)
            max_trg_alt = 12000,   -- High-altitude bomber engagement limit
            reactionTime = 1.5,    -- 1.5 s HACS/DCT fire-control calculation and mechanical fuze delay
            reflection_limit = 0.22,
            connectorFire = true,
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 300, -- 300 rounds per barrel (600 per turret; 3,000 total ship capacity)
                    shell_name = {"UK_133mm_HE_MkI", "UK_133mm_SAP_MkI"},
                    shot_delay = 5.0,  -- 12 rounds per minute design rate (Campbell p. 44)
                    reload_time = 5.0,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_133mm_QF_MkI_Twin.LN[1].sensor, GT_t.WSN_t[0])

-- ============================================================================
-- 3c. Dual-Purpose Battery: 4.5-inch (114mm) QF Mark III (Twin Mount)
-- ============================================================================
-- 8x2 114mm/45 caliber dual-purpose guns on BD Mark II twin mountings (HMS Illustrious).
-- Historical Sources:
--   - Campbell (1985) pp. 54-55: Electric-hydraulic training, elevation -5 to +80 deg.
--   - Training rate: 12 deg/s (0.21 rad/s); Elevation rate: 10 deg/s (0.175 rad/s).
--   - Rate of fire: 12 rounds/min per barrel (24 rounds/min per twin mount, shot delay 5.0 s).
--   - Maximum surface range: 20,700 yd (18,900 m) at +45 deg.
--   - Effective AA ceiling: 41,000 ft (12,500 m) at +80 deg.
--   - Reaction time: 1.5 s (slaved to HACS fire-control transmission and fuze-setting).
GT_t.WS_t.UK_114mm_QF_MkIII_Twin = {
    name = "UK_114mm_QF_MkIII_Twin",
    omegaY = 0.21,                 -- ~12 deg/s electric-hydraulic traverse (Campbell p. 55)
    omegaZ = 0.175,                -- ~10 deg/s powered elevation
    pidY = GT_t.AAA_PIDY,
    pidZ = GT_t.AAA_PIDZ,
    LN = {
        [1] = {
            type = WS_GUN_AA_HEAVY or 11, -- Timed Fuze/Flak logic with dual-purpose surface capability
            distanceMin = 200,
            distanceMax = 18900,   -- Max surface range at +45 deg (20,700 yd / 18,900 m)
            distanceMaxAir = 12500, -- Slant AA ceiling (~41,000 ft envelope)
            min_trg_alt = -1,      -- Anti-surface engagement at sea level (0 m)
            max_trg_alt = 13000,   -- High-altitude bomber engagement limit
            reactionTime = 1.5,    -- 1.5 s HACS fire-control calculation and mechanical fuze delay
            reflection_limit = 0.22,
            connectorFire = true,
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 300, -- 300 rounds per barrel (600 per turret; 4,800 total ship capacity)
                    shell_name = {"UK_114mm_HE_MkI"},
                    shot_delay = 5.0,  -- 12 rounds per minute design rate per barrel (Campbell p. 55)
                    reload_time = 5.0,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_114mm_QF_MkIII_Twin.LN[1].sensor, GT_t.WSN_t[0])

-- ============================================================================
-- 4. Light AA: 2-pdr (40mm) "Pom-Pom" Mark VIII (Quad & Octuple Mounts)
-- ============================================================================
-- Standardized Admiralty 40mm 2-pdr multi-barrel power-operated mounting.
-- Dynamically supports Mark VII (4-barrel Quad) and Mark V/VI (8-barrel Octuple).
-- Historical Sources:
--   - Campbell (1985) pp. 71-74: Rate of fire 90-115 rpm per barrel (shot delay 0.5 s).
--   - Power-driven hydraulic mount: traverse & elevation ~25-57 deg/s.
--   - Reaction time: 0.5 s (Director Mk III / tachymetric optical radar assistance).
GT_t.WS_t.UK_40mm_PomPom_Mount = {
    name = "UK_40mm_PomPom_Mount",
    omegaY = 1.0,                  -- ~57 deg/s fast slewing (Campbell p. 73)
    omegaZ = 1.0,
    reference_angle_Z = math.rad(20),
    pidY = GT_t.AAA_PIDY,
    pidZ = GT_t.AAA_PIDZ,
    LN = {
        [1] = {
            type = WS_GUN_AA or 3, -- Rapid AA autocannon / dual-purpose light weapon
            distanceMin = 20,
            distanceMax = 3500,    -- 3,800 yd (3,475 m) self-destruct fuze limit (Campbell p. 71)
            distanceMaxAir = 3000, -- Slant ceiling ~8,000 ft (2,400-3,000 m)
            min_trg_alt = -1,      -- Enables surface fire vs E-boats/torpedo craft
            max_trg_alt = 2500,
            reactionTime = 0.5,    -- 0.5 s rapid tachymetric tracking response
            reflection_limit = 0.22,
            connectorFire = true,
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 1000, -- Continuous belted feed (up to 720-1,000 rds per gun)
                    shell_name = {"UK_40mm_PomPom_HE"},
                    shot_delay = 0.5,     -- Cyclic fire rate per individual barrel (~115 rpm)
                    reload_time = 10.0,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_40mm_PomPom_Mount.LN[1].sensor, GT_t.WSN_t[0])

-- Aliases for backward compatibility
GT_t.WS_t.UK_40mm_PomPom_Octuple = GT_t.WS_t.UK_40mm_PomPom_Mount
GT_t.WS_t.UK_40mm_PomPom_Quad    = GT_t.WS_t.UK_40mm_PomPom_Mount



-- ============================================================================
-- 6. Light AA: Vickers .50-inch (12.7mm) Mark III (Quadruple Mount)
-- ============================================================================
-- 2x4 12.7mm heavy machine guns on Mark IV high-angle quad bridge-wing mountings.
-- Historical Sources:
--   - Campbell (1985) pp. 78-79: Rate of fire ~700 rpm cyclic per barrel.
--   - Hand-worked mount: traverse rate up to 86 deg/s (1.5 rad/s).
--   - Reaction time: 0.1-0.3 s (direct human sighting / zero computer delay).
GT_t.WS_t.UK_50cal_Vickers_Quad = {
    name = "UK_50cal_Vickers_Quad",
    omegaY = 1.5,                  -- ~86 deg/s rapid manual traverse (Campbell p. 78)
    omegaZ = 1.5,
    pidY = GT_t.AAA_PIDY,
    pidZ = GT_t.AAA_PIDZ,
    LN = {
        [1] = {
            type = WS_GUN_AA or 3, -- Fast AA close-in defense
            distanceMin = 10,
            distanceMax = 1500,    -- 1,500 m effective engagement range
            min_trg_alt = -1,      -- Enables surface defense against small craft
            max_trg_alt = 1500,
            reactionTime = 0.3,    -- 0.3 s near-instantaneous direct manual human sighting
            reflection_limit = 0.22,
            connectorFire = true,
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 800, -- 800 rounds per drum/tray (3,200 rounds per mount)
                    shell_name = {"UK_50cal_Vickers_AP"},
                    shot_delay = 0.086, -- ~700 rounds per minute cyclic rate (Campbell p. 78)
                    reload_time = 15.0,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_50cal_Vickers_Quad.LN[1].sensor, GT_t.WSN_t[0])

-- ============================================================================
-- 7. Main Battery: 4.7-inch (120mm) QF Destroyer Mount (Single & Twin)
-- ============================================================================
-- Standard British fleet destroyer main battery (A through N classes).
-- Dynamically supports single CP XXII (Foxhound, Glowworm) and twin CP Mk XIX (Javelin).
-- Historical Sources:
--   - Campbell (1985) pp. 49-51: Mountings elevation -10 to +40 deg.
--   - Rate of fire: 10-12 rounds per minute per barrel (shot delay 5.0 s single, 2.5 s twin).
--   - Reaction time: 1.0 s when slaved to bridge rangefinder / director.
GT_t.WS_t.UK_120mm_QF_Destroyer_Mount = {
    name = "UK_120mm_QF_Destroyer_Mount",
    omegaY = 0.26,                 -- ~15 deg/s training (Campbell p. 50)
    omegaZ = 0.18,                 -- ~10 deg/s elevation
    pidY = GT_t.AAA_PIDY,
    pidZ = GT_t.AAA_PIDZ,
    LN = {
        [1] = {
            type = WS_GUN_GROUND or 6, -- Anti-surface and coastal bombardment logic
            distanceMin = 100,
            distanceMax = 15500,   -- 15,500 m max surface ballistic reach (Campbell p. 49)
            distanceMaxAir = 3000, -- Limited AA ceiling due to +40 deg max elevation
            min_trg_alt = -1,      -- Enables surface engagement at sea level (0 m)
            max_trg_alt = 3500,
            reactionTime = 1.0,
            reflection_limit = 0.22,
            connectorFire = true,
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 200, -- 200 rounds per barrel default
                    shell_name = {"UK_120mm_HE_MkIX", "UK_120mm_SAP_MkIX"},
                    shot_delay = 5.0,  -- 12 rounds per minute per barrel (Campbell p. 49)
                    reload_time = 5.0,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_120mm_QF_Destroyer_Mount.LN[1].sensor, GT_t.WSN_t[0])

-- Aliases for single and twin configurations
GT_t.WS_t.UK_120mm_QF_MkIX_Single = GT_t.WS_t.UK_120mm_QF_Destroyer_Mount
GT_t.WS_t.UK_120mm_QF_MkXII_Twin  = GT_t.WS_t.UK_120mm_QF_Destroyer_Mount

-- ============================================================================
-- 8. Light AA: 20mm /70 Oerlikon Mark II/IV (Single & Twin Mounts)
-- ============================================================================
-- Standard British naval close-in AA defense.
-- Dynamically supports manual pedestal single mount and powered hydraulic twin mount.
-- Historical Sources:
--   - Campbell (1985) pp. 75-77: Pedestal and hydraulic Mark V twin mountings.
--   - Cyclic rate ~450 rpm per barrel.
--   - Reaction time: 0.2 s (rapid close-in tracking).
GT_t.WS_t.UK_20mm_Oerlikon_Mount = {
    name = "UK_20mm_Oerlikon_Mount",
    omegaY = 1.5,                  -- ~86 deg/s rapid traverse
    omegaZ = 1.5,
    pidY = GT_t.AAA_PIDY,
    pidZ = GT_t.AAA_PIDZ,
    LN = {
        [1] = {
            type = WS_GUN_AA or 3,
            distanceMin = 10,
            distanceMax = 2000,    -- 2,000 m effective AA range
            distanceMaxAir = 1500, -- 1,500 m AA ceiling
            min_trg_alt = -1,      -- Enables surface fire vs torpedo craft / speedboats
            max_trg_alt = 1500,
            reactionTime = 0.2,
            reflection_limit = 0.22,
            connectorFire = true,
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 60, -- 60 rounds per barrel default (1x drum per gun)
                    shell_name = {"UK_20mm_Oerlikon_HE"},
                    shot_delay = 0.133, -- ~450 rpm cyclic rate per barrel
                    reload_time = 4.0,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_20mm_Oerlikon_Mount.LN[1].sensor, GT_t.WSN_t[0])

-- Aliases for single and twin configurations
GT_t.WS_t.UK_20mm_Oerlikon_Single = GT_t.WS_t.UK_20mm_Oerlikon_Mount
GT_t.WS_t.UK_20mm_Oerlikon_Twin   = GT_t.WS_t.UK_20mm_Oerlikon_Mount

-- ============================================================================
-- 11. Torpedo Battery: 21-inch (533mm) Multibarrel Mount (Quad & Quintuple)
-- ============================================================================
-- Unified Admiralty 21-inch torpedo carriage template for Royal Navy destroyers.
-- Dynamically supports 4-tube (Foxhound) and 5-tube (Glowworm, Javelin) mounts.
-- Armed with declared UK_21in_Mk_IX steam-gas naval torpedo.
local uk_21in_torp = (UK_21in_Mk_IX and UK_21in_Mk_IX.wsTypeOfWeapon) or {
    wsType_Weapon or 4,
    wsType_Torpedo or 8,
    wsType_S_Torpedo or 11,
    WSTYPE_PLACEHOLDER or "WSTYPE_PLACEHOLDER"
}

GT_t.WS_t.UK_21in_Torpedo_Mount = {
    name = "UK_21in_Torpedo_Mount",
    type = WS_TORPEDO or 32,                          -- Torpedo launcher
    omegaY = math.rad(15),              -- 15 deg/s traverse
    omegaZ = math.rad(10),
    pidY = {p=40, i=1, d=7},
    pidZ = {p=40, i=1, d=7},
    moveable = true,
    drawArgument2 = -1,
    canSetTacticalDir = true,           -- Enables AI torpedo lead-angle solver
    LN = {
        [1] = {
            type = WS_TORPEDO or 32,                  -- Torpedo launcher
            distanceMin = 200,
            distanceMax = 8000,
            reactionTime = 1.0,
            launch_delay = 1.0,
            maxShootingSpeed = 25.0,                  -- 48.6 kts platform speed limit
            barrels_reload_type = (GT_t.BarrelsReloadTypes and GT_t.BarrelsReloadTypes.ORDINARY) or 1,
            min_trg_alt = -10,                        -- Waterline margin (meters)
            max_trg_alt = 25,                         -- Surface ship superstructure limit (meters)
            max_number_of_missiles_channels = 1,
            show_external_missile = false,
            sensor = {},
            PL = {
                [1] = {
                    name_ammunition = "UK_21in_Mk_IX",
                    type_ammunition = uk_21in_torp,
                    ammo_capacity = 5,       -- Default fallback
                    shot_delay = 3.0,        -- 3s interval between tubes
                    reload_time = 1000000,   -- 0 combat reloads (tubes only)
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_21in_Torpedo_Mount.LN[1].sensor, GT_t.WSN_t[SN_AA_FAST or 3])

-- Templates & Aliases for alternative naming in ship files
GT_t.WS_t.UK_530mm_Quintuple_Torp   = GT_t.WS_t.UK_21in_Torpedo_Mount
GT_t.WS_t.UK_21in_Quintuple_Torpedo = GT_t.WS_t.UK_21in_Torpedo_Mount

-- 4-tube Quadruple Torpedo Carriage (Foxhound / F-class)
GT_t.WS_t.UK_21in_Quadruple_Torp = {}
set_recursive_metatable(GT_t.WS_t.UK_21in_Quadruple_Torp, GT_t.WS_t.UK_21in_Torpedo_Mount)
GT_t.WS_t.UK_21in_Quadruple_Torp.LN = { [1] = {} }
set_recursive_metatable(GT_t.WS_t.UK_21in_Quadruple_Torp.LN[1], GT_t.WS_t.UK_21in_Torpedo_Mount.LN[1])
GT_t.WS_t.UK_21in_Quadruple_Torp.LN[1].PL = {
    [1] = {
        ammo_capacity = 4,
    }
}
set_recursive_metatable(GT_t.WS_t.UK_21in_Quadruple_Torp.LN[1].PL[1], GT_t.WS_t.UK_21in_Torpedo_Mount.LN[1].PL[1])
GT_t.WS_t.UK_21in_Quadruple_Torpedo = GT_t.WS_t.UK_21in_Quadruple_Torp

-- 3-tube Triple Torpedo Carriage (Dido-class / Town-class / Crown Colony)
GT_t.WS_t.UK_21in_Triple_Torp = {}
set_recursive_metatable(GT_t.WS_t.UK_21in_Triple_Torp, GT_t.WS_t.UK_21in_Torpedo_Mount)
GT_t.WS_t.UK_21in_Triple_Torp.LN = { [1] = {} }
set_recursive_metatable(GT_t.WS_t.UK_21in_Triple_Torp.LN[1], GT_t.WS_t.UK_21in_Torpedo_Mount.LN[1])
GT_t.WS_t.UK_21in_Triple_Torp.LN[1].PL = {
    [1] = {
        ammo_capacity = 3,
    }
}
set_recursive_metatable(GT_t.WS_t.UK_21in_Triple_Torp.LN[1].PL[1], GT_t.WS_t.UK_21in_Torpedo_Mount.LN[1].PL[1])
GT_t.WS_t.UK_21in_Triple_Torpedo = GT_t.WS_t.UK_21in_Triple_Torp

-- ============================================================================
-- 12. Main Battery: 6-inch (152mm) BL Mark XXIII (Twin Mount Mk XXI)
-- ============================================================================
-- 4x2 6"/50 caliber guns mounted in Mark XXI twin turrets (HMS Leander / Ajax / Achilles).
-- Historical Sources:
--   - Campbell (1985) pp. 34-36: Hand/electric-hydraulic training ~10 deg/s (0.175 rad/s).
--   - Elevation -5 to +40 deg, rate ~10 deg/s (0.175 rad/s).
--   - Rate of fire: 7-8 rounds per minute per barrel (shot delay 7.5 s).
--   - Maximum range: 25,480 yd (23,300 m) at +40 deg elevation.
--   - Reaction time: 1.5 s when slaved to Tower DCT (Arg 80).
GT_t.WS_t.UK_6in_BL_MkXXIII_Twin = {
    name = "UK_6in_BL_MkXXIII_Twin",
    omegaY = 0.175,                -- ~10 deg/s powered hydraulic traverse (Campbell p. 35)
    omegaZ = 0.175,                -- ~10 deg/s powered elevation
    LN = {
        [1] = {
            type = WS_GUN_GROUND or 6, -- Anti-surface and coastal bombardment logic
            distanceMin = 200,
            distanceMax = 23300,   -- Max range at +40 deg is ~23,300 m
            reactionTime = 1.5,    -- 1.5 s director-slaved response time
            reflection_limit = 0.22,
            connectorFire = true,
            min_trg_alt = -1,      -- Anti-surface targeting at water level
            max_trg_alt = 2500,
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 200, -- 200 rounds per barrel (400 per turret; 1,600 total ship capacity)
                    shell_name = {"UK_6in_HE_MkXXIII", "UK_6in_AP_MkXXIII"},
                    shot_delay = 7.5,   -- 8 rounds per minute operational sustained rate
                    reload_time = 7.5,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_6in_BL_MkXXIII_Twin.LN[1].sensor, GT_t.WSN_t[0])

-- ============================================================================
-- 13. Heavy AA: 4-inch (102mm) QF Mark XVI (Twin Mount Mk XIX)
-- ============================================================================
-- 4x2 102mm/45 caliber dual-purpose guns on Mark XIX high-angle twin mountings (HMS Leander).
-- Historical Sources:
--   - Campbell (1985) pp. 56-58: High-Angle Mark XIX mounting, elevation -5 to +80 deg.
--   - Training rate ~25 deg/s (0.436 rad/s); Elevation rate ~15 deg/s (0.262 rad/s).
--   - Rate of fire: 18-20 rounds per minute per barrel (shot delay 3.3 s).
--   - Max surface range: 19,850 yd (18,150 m); effective AA ceiling: 39,000 ft (11,890 m).
--   - Reaction time: 1.5 s (director-slaved tachymetric / HACS calculation).
GT_t.WS_t.UK_102mm_QF_MkXVI_Twin = {
    name = "UK_102mm_QF_MkXVI_Twin",
    omegaY = 0.436,                -- ~25 deg/s fast powered slewing (Campbell p. 57)
    omegaZ = 0.262,                -- ~15 deg/s powered elevation
    pidY = GT_t.AAA_PIDY,
    pidZ = GT_t.AAA_PIDZ,
    LN = {
        [1] = {
            type = WS_GUN_AA_HEAVY or 11, -- Timed Fuze/Flak logic with dual-purpose surface capability
            distanceMin = 200,     -- Minimum fuze arming distance
            distanceMax = 18150,   -- Max surface horizontal range at +45 deg (19,850 yd / 18,150 m)
            distanceMaxAir = 11800, -- Slant AA ceiling (~39,000 ft max envelope; Campbell p. 56)
            min_trg_alt = -1,      -- Dual-purpose: engages surface vessels at 0 m
            max_trg_alt = 12000,
            reactionTime = 1.5,    -- 1.5 s HACS fire-control calculation & mechanical fuze setter delay
            reflection_limit = 0.22,
            connectorFire = true,
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 250, -- 250 rounds per barrel (500 per mount; 2,000 total ship capacity)
                    shell_name = {"UK_102mm_HE_MkXVI", "UK_102mm_SAP_MkXVI"},
                    shot_delay = 3.33, -- ~18 rounds per minute sustained cyclic rate (Campbell p. 56)
                    reload_time = 3.33,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.UK_102mm_QF_MkXVI_Twin.LN[1].sensor, GT_t.WSN_t[0])



