-- ============================================================================
-- HMS Illustrious (87) - Illustrious-class Fleet Aircraft Carrier
-- DCS World Naval Unit Definition
--
-- Armament:
--   - 8 x Twin 4.5-inch (114mm) /45 QF Mark III DP Guns (Args 31-46)
--   - 6 x Octuple 2-pounder (40mm) "Pom-Pom" Mark VIII AA Guns (Args 71-82)
--   - 6 x High Angle Fire Control Directors (Args 90-95)
--   - 4 x Continuous Search Radar Antennas (Args 11-14)
--   - 3 x Screws (Arg 8), 1 x Balanced Rudder (Arg 9)
-- ============================================================================

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_ship);

GT.visual = {};
GT.visual.shape = "HMS_Illustrious";
GT.visual.shape_dstr = "";

-- ####################################################################################
-- ###                         General Ship Parameters                              ###
-- ####################################################################################

GT.life                     = 7500;     -- Heavy armored flight deck & hangar citadel box
GT.mass                     = 28619000; -- 28,619 metric tons full load
GT.max_velocity             = 15.68;    -- 30.5 knots
GT.race_velocity            = 15.68;
GT.economy_velocity         = 8.23;     -- 16 knots
GT.economy_distance         = 19800000; -- ~10,700 nmi
GT.race_distance            = 6000000;
GT.shipLength               = 225.1;
GT.Width                    = 35.4;
GT.Height                   = 44.2;     -- Keel to island masthead
GT.Length                   = 225.1;
GT.DeckLevel                = 12.30;    -- Flight deck elevation above waterline
GT.X_nose                   = 107.13;
GT.X_tail                   = -108.71;
GT.Tail_Width               = 6.9;
GT.draft                    = 8.8;
GT.Gamma_max                = 0.35;
GT.Om                       = 0.05;
GT.speedup                  = 0.05;
GT.R_min                    = 650.0;
GT.distFindObstacles        = 1000.0;
GT.RCS                      = 60000;

GT.isCarrier                = true;
GT.numParking               = 12;
GT.Plane_Num_               = 36;
GT.Helicopter_Num_          = 0;
GT.Landing_Point            = {-65.0, 12.30, 0.0}; -- Touchdown point for landing aircraft

-- Radio & Optical Landing Aids
GT.TACAN                    = true;
GT.TACAN_def_channel        = 87; -- HMS Illustrious Pennant 87
GT.TACAN_position           = {25.0, 42.0, 14.0}; -- Island masthead

GT.ICLS                     = true;
GT.ICLS_Localizer_position  = {-98.0, 12.40,   0.0, 180.0}; -- {x, y, z, yaw [deg]}
GT.ICLS_Glideslope_position = {-98.0, 12.40, -13.0,   3.5}; -- {x, y, z, glideslope [deg]}

-- Landing Signal Officer's View (LALT + F9) - Port aft catwalk
GT.LSOView                  = { cockpit = "empty", position = {-85.0, 13.50, -14.0, 175.0, 3.0} };

GT.airWeaponDist            = 18900;
GT.airFindDist              = 35000;

GT.sensor = {
    max_range_finding_target = 35000,
    min_range_finding_target = 0,
    max_alt_finding_target   = 15000,
    min_alt_finding_target   = 0,
    pos                      = {25.0, 38.0, 13.0}, 
};

GT.exhaust = {
    [1] = { size = 1.2, connector = "POINT_SMOKE_STACK_01" }, -- Island Main Funnel
};

-- ####################################################################################
-- ###                           Animation Arguments                                ###
-- ####################################################################################

GT.propellor_arg            = 8;  -- Triple screws (Arg 8 with port counter-rotation)
GT.rudder_arg               = 9;  -- Balanced centerline rudder (Arg 9)
GT.animation_arguments = {
    radar1_rotation = 12, -- Type 281BQ Air Search Radar (Illustrious_Radar_2, Mast Top)
    radar2_rotation = 12, -- Type 281BQ secondary channel mapping
    water_propeller = 8,  -- Triple screws (outward counter-rotating)
    rudder          = 9,  -- Balanced centerline rudder
    nav_lights      = 20, -- Navigation running lights, masthead lanterns, and BANO flares
};
GT.radar1_period = 15.0; -- Type 281BQ power rotation: ~4 RPM (15.0 s per revolution)
GT.radar2_period = 15.0;

