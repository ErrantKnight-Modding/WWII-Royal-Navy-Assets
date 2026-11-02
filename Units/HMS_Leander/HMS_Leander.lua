-- ============================================================================
-- HMS Leander (75) - Leander-Class Light Cruiser
-- Royal Navy Configuration (1940-1941)
--
-- HISTORICAL & TECHNICAL SPECIFICATIONS:
--   Displacement: 7,270 tons standard / 9,740 tons full load
--   Length: 168.56 m (553 ft) overall, 165.9 m waterline
--   Beam: 16.62 m (54.5 ft)
--   Draft: 5.8 m (19.0 ft) mean
--   Powerplant: 4 Admiralty 3-drum boilers, 4 Parsons geared steam turbines (72,000 shp)
--   Propulsion: 4 shafts (outward counter-rotating screws)
--   Speed: 32.5 knots (16.7 m/s)
--   Armament:
--     - 4 x Twin 6-inch (152mm) BL Mk XXIII Naval Guns (Turrets A, B, X, Y)
--     - 4 x Twin 4-inch (102mm) QF Mk XVI Dual-Purpose High-Angle Guns
--     - 3 x Quadruple Vickers .50-cal (12.7mm) Mk III AA Heavy Machine Guns
--     - 2 x Quadruple 21-inch (533mm) Torpedo Tubes (Port & Starboard)
--   Fire Control & Sensors:
--     - 1 x Bridge Director Control Tower (DCT, Arg 80)
--     - 2 x Optical Rangefinders (Starboard Arg 81, Port Arg 82)
--     - 3 x 44-inch Fighting Searchlights (Args 160, 161, 162)
--     - 1 x Type 279/281 Long-Range Air Warning Radar (Foremast Arg 11)
-- ============================================================================

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_ship);

GT.visual = {};
GT.visual.shape = "HMS_Leander.lods";
GT.visual.shape_dstr = ""; -- Warships sink dynamically; never use static shape_dstr

-- ####################################################################################
-- ###                         General Ship Parameters                              ###
-- ####################################################################################

GT.life                     = 5200;
GT.mass                     = 9740000;  -- 9,740 metric tons full load
GT.max_velocity             = 16.7;     -- 32.5 knots
GT.race_velocity            = 16.7;
GT.economy_velocity         = 8.23;     -- 16 knots
GT.economy_distance         = 10600000; -- 5,730 nmi
GT.race_distance            = 3500000;  -- 1,890 nmi
GT.shipLength               = 168.56;
GT.Width                    = 16.62;
GT.Height                   = 36.0;     -- Keel to mast truck
GT.Length                   = 168.56;
GT.DeckLevel                = 5.5;      -- Mean freeboard
GT.X_nose                   = 82.55;
GT.X_tail                   = -84.26;
GT.Tail_Width               = 2.80;
GT.draft                    = 5.8;
GT.Gamma_max                = 0.35;
GT.Om                       = 0.05;
GT.speedup                  = 0.05;
GT.R_min                    = 500.0;
GT.distFindObstacles        = 800.0;
GT.RCS                      = 22000;

GT.numParking               = 0;
GT.Plane_Num_               = 0;
GT.Helicopter_Num_          = 0;

GT.airWeaponDist            = 20000;
GT.airFindDist              = 35000;

GT.sensor = {
    max_range_finding_target = 35000,
    min_range_finding_target = 0,
    max_alt_finding_target   = 15000,
    min_alt_finding_target   = 0,
    pos                      = {22.30, 18.51, 0.0},
};

GT.exhaust = {
    [1] = { size = 1.1, connector = "POINT_SMOKE_STACK_01" }, -- Single large trunked funnel
};

-- ####################################################################################
-- ###                           Animation Arguments                                ###
-- ####################################################################################

GT.animation_arguments = {
    water_propeller = 8,  -- Quad screws (outward counter-rotating)
    rudder          = 9,  -- Balanced rudder (+/-35 deg)
    nav_lights      = 20, -- Navigation lights & BANO point sprites
};

