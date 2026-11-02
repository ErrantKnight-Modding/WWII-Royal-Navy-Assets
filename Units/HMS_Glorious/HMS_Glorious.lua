-- ============================================================================
-- HMS Glorious (77) - Courageous-Class Aircraft Carrier
-- Royal Navy Configuration (1939-1940)
--
-- HISTORICAL & TECHNICAL SPECIFICATIONS:
--   Displacement: 22,500 tons standard / 27,420 tons full load
--   Length: 240.0 m (786 ft) overall, 224.1 m (735 ft) waterline
--   Beam: 27.6 m (90.5 ft), Flight Deck width: 31.0 m (100 ft)
--   Draft: 8.5 m (28.0 ft) mean
--   Powerplant: 18 Yarrow small-tube boilers, 4 Parsons direct-drive steam turbines (90,000 shp)
--   Propulsion: 4 shafts (outward counter-rotating quad screws)
--   Speed: 30.5 knots (15.7 m/s)
--   Air Group: 48 aircraft (Gloster Sea Gladiator, Fairey Swordfish, Sea Hurricane)
--   Armament:
--     - 16 x Single 4.7-inch (120mm) QF Mk VIII High-Angle Dual-Purpose Guns (Args 31-62)
--     - 3 x Octuple 2-pdr (40mm) "Pom-Pom" Mk VIII AA Autocannon Mountings (Args 71-76)
--     - 1 x Quadruple Vickers .50-cal (12.7mm) Mk III AA Heavy Machine Gun Mount (Args 77-78)
--   Fire Control & Sensors:
--     - 4 x High Angle Control System (HACS Mk III) Directors (Args 80-83)
--     - 4 x 44-inch Fighting Searchlights (Args 160-163)
--   Companion Systems:
--     - Quad hydrodynamic propellers (Arg 8)
--     - Balanced rudder (+/-35 deg, Arg 9)
--     - Admiralty pattern navigation running lights & masthead/stern lanterns (Arg 20)
-- ============================================================================

GT = {};
local rwr_path = (current_mod_path and (current_mod_path .. "/Units/HMS_Glorious/") or "") .. "HMS_Glorious_RunwaysAndRoutes.lua"
dofile(rwr_path)

GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_ship);

GT.visual = {};
GT.visual.shape = "HMS_Glorious";
GT.visual.shape_dstr = "";

-- ####################################################################################
-- ###                         General Ship Parameters                              ###
-- ####################################################################################

GT.life                     = 6500;
GT.mass                     = 27420000; -- 27,420 metric tons full load
GT.max_velocity             = 15.68;    -- 30.5 knots
GT.race_velocity            = 15.68;
GT.economy_velocity         = 8.23;     -- 16 knots
GT.economy_distance         = 11000000; -- ~5,900 nmi
GT.race_distance            = 4000000;  -- ~2,160 nmi
GT.shipLength               = 220.2;    -- Waterline length (stem to propeller/rudder post)
GT.Width                    = 27.6;
GT.Height                   = 44.7;     -- Keel to island foremast truck
GT.Length                   = 240.0;    -- Overall length over flight deck
GT.DeckLevel                = 17.65;    -- Flight deck landing area elevation above waterline
GT.X_nose                   = 118.24;
GT.X_tail                   = -102.0;   -- Waterline stern termination at rear inner propellers
GT.Tail_Width               = 6.0;
GT.draft                    = 8.5;
GT.Gamma_max                = 0.35;
GT.Om                       = 0.05;
GT.speedup                  = 0.05;
GT.R_min                    = 650.0;
GT.distFindObstacles        = 1000.0;
GT.RCS                      = 60000;

GT.isCarrier                = true;
GT.numParking               = 16;
GT.Plane_Num_               = 48;
GT.Helicopter_Num_          = 0;
GT.Landing_Point            = {-75.0, 17.70, 0.0}; -- Touchdown point for landing aircraft

-- Radio & Optical Landing Aids
GT.TACAN                    = true;
GT.TACAN_def_channel        = 77; -- HMS Glorious Pennant 77
GT.TACAN_position           = {17.0, 35.0, 13.0}; -- Island masthead

GT.ICLS                     = true;
GT.ICLS_Localizer_position  = {-107.0, 17.75,   0.0, 180.0}; -- {x, y, z, yaw [deg]}
GT.ICLS_Glideslope_position = {-107.0, 17.75, -12.0,   3.0}; -- {x, y, z, glideslope [deg]}