-- ####################################################################################
-- ###                               Damage Model                                   ###
-- ####################################################################################

GT.DM = {
    -- =========================================================================
    -- Flight Deck & Island Superstructure
    -- =========================================================================
    { area_name = "COLLISION_SHELL_DECK",        area_arg = 103, area_life = 800,  armour = {width = 0.076}, area_fire = { pos = {0.0, 12.5, 0.0}, size = 1.5}, belongsToRunway = true },
    { area_name = "COLLISION_SHELL_ISLAND",      area_arg = 104, area_life = 500,  armour = {width = 0.025}, area_fire = { pos = {16.0, 19.0, 13.0}, size = 1.2} },

    -- =========================================================================
    -- Lower & Main Hull Watertight Compartments (Port / Starboard Bow, Mid, Aft)
    -- =========================================================================
    { area_name = "COLLISION_SHELL_BOW_L",       area_arg = 100, area_life = 700,  armour = {width = 0.038}, area_fire = { pos = {70.0, 6.0, -10.0}, size = 1.2} },
    { area_name = "COLLISION_SHELL_BOW_R",       area_arg = 100, area_life = 700,  armour = {width = 0.038}, area_fire = { pos = {70.0, 6.0, 10.0}, size = 1.2} },
    { area_name = "COLLISION_SHELL_MID_L",       area_arg = 102, area_life = 1200, armour = {width = 0.114}, area_fire = { pos = {0.0, 5.0, -14.0}, size = 1.5} },
    { area_name = "COLLISION_SHELL_MID_R",       area_arg = 102, area_life = 1200, armour = {width = 0.114}, area_fire = { pos = {0.0, 5.0, 14.0}, size = 1.5} },
    { area_name = "COLLISION_SHELL_AFT_L",       area_arg = 101, area_life = 700,  armour = {width = 0.038}, area_fire = { pos = {-75.0, 6.0, -10.0}, size = 1.2} },
    { area_name = "COLLISION_SHELL_AFT_R",       area_arg = 101, area_life = 700,  armour = {width = 0.038}, area_fire = { pos = {-75.0, 6.0, 10.0}, size = 1.2} },

    -- =========================================================================
    -- Secondary Battery: 8 x Twin 4.5-inch (114mm) QF Mk III DP Gun Mounts
    -- =========================================================================
    { area_name = "COLLISION_SHELL_GUN_01",      area_arg = 110, area_life = 120,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_GUN_02",      area_arg = 111, area_life = 120,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_GUN_03",      area_arg = 112, area_life = 120,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_GUN_04",      area_arg = 113, area_life = 120,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_GUN_05",      area_arg = 114, area_life = 120,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_GUN_06",      area_arg = 115, area_life = 120,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_GUN_07",      area_arg = 116, area_life = 120,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_GUN_08",      area_arg = 117, area_life = 120,  armour = {width = 0.025} },

    -- =========================================================================
    -- Light AA Battery: 6 x Octuple 2-pdr (40mm) Pom-Pom Mk VIII Mounts
    -- =========================================================================
    { area_name = "COLLISION_SHELL_POMPOM_01",   area_arg = 120, area_life = 60,   armour = {width = 0.015} },
    { area_name = "COLLISION_SHELL_POMPOM_02",   area_arg = 121, area_life = 60,   armour = {width = 0.015} },
    { area_name = "COLLISION_SHELL_POMPOM_03",   area_arg = 122, area_life = 60,   armour = {width = 0.015} },
    { area_name = "COLLISION_SHELL_POMPOM_04",   area_arg = 123, area_life = 60,   armour = {width = 0.015} },
    { area_name = "COLLISION_SHELL_POMPOM_05",   area_arg = 124, area_life = 60,   armour = {width = 0.015} },
    { area_name = "COLLISION_SHELL_POMPOM_06",   area_arg = 125, area_life = 60,   armour = {width = 0.015} },

    -- =========================================================================
    -- Fire Control: 3 x HACS Mk IV High-Angle Directors
    -- =========================================================================
    { area_name = "COLLISION_SHELL_DIRECTOR_HACS_01", area_arg = 136, area_life = 50,  armour = {width = 0.015} },
    { area_name = "COLLISION_SHELL_DIRECTOR_HACS_02", area_arg = 137, area_life = 50,  armour = {width = 0.015} },
    { area_name = "COLLISION_SHELL_DIRECTOR_HACS_03", area_arg = 138, area_life = 50,  armour = {width = 0.015} },

    -- =========================================================================
    -- Close-Range Director Towers: 6 x Pom-Pom Director Towers (PBDTs)
    -- =========================================================================
    { area_name = "COLLISION_SHELL_DIRECTOR_01", area_arg = 130, area_life = 40,   armour = {width = 0.012} },
    { area_name = "COLLISION_SHELL_DIRECTOR_02", area_arg = 131, area_life = 40,   armour = {width = 0.012} },
    { area_name = "COLLISION_SHELL_DIRECTOR_03", area_arg = 132, area_life = 40,   armour = {width = 0.012} },
    { area_name = "COLLISION_SHELL_DIRECTOR_04", area_arg = 133, area_life = 40,   armour = {width = 0.012} },
    { area_name = "COLLISION_SHELL_DIRECTOR_05", area_arg = 134, area_life = 40,   armour = {width = 0.012} },
    { area_name = "COLLISION_SHELL_DIRECTOR_06", area_arg = 135, area_life = 40,   armour = {width = 0.012} },
};

-- ####################################################################################
-- ###                       Carrier Flight Deck Integration                        ###
-- ####################################################################################

dofile(current_mod_path .. "/Units/HMS_Illustrious/HMS_Illustrious_RunwaysAndRoutes.lua");

-- ####################################################################################
-- ###                          Weapon Systems & Directors                          ###
-- ####################################################################################

GT.WS = {};
GT.WS.maxTargetDetectionRange = 35000;
GT.WS.radar_type = 103;
GT.WS.searchRadarMaxElevation = math.rad(60);
GT.WS.searchRadarFrequencies = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}};