-- Mission Editor & AI Classification
GT.mapclasskey = "P0091000068";
GT.attribute = {
    wsType_Navy,
    wsType_Ship,
    wsType_ArmedShip,
    WSTYPE_PLACEHOLDER,
    "Cruisers",
    "Armed Air Defence",
    "RADAR_BAND1_FOR_ARM",
    "RADAR_BAND2_FOR_ARM",
};
GT.Categories = {
    {name = "Armed Ship"},
};
GT.tags = {
    "Cruiser",
    "Light Cruiser",
};
GT.Countries = {"UK"};

GT.Sensors = {
    OPTIC = {"long-range naval optics"},
};

-- ####################################################################################
-- ###                               Damage Model                                   ###
-- ####################################################################################

GT.DM = {
    { area_name = "COLLISION_SHELL_BOW",            area_arg = 100, area_life = 1000, armour = {width = 0.025}, area_fire = { pos = {60, 3, 0}, size = 1.0} },
    { area_name = "COLLISION_SHELL_MIDSHIPS",        area_arg = 102, area_life = 1800, armour = {width = 0.076}, area_fire = { pos = {0, 4, 0}, size = 1.5} },
    { area_name = "COLLISION_SHELL_AFT",             area_arg = 101, area_life = 1000, armour = {width = 0.025}, area_fire = { pos = {-60, 3, 0}, size = 1.0} },
    { area_name = "COLLISION_SHELL_SUPERSTRUCTURE",  area_arg = 104, area_life = 800,  armour = {width = 0.025}, area_fire = { pos = {15, 10, 0}, size = 1.2} },
    { area_name = "COLLISION_SHELL_TURRET_A",        area_arg = 105, area_life = 300,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_TURRET_B",        area_arg = 106, area_life = 300,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_TURRET_X",        area_arg = 107, area_life = 300,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_TURRET_Y",        area_arg = 108, area_life = 300,  armour = {width = 0.025} },
};

-- ####################################################################################
-- Standalone weapon fallback loading
if not (GT_t and GT_t.WS_t and GT_t.WS_t.UK_6in_BL_MkXXIII_Twin) then
    local wp_base = current_mod_path and (current_mod_path .. "/Weapons/") or "Weapons/"
    dofile(wp_base .. "WeaponConstants.lua")
    dofile(wp_base .. "shells.lua")
    dofile(wp_base .. "torpedoes.lua")
    dofile(wp_base .. "guns.lua")
    dofile(wp_base .. "directors.lua")
end

-- ####################################################################################
-- ###                                 Armament                                     ###
-- ####################################################################################

GT.WS = {};
GT.WS.maxTargetDetectionRange = 35000;
GT.WS.radar_type = 103;
GT.WS.searchRadarMaxElevation = math.rad(60);
GT.WS.searchRadarFrequencies = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}};

local ws;

--------------------------------------------------------------------------------------
-- 1. Fire Control Directors (Optical & Radar Rangefinders)
--------------------------------------------------------------------------------------

-- Station 1: Main Battery 6-inch Director Control Tower (DCT Mk VI + Type 284 Radar, Arg 80)
ws = GT_t.inc_ws();
local ws_dct = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_DCT_Secondary_MkIV);
GT.WS[ws].center = "CENTER_DIRECTOR_DCT";
GT.WS[ws].pointer = "POINT_SIGHT_DIRECTOR_DCT";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 80;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_DCT_Secondary_MkIV.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_DCT"} };

-- Station 2: High Angle Control System (HACS Mk III Secondary/AA Director, Arg 83)
ws = GT_t.inc_ws();
local ws_hacs = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_HACS";
GT.WS[ws].pointer = "POINT_SIGHT_DIRECTOR_HACS";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 83;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_HACS_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_HACS"} };