-- Landing Signal Officer's View (LALT + F9) - Port aft catwalk
GT.LSOView                  = { cockpit = "empty", position = {-95.0, 19.25, -12.5, 175.0, 3.0} };

GT.airWeaponDist            = 15000;
GT.airFindDist              = 30000;

GT.sensor = {
    max_range_finding_target = 35000,
    min_range_finding_target = 0,
    max_alt_finding_target   = 15000,
    min_alt_finding_target   = 0,
    pos                      = {28.43, 44.70, -13.04}, 
};

GT.exhaust = {
    [1] = { size = 1.2, connector = "POINT_SMOKE_STACK_01" }, -- Island Main Funnel
};

-- ####################################################################################
-- ###                           Animation Arguments                                ###
-- ####################################################################################

GT.animation_arguments = {
    water_propeller = 8,  -- 4 Outward Counter-Rotating Screws (9-keyframe SLERP standard)
    rudder          = 9,  -- Balanced Semi-Spade Rudder (+/- 35 deg)
    antennas        = 25, -- Radio antenna masts & cables (0.0: Lowered horizontal, 1.0: Raised vertical)
    nav_lights      = 20, -- Admiralty Navigation Running Lights & Masthead/Stern BANOs
};

-- ####################################################################################
-- ###                               Damage Model                                   ###
-- ####################################################################################