-- ====================================================================================
-- SECTION 1: Fire Control Directors (HACS Mk IV: Args 84-86, PBDT: Args 90-95)
-- ====================================================================================

-- ------------------------------------------------------------------------------------
-- Tier 1: High Angle Control System (HACS Mk IV with Type 285 Radar)
-- Controls the 8 x Twin 4.5-inch QF Mk III Dual-Purpose Heavy Anti-Aircraft Battery
-- ------------------------------------------------------------------------------------

-- WS 1: HACS Mk IV Director 01 (Island Top - Arg 84)
local ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIV);
GT.WS[ws].center = "CENTER_DIRECTOR_HACS_01";
GT.WS[ws].area = "COLLISION_SHELL_DIRECTOR_HACS_01";
GT.WS[ws].drawArgument1 = 84;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(-170), math.rad(-10), math.rad(85)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_HACS_MkIV.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_HACS_01"} };

-- WS 2: HACS Mk IV Director 02 (Port Fwd Sponson - Arg 85)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIV);
GT.WS[ws].center = "CENTER_DIRECTOR_HACS_02";
GT.WS[ws].area = "COLLISION_SHELL_DIRECTOR_HACS_02";
GT.WS[ws].drawArgument1 = 85;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(10), math.rad(-10), math.rad(85)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_HACS_MkIV.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_HACS_02"} };