-- Station 3: Starboard Bridge Wing Rangefinder (Arg 81)
ws = GT_t.inc_ws();
local ws_rf_stbd = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_DCT_Destroyer_Optic);
GT.WS[ws].center = "CENTER_RANGEFINDER_STBD";
GT.WS[ws].pointer = "POINT_SIGHT_RANGEFINDER_STBD";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 81;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = {
    {math.rad(10), math.rad(-170), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_DCT_Destroyer_Optic.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_RANGEFINDER_STBD"} };

-- Station 4: Port Bridge Wing Rangefinder (Arg 82)
ws = GT_t.inc_ws();
local ws_rf_port = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_DCT_Destroyer_Optic);
GT.WS[ws].center = "CENTER_RANGEFINDER_PORT";
GT.WS[ws].pointer = "POINT_SIGHT_RANGEFINDER_PORT";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 82;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(-10), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_DCT_Destroyer_Optic.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_RANGEFINDER_PORT"} };

-- Director slaving failover tracker chains:
-- Main 6-inch Battery: DCT primary, bridge wing rangefinders secondary, local fallback
local main_trackers = {
    {{"self", ws_dct}},
    {{"self", ws_rf_stbd}},
    {{"self", ws_rf_port}},
    {{"none"}}
};

-- Secondary 4-inch Dual-Purpose Battery: HACS AA director primary, DCT surface secondary, local fallback
local sec_trackers = {
    {{"self", ws_hacs}},
    {{"self", ws_dct}},
    {{"none"}}
};

-- Torpedo Tubes: DCT primary, bridge wing rangefinders secondary, local fallback
local torp_trackers = {
    {{"self", ws_dct}},
    {{"self", ws_rf_stbd}},
    {{"self", ws_rf_port}},
    {{"none"}}
};

--------------------------------------------------------------------------------------
-- 2. Fighting Searchlights: 44-inch (112 cm) Projectors (Args 160-162)
--------------------------------------------------------------------------------------

-- Searchlight 1: Starboard Amidships (Arg 160)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_01";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_01";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 160;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = { {math.rad(-30), math.rad(-150), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_01";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_01"} };

-- Searchlight 2: Port Amidships (Arg 161)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_02";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_02";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 161;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = { {math.rad(150), math.rad(30), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_02";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_02"} };

-- Searchlight 3: Aft Platform (Arg 162)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_03";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_03";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 162;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles = {
    {math.rad(180), math.rad(45), math.rad(-10), math.rad(85)},
    {math.rad(-45), math.rad(-180), math.rad(-10), math.rad(85)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_03";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_03"} };

--------------------------------------------------------------------------------------
-- 3. Main Battery: 6-inch (152mm) BL Mk XXIII (4 x Twin Turrets A, B, X, Y)
--------------------------------------------------------------------------------------

-- Turret A (Forecastle Lower, Args 1 & 2)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_6in_BL_MkXXIII_Twin);
GT.WS[ws].center = "CENTER_GUN_A";
GT.WS[ws].area = "COLLISION_SHELL_TURRET_A";
GT.WS[ws].drawArgument1 = 1;
GT.WS[ws].drawArgument2 = 2;
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-150), math.rad(-5), math.rad(40)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_6in_BL_MkXXIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = main_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_01_1"},
    {connector_name = "POINT_GUN_01_2"},
};

-- Turret B (Forecastle Superfiring, Args 3 & 4)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_6in_BL_MkXXIII_Twin);
GT.WS[ws].center = "CENTER_GUN_B";
GT.WS[ws].area = "COLLISION_SHELL_TURRET_B";
GT.WS[ws].drawArgument1 = 3;
GT.WS[ws].drawArgument2 = 4;
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-150), math.rad(-5), math.rad(40)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_6in_BL_MkXXIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = main_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_02_1"},
    {connector_name = "POINT_GUN_02_2"},
};