GT.DM = {
    -- =========================================================================
    -- Flight Deck & Gallery Compartments
    -- =========================================================================
    { area_name = "Glorious_Deck.Fore",            area_arg = 100, area_life = 350, armour = {width = 0.025}, area_fire = { pos = {40.0, 18.5, 0.0}, size = 1.2}, belongsToRunway = true},
    { area_name = "Glorious_Deck.Rear",            area_arg = 101, area_life = 350, armour = {width = 0.025}, area_fire = { pos = {-60.0, 18.5, 0.0}, size = 1.2}, belongsToRunway = true},

    -- =========================================================================
    -- Lower Hull & Underwater Citadel (Port / Starboard Watertight Zones)
    -- =========================================================================
    -- Zone 01: Stern, Steering Gear & Shaft Passages (X <= -60.0m)
    { area_name = "Glorious_Hull.Lower_L_01",      area_arg = 101, area_life = 200, armour = {width = 0.025}},
    { area_name = "Glorious_Hull.Lower_R_01",      area_arg = 101, area_life = 200, armour = {width = 0.025}},

    -- Zone 02: Aft Machinery & Turbine Rooms (X in [-60.0m, -13.36m], 3-inch Belt Armor)
    { area_name = "Glorious_Hull.Lower_L_02",      area_arg = 102, area_life = 250, armour = {width = 0.076}},
    { area_name = "Glorious_Hull.Lower_R_02",      area_arg = 102, area_life = 250, armour = {width = 0.076}},

    -- Zone 03: Midships Boiler Rooms (X in [-13.36m, +22.48m], 3-inch Belt Armor)
    { area_name = "Glorious_Hull.Lower_L_03",      area_arg = 102, area_life = 250, armour = {width = 0.076}},
    { area_name = "Glorious_Hull.Lower_R_03",      area_arg = 102, area_life = 250, armour = {width = 0.076}},

    -- Zone 04: Forward Boiler Rooms & Magazines (X in [+22.48m, +65.0m], 3-inch Belt Armor)
    { area_name = "Glorious_Hull.Lower_L_04",      area_arg = 102, area_life = 250, armour = {width = 0.076}},
    { area_name = "Glorious_Hull.Lower_R_04",      area_arg = 102, area_life = 250, armour = {width = 0.076}},

    -- Zone 05: Bow Forepeak & Cutwater Stem (X >= +65.0m)
    { area_name = "Glorious_Hull.Lower_L_05",      area_arg = 100, area_life = 150, armour = {width = 0.025}, area_fire = { pos = {90.0, 10.0, 0.0}, size = 1.0}},
    { area_name = "Glorious_Hull.Lower_R_05",      area_arg = 100, area_life = 150, armour = {width = 0.025}, area_fire = { pos = {90.0, -10.0, 0.0}, size = 1.0}},

    -- =========================================================================
    -- Upper Hull & Hangar Deck Freeboard
    -- =========================================================================
    { area_name = "Glorious_Hull.Upper_L_01A",     area_arg = 101, area_life = 80,  armour = {width = 0.025}},
    { area_name = "Glorious_Hull.Upper_L_01B",     area_arg = 101, area_life = 80,  armour = {width = 0.025}},
    { area_name = "Glorious_Hull.Upper_R_01A",     area_arg = 101, area_life = 80,  armour = {width = 0.025}},
    { area_name = "Glorious_Hull.Upper_R_01B",     area_arg = 101, area_life = 80,  armour = {width = 0.025}},
    { area_name = "Glorious_Hull.Upper_L_02",      area_arg = 102, area_life = 120, armour = {width = 0.076}},
    { area_name = "Glorious_Hull.Upper_R_02",      area_arg = 102, area_life = 120, armour = {width = 0.076}},
    { area_name = "Glorious_Hull.Upper_L_03",      area_arg = 102, area_life = 120, armour = {width = 0.076}},
    { area_name = "Glorious_Hull.Upper_R_03",      area_arg = 102, area_life = 120, armour = {width = 0.076}},
    { area_name = "Glorious_Hull.Upper_L_04",      area_arg = 100, area_life = 100, armour = {width = 0.025}},
    { area_name = "Glorious_Hull.Upper_R_04",      area_arg = 100, area_life = 100, armour = {width = 0.025}},

    -- =========================================================================
    -- Sponsons & Catwalk Metal Structures
    -- =========================================================================
    { area_name = "Metal_Structure.001_L_01",      area_arg = 101, area_life = 50,  armour = {width = 0.015}},
    { area_name = "Metal_Structure.001_L_02",      area_arg = 102, area_life = 60,  armour = {width = 0.015}},
    { area_name = "Metal_Structure.001_L_03",      area_arg = 102, area_life = 60,  armour = {width = 0.015}},
    { area_name = "Metal_Structure.001_R_01",      area_arg = 101, area_life = 50,  armour = {width = 0.015}},
    { area_name = "Metal_Structure.001_R_02",      area_arg = 102, area_life = 60,  armour = {width = 0.015}},
    { area_name = "Metal_Structure.001_R_03",      area_arg = 102, area_life = 60,  armour = {width = 0.015}},

    -- =========================================================================
    -- Island Superstructure & Masthead Cupola
    -- =========================================================================
    { area_name = "Glorious_Island.003",           area_arg = 104, area_life = 100, armour = {width = 0.020}, area_fire = { pos = {17.0, 26.0, -13.0}, size = 1.0}},
    { area_name = "Glorious_Island.004",           area_arg = 104, area_life = 100, armour = {width = 0.020}},
    { area_name = "Glorious_Island.005",           area_arg = 104, area_life = 100, armour = {width = 0.020}},
    { area_name = "Island_Structrure.002",         area_arg = 104, area_life = 60,  armour = {width = 0.015}},
    { area_name = "Island_Structrure.003",         area_arg = 104, area_life = 60,  armour = {width = 0.015}},
    { area_name = "COLLISION_SHELL_MAST",          area_arg = 105, area_life = 80,  armour = {width = 0.012}},

    -- =========================================================================
    -- Heavy AA Battery 4.7-inch (120mm) Single Mounts (00 to 15)
    -- =========================================================================
    { area_name = "COLLISION_SHELL_GUN_00",        area_arg = 110, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_01",        area_arg = 111, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_02",        area_arg = 112, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_03",        area_arg = 113, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_04",        area_arg = 114, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_05",        area_arg = 115, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_06",        area_arg = 116, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_07",        area_arg = 117, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_08",        area_arg = 118, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_09",        area_arg = 119, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_10",        area_arg = 120, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_11",        area_arg = 121, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_12",        area_arg = 122, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_13",        area_arg = 123, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_14",        area_arg = 124, area_life = 60},
    { area_name = "COLLISION_SHELL_GUN_15",        area_arg = 125, area_life = 60},

    -- =========================================================================
    -- Light AA 2-pdr Pom-Pom Octuple Mounts (1 to 3)
    -- =========================================================================
    { area_name = "COLLISION_SHELL_POMPOM_01",     area_arg = 130, area_life = 40},
    { area_name = "COLLISION_SHELL_POMPOM_02",     area_arg = 131, area_life = 40},
    { area_name = "COLLISION_SHELL_POMPOM_03",     area_arg = 132, area_life = 40},

    -- Compatibility aliases for legacy weapon damage references
    { area_name = "AA_120_00",                     area_arg = 110, area_life = 60},
    { area_name = "POMPOM_8_1",                    area_arg = 130, area_life = 40},
    { area_name = "VICKERS_1",                     area_arg = 135, area_life = 25},
    { area_name = "DIRECTOR_HACS_1",               area_arg = 140, area_life = 30},
    { area_name = "DIRECTOR_HACS_2",               area_arg = 141, area_life = 30},
    { area_name = "DIRECTOR_HACS_3",               area_arg = 142, area_life = 30},
    { area_name = "DIRECTOR_HACS_4",               area_arg = 143, area_life = 30},
    { area_name = "SEARCHLIGHT_1",                 area_arg = 165, area_life = 20},
    { area_name = "SEARCHLIGHT_2",                 area_arg = 166, area_life = 20},
    { area_name = "SEARCHLIGHT_3",                 area_arg = 167, area_life = 20},
    { area_name = "SEARCHLIGHT_4",                 area_arg = 168, area_life = 20},
};