-- WS 3: HACS Mk IV Director 03 (Starboard Aft Sponson - Arg 86)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIV);
GT.WS[ws].center = "CENTER_DIRECTOR_HACS_03";
GT.WS[ws].area = "COLLISION_SHELL_DIRECTOR_HACS_03";
GT.WS[ws].drawArgument1 = 86;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = {
    {math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_HACS_MkIV.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_HACS_03"} };

-- HACS Tracker Chains for 4.5" Heavy Anti-Aircraft Battery
local trackers_hacs_stbd = {
    {{"self", 1}}, -- HACS 01 (Island Top)
    {{"self", 3}}, -- HACS 03 (Stbd Aft)
    {{"self", 2}}, -- HACS 02 (Port Fwd)
    {{"none"}},    -- Fallback to local mount control
};

local trackers_hacs_port = {
    {{"self", 2}}, -- HACS 02 (Port Fwd)
    {{"self", 1}}, -- HACS 01 (Island Top)
    {{"self", 3}}, -- HACS 03 (Stbd Aft)
    {{"none"}},    -- Fallback to local mount control
};

local trackers_hacs_aft = {
    {{"self", 3}}, -- HACS 03 (Stbd Aft)
    {{"self", 1}}, -- HACS 01 (Island Top)
    {{"self", 2}}, -- HACS 02 (Port Fwd)
    {{"none"}},    -- Fallback to local mount control
};

-- ------------------------------------------------------------------------------------
-- Tier 2: Pom-Pom Director Towers (PBDT / Director Mk III Tachymetric AA)
-- Dedicated rapid-acquisition directors for the 6 x Octuple 40mm Pom-Pom mounts
-- ------------------------------------------------------------------------------------

-- WS 4: PBDT Director 01 (Starboard Bridge Top Fwd - Arg 90)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_PomPom_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_01";
GT.WS[ws].area = "COLLISION_SHELL_DIRECTOR_01";
GT.WS[ws].drawArgument1 = 90;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-45);
GT.WS[ws].angles = {
    {math.rad(10), math.rad(-170), math.rad(-10), math.rad(85)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_PomPom_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_01"} };

-- WS 5: PBDT Director 02 (Starboard Island Mid - Arg 91)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_PomPom_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_02";
GT.WS[ws].area = "COLLISION_SHELL_DIRECTOR_02";
GT.WS[ws].drawArgument1 = 91;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = {
    {math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_PomPom_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_02"} };

-- WS 6: PBDT Director 03 (Starboard Island Aft 2 - Arg 92)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_PomPom_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_03";
GT.WS[ws].area = "COLLISION_SHELL_DIRECTOR_03";
GT.WS[ws].drawArgument1 = 92;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = {
    {math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_PomPom_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_03"} };

-- WS 7: PBDT Director 04 (Starboard Bridge Top Aft - Arg 93)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_PomPom_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_04";
GT.WS[ws].area = "COLLISION_SHELL_DIRECTOR_04";
GT.WS[ws].drawArgument1 = 93;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = {
    {math.rad(10), math.rad(-170), math.rad(-10), math.rad(85)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_PomPom_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_04"} };

-- WS 8: PBDT Director 05 (Port Catwalk Aft - Arg 94)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_PomPom_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_05";
GT.WS[ws].area = "COLLISION_SHELL_DIRECTOR_05";
GT.WS[ws].drawArgument1 = 94;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(10), math.rad(-10), math.rad(85)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_PomPom_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_05"} };

-- WS 9: PBDT Director 06 (Port Catwalk Fwd - Arg 95)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_PomPom_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_06";
GT.WS[ws].area = "COLLISION_SHELL_DIRECTOR_06";
GT.WS[ws].drawArgument1 = 95;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(10), math.rad(-10), math.rad(85)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_PomPom_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_06"} };

-- ====================================================================================
-- SECTION 2: Secondary Battery - 8 x Twin 4.5-inch QF Mk III DP Guns (Args 31-46)
-- ====================================================================================

-- WS 10: Gun 01 (Starboard Fwd 1 - Args 31, 32)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_114mm_QF_MkIII_Twin);
GT.WS[ws].center = "CENTER_GUN_01";
GT.WS[ws].area = "COLLISION_SHELL_GUN_01";
GT.WS[ws].drawArgument1 = 31;
GT.WS[ws].drawArgument2 = 32;
GT.WS[ws].reference_angle_Y = math.rad(-12.5);
GT.WS[ws].angles = {
    {math.rad(10), math.rad(-150), math.rad(-5), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_114mm_QF_MkIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = trackers_hacs_stbd;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_01_1"},
    {connector_name = "POINT_GUN_01_2"},
};

-- WS 11: Gun 02 (Starboard Fwd 2 - Args 33, 34)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_114mm_QF_MkIII_Twin);
GT.WS[ws].center = "CENTER_GUN_02";
GT.WS[ws].area = "COLLISION_SHELL_GUN_02";
GT.WS[ws].drawArgument1 = 33;
GT.WS[ws].drawArgument2 = 34;
GT.WS[ws].reference_angle_Y = math.rad(-25.0);
GT.WS[ws].angles = {
    {math.rad(10), math.rad(-150), math.rad(-5), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_114mm_QF_MkIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = trackers_hacs_stbd;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_02_1"},
    {connector_name = "POINT_GUN_02_2"},
};

-- WS 12: Gun 03 (Port Fwd 1 - Args 35, 36)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_114mm_QF_MkIII_Twin);
GT.WS[ws].center = "CENTER_GUN_03";
GT.WS[ws].area = "COLLISION_SHELL_GUN_03";
GT.WS[ws].drawArgument1 = 35;
GT.WS[ws].drawArgument2 = 36;
GT.WS[ws].reference_angle_Y = math.rad(12.5);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-10), math.rad(-5), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_114mm_QF_MkIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = trackers_hacs_port;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_03_1"},
    {connector_name = "POINT_GUN_03_2"},
};

-- WS 13: Gun 04 (Port Fwd 2 - Args 37, 38)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_114mm_QF_MkIII_Twin);
GT.WS[ws].center = "CENTER_GUN_04";
GT.WS[ws].area = "COLLISION_SHELL_GUN_04";
GT.WS[ws].drawArgument1 = 37;
GT.WS[ws].drawArgument2 = 38;
GT.WS[ws].reference_angle_Y = math.rad(25.0);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-10), math.rad(-5), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_114mm_QF_MkIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = trackers_hacs_port;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_04_1"},
    {connector_name = "POINT_GUN_04_2"},
};

-- WS 14: Gun 05 (Port Aft 1 - Args 39, 40)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_114mm_QF_MkIII_Twin);
GT.WS[ws].center = "CENTER_GUN_05";
GT.WS[ws].area = "COLLISION_SHELL_GUN_05";
GT.WS[ws].drawArgument1 = 39;
GT.WS[ws].drawArgument2 = 40;
GT.WS[ws].reference_angle_Y = math.rad(155.0);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(30), math.rad(-5), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_114mm_QF_MkIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = trackers_hacs_port;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_05_1"},
    {connector_name = "POINT_GUN_05_2"},
};

-- WS 15: Gun 06 (Port Aft 2 - Args 41, 42)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_114mm_QF_MkIII_Twin);
GT.WS[ws].center = "CENTER_GUN_06";
GT.WS[ws].area = "COLLISION_SHELL_GUN_06";
GT.WS[ws].drawArgument1 = 41;
GT.WS[ws].drawArgument2 = 42;
GT.WS[ws].reference_angle_Y = math.rad(167.5);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(30), math.rad(-5), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_114mm_QF_MkIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = trackers_hacs_port;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_06_1"},
    {connector_name = "POINT_GUN_06_2"},
};