-- Turret X (Quarterdeck Superfiring, Args 7 & 10)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_6in_BL_MkXXIII_Twin);
GT.WS[ws].center = "CENTER_GUN_X";
GT.WS[ws].area = "COLLISION_SHELL_TURRET_X";
GT.WS[ws].drawArgument1 = 7;
GT.WS[ws].drawArgument2 = 10;
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles = {
    {math.rad(180), math.rad(30), math.rad(-5), math.rad(40)},
    {math.rad(-30), math.rad(-180), math.rad(-5), math.rad(40)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_6in_BL_MkXXIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = main_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_03_1"},
    {connector_name = "POINT_GUN_03_2"},
};

-- Turret Y (Quarterdeck Lower, Args 15 & 16)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_6in_BL_MkXXIII_Twin);
GT.WS[ws].center = "CENTER_GUN_Y";
GT.WS[ws].area = "COLLISION_SHELL_TURRET_Y";
GT.WS[ws].drawArgument1 = 15;
GT.WS[ws].drawArgument2 = 16;
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles = {
    {math.rad(180), math.rad(30), math.rad(-5), math.rad(40)},
    {math.rad(-30), math.rad(-180), math.rad(-5), math.rad(40)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_6in_BL_MkXXIII_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = main_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_04_1"},
    {connector_name = "POINT_GUN_04_2"},
};

--------------------------------------------------------------------------------------
-- 4. Secondary Battery: 4-inch (102mm) QF Mk XVI Dual-Purpose (4 x Twin Mounts)
--------------------------------------------------------------------------------------

-- Mount 1: Starboard Forward (Args 31 & 32)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_102mm_QF_MkXVI_Twin);
GT.WS[ws].center = "CENTER_SEC_01";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 31;
GT.WS[ws].drawArgument2 = 32;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = {
    {math.rad(-10), math.rad(-170), math.rad(-5), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_102mm_QF_MkXVI_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = sec_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_SEC_01_1"},
    {connector_name = "POINT_GUN_SEC_01_2"},
};

-- Mount 2: Starboard Aft (Args 33 & 34)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_102mm_QF_MkXVI_Twin);
GT.WS[ws].center = "CENTER_SEC_02";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 33;
GT.WS[ws].drawArgument2 = 34;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = {
    {math.rad(-10), math.rad(-170), math.rad(-5), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_102mm_QF_MkXVI_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = sec_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_SEC_02_1"},
    {connector_name = "POINT_GUN_SEC_02_2"},
};

-- Mount 3: Port Aft (Args 35 & 36)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_102mm_QF_MkXVI_Twin);
GT.WS[ws].center = "CENTER_SEC_03";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 35;
GT.WS[ws].drawArgument2 = 36;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(10), math.rad(-5), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_102mm_QF_MkXVI_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = sec_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_SEC_03_1"},
    {connector_name = "POINT_GUN_SEC_03_2"},
};

-- Mount 4: Port Forward (Args 37 & 38)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_102mm_QF_MkXVI_Twin);
GT.WS[ws].center = "CENTER_SEC_04";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 37;
GT.WS[ws].drawArgument2 = 38;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(10), math.rad(-5), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_102mm_QF_MkXVI_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = sec_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_SEC_04_1"},
    {connector_name = "POINT_GUN_SEC_04_2"},
};

--------------------------------------------------------------------------------------
-- 5. Light AA: Vickers .50-cal (12.7mm) Mark III (3 x Quadruple Mounts)
--------------------------------------------------------------------------------------

-- Vickers 1: Starboard Bridge Wing (Args 21 & 22)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_50cal_Vickers_Quad);
GT.WS[ws].center = "CENTER_VICKERS_01";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 21;
GT.WS[ws].drawArgument2 = 22;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = {
    {math.rad(10), math.rad(-170), math.rad(-10), math.rad(70)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_50cal_Vickers_Quad.LN[1]);
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_VICKERS_01_1"},
    {connector_name = "POINT_GUN_VICKERS_01_2"},
    {connector_name = "POINT_GUN_VICKERS_01_3"},
    {connector_name = "POINT_GUN_VICKERS_01_4"},
};

-- Vickers 2: Aft Deckhouse (Args 23 & 24)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_50cal_Vickers_Quad);
GT.WS[ws].center = "CENTER_VICKERS_02";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 23;
GT.WS[ws].drawArgument2 = 24;
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles = {
    {math.rad(180), math.rad(30), math.rad(-10), math.rad(70)},
    {math.rad(-30), math.rad(-180), math.rad(-10), math.rad(70)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_50cal_Vickers_Quad.LN[1]);
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_VICKERS_02_1"},
    {connector_name = "POINT_GUN_VICKERS_02_2"},
    {connector_name = "POINT_GUN_VICKERS_02_3"},
    {connector_name = "POINT_GUN_VICKERS_02_4"},
};