-- ####################################################################################
-- Note: Naval weapons & shells are centralized in Weapons/
if not (GT_t and GT_t.WS_t and GT_t.WS_t.UK_120mm_QF_MkVIII_Single) then
    local wp_base = current_mod_path and (current_mod_path .. "/Weapons/") or "Weapons/"
    dofile(wp_base .. "WeaponConstants.lua")
    dofile(wp_base .. "shells.lua")
    dofile(wp_base .. "guns.lua")
    dofile(wp_base .. "directors.lua")
end

-- ####################################################################################
-- ###                             Weapon Stations                                  ###
-- ####################################################################################

GT.WS = {};
GT.WS.maxTargetDetectionRange = 35000;
GT.WS.radar_type = 103;
GT.WS.searchRadarFrequencies = {{50.0e6, 54.0e6}, {500.0e6, 600.0e6}};

local ws;

--------------------------------------------------------------------------------------
-- 1. High Angle Control System (HACS Mk III) Directors (4 Stations: Args 80-83)
--------------------------------------------------------------------------------------

-- Station 1: Starboard Forward HACS Director (Arg 80)
ws = GT_t.inc_ws();
local ws_hacs_stbd_fwd = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_HACS_01";
GT.WS[ws].pointer = "POINT_SIGHT_DIRECTOR_01";
GT.WS[ws].area = "Glorious_Island.004";
GT.WS[ws].drawArgument1 = 80;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(45), math.rad(-135), math.rad(-10), math.rad(85)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_HACS_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_01"} };

-- Station 2: Port Forward HACS Director (Arg 81)
ws = GT_t.inc_ws();
local ws_hacs_port_fwd = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_HACS_02";
GT.WS[ws].pointer = "POINT_SIGHT_DIRECTOR_02";
GT.WS[ws].area = "Glorious_Deck.Fore";
GT.WS[ws].drawArgument1 = 81;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(135), math.rad(-45), math.rad(-10), math.rad(85)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_HACS_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_02"} };