-- WS 16: Gun 07 (Starboard Aft 1 - Args 43, 44)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_114mm_QF_MkIII_Twin);
GT.WS[ws].center = "CENTER_GUN_07";
GT.WS[ws].area = "COLLISION_SHELL_GUN_07";
GT.WS[ws].drawArgument1 = 43;
GT.WS[ws].drawArgument2 = 44;
GT.WS[ws].reference_angle_Y = math.rad(-155.0);
GT.WS[ws].angles = {
    {math.rad(-30), math.rad(-170), math.rad(-5), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_114mm_QF_MkIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = trackers_hacs_aft;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_07_1"},
    {connector_name = "POINT_GUN_07_2"},
};

-- WS 17: Gun 08 (Starboard Aft 2 - Args 45, 46)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_114mm_QF_MkIII_Twin);
GT.WS[ws].center = "CENTER_GUN_08";
GT.WS[ws].area = "COLLISION_SHELL_GUN_08";
GT.WS[ws].drawArgument1 = 45;
GT.WS[ws].drawArgument2 = 46;
GT.WS[ws].reference_angle_Y = math.rad(-167.5);
GT.WS[ws].angles = {
    {math.rad(-30), math.rad(-170), math.rad(-5), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_114mm_QF_MkIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = trackers_hacs_aft;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_08_1"},
    {connector_name = "POINT_GUN_08_2"},
};

-- ====================================================================================
-- SECTION 3: Light Anti-Aircraft - 6 x Octuple 40mm Pom-Poms (Args 71-82)
-- ====================================================================================

-- WS 18: Pom-Pom 01 (Starboard Mid Aft - Args 71, 72)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Octuple);
GT.WS[ws].center = "CENTER_POMPOM_01";
GT.WS[ws].area = "COLLISION_SHELL_POMPOM_01";
GT.WS[ws].drawArgument1 = 71;
GT.WS[ws].drawArgument2 = 72;
GT.WS[ws].reference_angle_Y = math.rad(-180);
GT.WS[ws].angles = {
    {math.rad(-20), math.rad(-180), math.rad(-10), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Octuple.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = { {{"self", 6}}, {{"self", 5}}, {{"none"}} }; -- Slaved to PBDT 03 (WS 6), fallback PBDT 02 (WS 5)
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_POMPOM_01_1"},
    {connector_name = "POINT_POMPOM_01_2"},
    {connector_name = "POINT_POMPOM_01_3"},
    {connector_name = "POINT_POMPOM_01_4"},
    {connector_name = "POINT_POMPOM_01_5"},
    {connector_name = "POINT_POMPOM_01_6"},
    {connector_name = "POINT_POMPOM_01_7"},
    {connector_name = "POINT_POMPOM_01_8"},
};

-- WS 19: Pom-Pom 02 (Starboard Island Mid - Args 73, 74)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Octuple);
GT.WS[ws].center = "CENTER_POMPOM_02";
GT.WS[ws].area = "COLLISION_SHELL_POMPOM_02";
GT.WS[ws].drawArgument1 = 73;
GT.WS[ws].drawArgument2 = 74;
GT.WS[ws].reference_angle_Y = math.rad(-180);
GT.WS[ws].angles = {
    {math.rad(-10), math.rad(-180), math.rad(-10), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Octuple.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = { {{"self", 5}}, {{"self", 6}}, {{"none"}} }; -- Slaved to PBDT 02 (WS 5), fallback PBDT 03 (WS 6)
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_POMPOM_02_1"},
    {connector_name = "POINT_POMPOM_02_2"},
    {connector_name = "POINT_POMPOM_02_3"},
    {connector_name = "POINT_POMPOM_02_4"},
    {connector_name = "POINT_POMPOM_02_5"},
    {connector_name = "POINT_POMPOM_02_6"},
    {connector_name = "POINT_POMPOM_02_7"},
    {connector_name = "POINT_POMPOM_02_8"},
};

-- WS 20: Pom-Pom 03 (Starboard Island Fwd 1 - Args 75, 76)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Octuple);
GT.WS[ws].center = "CENTER_POMPOM_03";
GT.WS[ws].area = "COLLISION_SHELL_POMPOM_03";
GT.WS[ws].drawArgument1 = 75;
GT.WS[ws].drawArgument2 = 76;
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(0), math.rad(-150), math.rad(-10), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Octuple.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = { {{"self", 7}}, {{"self", 4}}, {{"none"}} }; -- Slaved to PBDT 04 (WS 7), fallback PBDT 01 (WS 4)
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_POMPOM_03_1"},
    {connector_name = "POINT_POMPOM_03_2"},
    {connector_name = "POINT_POMPOM_03_3"},
    {connector_name = "POINT_POMPOM_03_4"},
    {connector_name = "POINT_POMPOM_03_5"},
    {connector_name = "POINT_POMPOM_03_6"},
    {connector_name = "POINT_POMPOM_03_7"},
    {connector_name = "POINT_POMPOM_03_8"},
};