-- Vickers 3: Port Bridge Wing (Args 25 & 26)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_50cal_Vickers_Quad);
GT.WS[ws].center = "CENTER_VICKERS_03";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE";
GT.WS[ws].drawArgument1 = 25;
GT.WS[ws].drawArgument2 = 26;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(-10), math.rad(-10), math.rad(70)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_50cal_Vickers_Quad.LN[1]);
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_VICKERS_03_1"},
    {connector_name = "POINT_GUN_VICKERS_03_2"},
    {connector_name = "POINT_GUN_VICKERS_03_3"},
    {connector_name = "POINT_GUN_VICKERS_03_4"},
};

--------------------------------------------------------------------------------------
-- 6. Torpedo Battery: 21-inch Quadruple Mounts (2 Mounts, Args 13 & 14)
--------------------------------------------------------------------------------------

-- Torpedo Mount Starboard (Arg 13)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_21in_Quadruple_Torpedo);
GT.WS[ws].center = "CENTER_TORP_01";
GT.WS[ws].area = "COLLISION_SHELL_MIDSHIPS";
GT.WS[ws].drawArgument1 = 13;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = {
    {math.rad(-30), math.rad(-150), math.rad(-5), math.rad(25)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_21in_Quadruple_Torpedo.LN[1]);
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_TORP_01_1"},
    {connector_name = "POINT_TORP_01_2"},
    {connector_name = "POINT_TORP_01_3"},
    {connector_name = "POINT_TORP_01_4"},
};
GT.WS[ws].LN[1].depends_on_unit = torp_trackers;

-- Torpedo Mount Port (Arg 14)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_21in_Quadruple_Torpedo);
GT.WS[ws].center = "CENTER_TORP_02";
GT.WS[ws].area = "COLLISION_SHELL_MIDSHIPS";
GT.WS[ws].drawArgument1 = 14;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(30), math.rad(-5), math.rad(25)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_21in_Quadruple_Torpedo.LN[1]);
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_TORP_02_1"},
    {connector_name = "POINT_TORP_02_2"},
    {connector_name = "POINT_TORP_02_3"},
    {connector_name = "POINT_TORP_02_4"},
};
GT.WS[ws].LN[1].depends_on_unit = torp_trackers;

-- ####################################################################################
-- Unit Identification & Shape Registration
-- ####################################################################################

GT.Name = "HMS_Leander";
GT.DisplayName = _("HMS Leander (75)");
GT.DisplayNameShort = _("HMS Leander");
GT.Rate = 4000;

GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = "",
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
};

GT.encyclopediaAnimation = {
    args = {
        -- Main 152mm Twin Turrets (Trained outward & elevated)
        [1] = -0.20, [2] = 0.25,
        [3] = -0.20, [4] = 0.25,
        [7] =  0.20, [10] = 0.25,
        [15] = 0.20, [16] = 0.25,
        -- Quadruple 21-inch Torpedo Mounts (Trained outward)
        [13] = -0.35,
        [14] =  0.35,
        -- Secondary 102mm Twin Mounts (Trained outward & elevated)
        [31] = -0.30, [32] = 0.35,
        [33] = -0.30, [34] = 0.35,
        [35] =  0.30, [36] = 0.35,
        [37] =  0.30, [38] = 0.35,
        -- Vickers .50-cal Quad Mounts
        [21] = -0.40, [22] = 0.30,
        [23] =  0.00, [24] = 0.30,
        [25] =  0.40, [26] = 0.30,
        -- Fire Control Directors
        [80] = -0.20,  -- Main 6-inch DCT trained with main battery
        [83] =  0.25,  -- Secondary AA HACS Mk III trained skyward
        [81] = -0.35,  -- Starboard Rangefinder
        [82] =  0.35,  -- Port Rangefinder
    }
};

return GT;