-- Station 3: Starboard Aft HACS Director (Arg 82)
ws = GT_t.inc_ws();
local ws_hacs_stbd_aft = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_HACS_03";
GT.WS[ws].pointer = "POINT_SIGHT_DIRECTOR_03";
GT.WS[ws].area = "Glorious_Deck.Rear";
GT.WS[ws].drawArgument1 = 82;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(-180);
GT.WS[ws].angles = {
    {math.rad(-45), math.rad(-180), math.rad(-10), math.rad(85)},
    {math.rad(180), math.rad(135), math.rad(-10), math.rad(85)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_HACS_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_03"} };

-- Station 4: Port Aft HACS Director (Arg 83)
ws = GT_t.inc_ws();
local ws_hacs_port_aft = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIII);
GT.WS[ws].center = "CENTER_DIRECTOR_HACS_04";
GT.WS[ws].pointer = "POINT_SIGHT_DIRECTOR_04";
GT.WS[ws].area = "Glorious_Deck.Rear";
GT.WS[ws].drawArgument1 = 83;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles = {
    {math.rad(180), math.rad(45), math.rad(-10), math.rad(85)},
    {math.rad(-135), math.rad(-180), math.rad(-10), math.rad(85)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_HACS_MkIII.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_04"} };

-- Failover Director Tracker Chains (Quadrant Slaved)
local trackers_stbd_fwd = {
    {{"self", ws_hacs_stbd_fwd}},
    {{"self", ws_hacs_stbd_aft}},
    {{"none"}}
};
local trackers_port_fwd = {
    {{"self", ws_hacs_port_fwd}},
    {{"self", ws_hacs_port_aft}},
    {{"none"}}
};
local trackers_stbd_aft = {
    {{"self", ws_hacs_stbd_aft}},
    {{"self", ws_hacs_stbd_fwd}},
    {{"none"}}
};
local trackers_port_aft = {
    {{"self", ws_hacs_port_aft}},
    {{"self", ws_hacs_port_fwd}},
    {{"none"}}
};

--------------------------------------------------------------------------------------
-- 2. Fighting Searchlights: 44-inch Projectors (4 Stations: Args 160-163)
--------------------------------------------------------------------------------------

-- Searchlight 1: Port Forward Catwalk (Arg 160)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_01";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_01";
GT.WS[ws].area = "Glorious_Deck.Fore";
GT.WS[ws].drawArgument1 = 160;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(45);
GT.WS[ws].angles = { {math.rad(135), math.rad(-45), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_01";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_01"} };

-- Searchlight 2: Island Starboard Bridge Wing (Arg 161)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_02";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_02";
GT.WS[ws].area = "Glorious_Island.003";
GT.WS[ws].drawArgument1 = 161;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-45);
GT.WS[ws].angles = { {math.rad(45), math.rad(-135), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_02";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_02"} };

-- Searchlight 3: Port Aft Catwalk (Arg 162)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_03";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_03";
GT.WS[ws].area = "Glorious_Deck.Rear";
GT.WS[ws].drawArgument1 = 162;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(135);
GT.WS[ws].angles = {
    {math.rad(180), math.rad(45), math.rad(-10), math.rad(85)},
    {math.rad(-135), math.rad(-180), math.rad(-10), math.rad(85)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_03";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_03"} };

-- Searchlight 4: Starboard Aft Catwalk (Arg 163)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_04";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_04";
GT.WS[ws].area = "Glorious_Deck.Rear";
GT.WS[ws].drawArgument1 = 163;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-135);
GT.WS[ws].angles = {
    {math.rad(-45), math.rad(-180), math.rad(-10), math.rad(85)},
    {math.rad(180), math.rad(135), math.rad(-10), math.rad(85)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_04";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_04"} };

--------------------------------------------------------------------------------------
-- 3. Heavy AA Battery: 4.7-inch (120mm) QF Mk VIII Single HA Mounts (16 Stations)
--------------------------------------------------------------------------------------
-- Even mounts (0, 2, 4, 6, 8, 10, 12, 14) on Starboard side
-- Odd mounts (1, 3, 5, 7, 9, 11, 13, 15) on Port side

for i = 0, 15 do
    ws = GT_t.inc_ws();
    GT.WS[ws] = {};
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_120mm_QF_MkVIII_Single);
    
    local idx_str = string.format("%02d", i);
    local is_stbd = (i % 2 == 0);
    local is_fwd = (i <= 7);
    GT.WS[ws].center = "CENTER_GUN_" .. idx_str;
    if i == 14 or i == 15 then
        GT.WS[ws].area = is_stbd and "Glorious_Hull.Upper_R_01A" or "Glorious_Hull.Upper_L_01A";
    elseif i >= 10 then
        GT.WS[ws].area = is_stbd and "Glorious_Hull.Upper_R_02" or "Glorious_Hull.Upper_L_02";
    elseif i >= 8 then
        GT.WS[ws].area = is_stbd and "Glorious_Hull.Upper_R_03" or "Glorious_Hull.Upper_L_03";
    else
        GT.WS[ws].area = is_stbd and "Glorious_Hull.Upper_R_04" or "Glorious_Hull.Upper_L_04";
    end
    GT.WS[ws].drawArgument1 = 31 + (i * 2);
    GT.WS[ws].drawArgument2 = 32 + (i * 2);
    GT.WS[ws].moveable = true;
    GT.WS[ws].pos = {0.0, 0.0, 0.0};
    
    GT.WS[ws].LN = { [1] = {} };
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_120mm_QF_MkVIII_Single.LN[1]);
    
    if is_stbd then
        if is_fwd then
            -- Starboard Forward Mounts (00, 02, 04, 06): Stowed forward (04 tucked at -8 deg along hull)
            GT.WS[ws].reference_angle_Y = (i == 4) and math.rad(-8) or math.rad(0);
            GT.WS[ws].angles = {
                {math.rad(10), math.rad(-170), math.rad(-5), math.rad(85)}
            };
            GT.WS[ws].LN[1].depends_on_unit = trackers_stbd_fwd;
        else
            -- Starboard Aft Mounts (08, 10, 12, 14): Stowed aft (-180 deg, 14 tucked at -172 deg along stern)
            GT.WS[ws].reference_angle_Y = (i == 14) and math.rad(-172) or math.rad(-180);
            GT.WS[ws].angles = {
                {math.rad(10), math.rad(-180), math.rad(-5), math.rad(85)}
            };
            GT.WS[ws].LN[1].depends_on_unit = trackers_stbd_aft;
        end
    else
        if is_fwd then
            -- Port Forward Mounts (01, 03, 05, 07): Stowed forward (05 tucked at +8 deg along hull)
            GT.WS[ws].reference_angle_Y = (i == 5) and math.rad(8) or math.rad(0);
            GT.WS[ws].angles = {
                {math.rad(170), math.rad(-10), math.rad(-5), math.rad(85)}
            };
            GT.WS[ws].LN[1].depends_on_unit = trackers_port_fwd;
        else
            -- Port Aft Mounts (09, 11, 13, 15): Stowed aft (+180 deg, 15 tucked at +172 deg along stern)
            GT.WS[ws].reference_angle_Y = (i == 15) and math.rad(172) or math.rad(180);
            GT.WS[ws].angles = {
                {math.rad(180), math.rad(-10), math.rad(-5), math.rad(85)}
            };
            GT.WS[ws].LN[1].depends_on_unit = trackers_port_aft;
        end
    end
    GT.WS[ws].LN[1].BR = { {connector_name = "POINT_GUN_" .. idx_str} };