-- WS 21: Pom-Pom 04 (Starboard Island Fwd 2 - Args 77, 78)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Octuple);
GT.WS[ws].center = "CENTER_POMPOM_04";
GT.WS[ws].area = "COLLISION_SHELL_POMPOM_04";
GT.WS[ws].drawArgument1 = 77;
GT.WS[ws].drawArgument2 = 78;
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(0), math.rad(-160), math.rad(-10), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Octuple.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = { {{"self", 4}}, {{"self", 7}}, {{"none"}} }; -- Slaved to PBDT 01 (WS 4), fallback PBDT 04 (WS 7)
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_POMPOM_04_1"},
    {connector_name = "POINT_POMPOM_04_2"},
    {connector_name = "POINT_POMPOM_04_3"},
    {connector_name = "POINT_POMPOM_04_4"},
    {connector_name = "POINT_POMPOM_04_5"},
    {connector_name = "POINT_POMPOM_04_6"},
    {connector_name = "POINT_POMPOM_04_7"},
    {connector_name = "POINT_POMPOM_04_8"},
};

-- WS 22: Pom-Pom 05 (Port Catwalk Fwd - Args 79, 80)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Octuple);
GT.WS[ws].center = "CENTER_POMPOM_05";
GT.WS[ws].area = "COLLISION_SHELL_POMPOM_05";
GT.WS[ws].drawArgument1 = 79;
GT.WS[ws].drawArgument2 = 80;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(160), math.rad(0), math.rad(-10), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Octuple.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = { {{"self", 9}}, {{"self", 8}}, {{"none"}} }; -- Slaved to PBDT 06 (WS 9), fallback PBDT 05 (WS 8)
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_POMPOM_05_1"},
    {connector_name = "POINT_POMPOM_05_2"},
    {connector_name = "POINT_POMPOM_05_3"},
    {connector_name = "POINT_POMPOM_05_4"},
    {connector_name = "POINT_POMPOM_05_5"},
    {connector_name = "POINT_POMPOM_05_6"},
    {connector_name = "POINT_POMPOM_05_7"},
    {connector_name = "POINT_POMPOM_05_8"},
};