end

--------------------------------------------------------------------------------------
-- 4. Light AA Battery: 2-pdr (40mm) "Pom-Pom" Mark VIII Octuple Mounts (3 Stations)
--------------------------------------------------------------------------------------

-- Pom-Pom 01 (Port Forward Catwalk Gallery, Args 71 & 72)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Octuple);
GT.WS[ws].center = "CENTER_POMPOM_01";
GT.WS[ws].area = "Glorious_Deck.Fore";
GT.WS[ws].drawArgument1 = 71;
GT.WS[ws].drawArgument2 = 72;
GT.WS[ws].reference_angle_Y = math.rad(45);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(-45), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Octuple.LN[1]);
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

-- Pom-Pom 02 (Island Aft Sponson, Args 73 & 74)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Octuple);
GT.WS[ws].center = "CENTER_POMPOM_02";
GT.WS[ws].area = "Glorious_Island.004";
GT.WS[ws].drawArgument1 = 73;
GT.WS[ws].drawArgument2 = 74;
GT.WS[ws].reference_angle_Y = math.rad(-135);
GT.WS[ws].angles = {
    {math.rad(-45), math.rad(-180), math.rad(-10), math.rad(80)},
    {math.rad(180), math.rad(135), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Octuple.LN[1]);
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

-- Pom-Pom 03 (Starboard Forward Sponson, Args 75 & 76)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Octuple);
GT.WS[ws].center = "CENTER_POMPOM_03";
GT.WS[ws].area = "Glorious_Deck.Fore";
GT.WS[ws].drawArgument1 = 75;
GT.WS[ws].drawArgument2 = 76;
GT.WS[ws].reference_angle_Y = math.rad(-45);
GT.WS[ws].angles = {
    {math.rad(45), math.rad(-170), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Octuple.LN[1]);
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

--------------------------------------------------------------------------------------
-- 5. Close-In AA: Vickers .50-cal (12.7mm) Mark III Quadruple Mount (Arg 77 & 78)
--------------------------------------------------------------------------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_50cal_Vickers_Quad);
GT.WS[ws].center = "CENTER_VICKERS_01";
GT.WS[ws].area = "Glorious_Deck.Rear";
GT.WS[ws].drawArgument1 = 77;
GT.WS[ws].drawArgument2 = 78;
GT.WS[ws].reference_angle_Y = math.rad(135);
GT.WS[ws].angles = {
    {math.rad(180), math.rad(30), math.rad(-10), math.rad(70)},
    {math.rad(-150), math.rad(-180), math.rad(-10), math.rad(70)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_50cal_Vickers_Quad.LN[1]);
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_VICKERS_01_1"},
    {connector_name = "POINT_VICKERS_01_2"},
    {connector_name = "POINT_VICKERS_01_3"},
    {connector_name = "POINT_VICKERS_01_4"},
};

-- ####################################################################################
-- Unit Identification & Shape Registration
-- ####################################################################################

GT.Name = "HMS_Glorious";
GT.DisplayName = _("HMS Glorious (77)");
GT.DisplayNameShort = _("HMS Glorious");
GT.Rate = 5000;

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