-- WS 23: Pom-Pom 06 (Port Catwalk Aft - Args 81, 82)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Octuple);
GT.WS[ws].center = "CENTER_POMPOM_06";
GT.WS[ws].area = "COLLISION_SHELL_POMPOM_06";
GT.WS[ws].drawArgument1 = 81;
GT.WS[ws].drawArgument2 = 82;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(10), math.rad(-10), math.rad(80)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Octuple.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = { {{"self", 8}}, {{"self", 9}}, {{"none"}} }; -- Slaved to PBDT 05 (WS 8), fallback PBDT 06 (WS 9)
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_POMPOM_06_1"},
    {connector_name = "POINT_POMPOM_06_2"},
    {connector_name = "POINT_POMPOM_06_3"},
    {connector_name = "POINT_POMPOM_06_4"},
    {connector_name = "POINT_POMPOM_06_5"},
    {connector_name = "POINT_POMPOM_06_6"},
    {connector_name = "POINT_POMPOM_06_7"},
    {connector_name = "POINT_POMPOM_06_8"},
};

-- ####################################################################################
-- ###                  Encyclopedia 3D Viewer Posed Combat Display                 ###
-- ####################################################################################

GT.encyclopediaAnimation = {
    args = {
        -- Twin 4.5-inch DP Mounts (Starboard & Port galleries trained outward & elevated)
        [31] = -0.25, [32] = 0.20,
        [33] = -0.25, [34] = 0.20,
        [35] =  0.25, [36] = 0.20,
        [37] =  0.25, [38] = 0.20,
        [39] =  0.75, [40] = 0.20,
        [41] =  0.75, [42] = 0.20,
        [43] = -0.75, [44] = 0.20,
        [45] = -0.75, [46] = 0.20,
        -- Octuple 2-pdr Pom-Poms trained outboard
        [71] = -0.50, [72] = 0.25,
        [73] = -0.50, [74] = 0.25,
        [75] = -0.25, [76] = 0.25,
        [77] = -0.50, [78] = 0.25,
        [79] =  0.50, [80] = 0.25,
        [81] =  0.50, [82] = 0.25,
        -- HACS Mk IV Directors
        [84] = -0.25, [85] =  0.50, [86] = -0.75,
        -- Pom-Pom Director Towers (PBDTs)
        [90] = -0.25, [91] = -0.50, [92] = -0.50, [93] = -0.50,
        [94] =  0.50, [95] =  0.50,
    }
};

-- ####################################################################################
-- ###                     Unit Identification & Attributes                         ###
-- ####################################################################################

GT.Name = "HMS_Illustrious";
GT.DisplayName = _("HMS Illustrious (87)");
GT.DisplayNameShort = _("HMS Illustrious");
GT.Rate = 5500;

GT.Countries = {"UK"};
GT.tags = {"Carrier", "Aircraft Carrier"};
GT.Singleton = "yes";
GT.mapclasskey = "P0091000065"; -- Aircraft Carrier NATO map icon
GT.DetectionRange = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.attribute = {
    wsType_Navy, wsType_Ship, wsType_AirCarrier, WSTYPE_PLACEHOLDER,
    "Aircraft Carriers",
    "Arresting Gear",
    "ski_jump",
    "RADAR_BAND1_FOR_ARM",
    "RADAR_BAND2_FOR_ARM",
    "NO_SAM",
    "Armed ships",
    "Heavy armed ships",
    "NonAndLightArmoredShips",
};

GT.Categories = {
    {name = "AircraftCarrier"},
    {name = "AircraftCarrier With Tramplin"},
    {name = "AircraftCarrier With Arresting Gear"},
    {name = "Armed Ship"},
};

GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = "",
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
};

return GT;
