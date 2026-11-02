
-- HMS Nelson (1941 Configuration)
-- Specs based on Nelson-class battleship data

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_ship);

GT.visual = {};
GT.visual.shape = "HMS_Nelson";
GT.visual.shape_dstr = "";

--####################################################################################
--###                         General Ship Parameters                              ###
--####################################################################################

GT.life                     = 4500;
GT.mass                     = 38000000; -- ~38,000 tons standard
GT.max_velocity             = 11.83;    -- 23 knots
GT.race_velocity            = 11.83;
GT.economy_velocity         = 7.2;      -- 14 knots
GT.economy_distance         = 13000000;
GT.race_distance            = 5000000;
GT.shipLength               = 216.4;
GT.Width                    = 32.3;
GT.Height                   = 35.0;     -- Estimated height to mast top
GT.Length                   = 216.4;
GT.DeckLevel                = 8.5;      -- Estimated freeboard
GT.X_nose                   = 106.08;
GT.X_tail                   = -108.61;
GT.Tail_Width               = 5.22;
GT.draft                    = 10.0;
GT.Gamma_max                = 0.35;
GT.Om                       = 0.05;
GT.speedup                  = 0.05;
GT.R_min                    = 600.0;
GT.distFindObstacles        = 1000.0;
GT.RCS                      = 50000;    -- Large radar cross section

GT.numParking               = 0;
GT.Plane_Num_               = 0;
GT.Helicopter_Num_          = 0;

GT.airWeaponDist            = 15000;
GT.airFindDist              = 30000;

GT.sensor = {
    max_range_finding_target = 40000,
    min_range_finding_target = 0,
    max_alt_finding_target   = 15000,
    min_alt_finding_target   = 0,
    pos                      = {-23.43, 27.67, 0.0}, 
};

GT.exhaust = {
    [1] = { size = 1.0, connector = "POINT_SMOKE_STACK_01" }, -- Main Funnel
};

--####################################################################################
--###                           Animation Arguments                                ###
--####################################################################################

GT.animation_arguments = {
    radar1_rotation = 11, -- Primary Type 281 Air Search Radar
    radar2_rotation = 12, -- Secondary Type 281 Air Search Radar
    --flag_animation  = 13,
    water_propeller = 8,
    rudder          = 9,
    nav_lights      = 20, -- 7 Navigation & Superstructure White Marker BANOs
};
GT.radar1_period = 5.0;
GT.radar2_period = 3.0;

--####################################################################################
--###                               Damage Model                                   ###
--####################################################################################

GT.DM = {
    -- Hull & Superstructure Core Sections (Essex-style Modular Convex Compartments)
    { area_name = "HULL_BOW",           area_arg = 100, area_life = 500,  armour = {width = 0.030}, area_fire = { pos = {92, 4, 0}, size = 1.0}},
    { area_name = "DECK_FORECASTLE",    area_arg = 95,  area_life = 500,  armour = {width = 0.050}, area_fire = { pos = {63, 5, 0}, size = 1.0}},
    { area_name = "CITADEL_PORT",       area_arg = 102, area_life = 900,  armour = {width = 0.356}, area_fire = { pos = {20, 5, 10}, size = 1.0}},
    { area_name = "CITADEL_STBD",       area_arg = 103, area_life = 900,  armour = {width = 0.356}, area_fire = { pos = {20, 5, -10}, size = 1.0}},
    { area_name = "MACHINERY_PORT",     area_arg = 93,  area_life = 700,  armour = {width = 0.356}, area_fire = { pos = {-30, 5, 10}, size = 1.0}},
    { area_name = "MACHINERY_STBD",     area_arg = 94,  area_life = 700,  armour = {width = 0.356}, area_fire = { pos = {-30, 5, -10}, size = 1.0}},
    { area_name = "HULL_AFT_PORT",      area_arg = 96,  area_life = 500,  armour = {width = 0.030}, area_fire = { pos = {-65, 5, 10}, size = 1.0}},
    { area_name = "HULL_AFT_STBD",      area_arg = 97,  area_life = 500,  armour = {width = 0.030}, area_fire = { pos = {-65, 5, -10}, size = 1.0}},
    { area_name = "HULL_STERN",         area_arg = 101, area_life = 500,  armour = {width = 0.030}, area_fire = { pos = {-95, 4, 0}, size = 1.0}},
    { area_name = "BRIDGE_LOWER",       area_arg = 104, area_life = 400,  armour = {width = 0.152}, area_fire = { pos = {-14, 13, 0}, size = 1.0}},
    { area_name = "BRIDGE_TOWER",       area_arg = 146, area_life = 350,  armour = {width = 0.100}, area_fire = { pos = {-21, 22, 0}, size = 1.0}},
    { area_name = "FUNNEL_TRUNK",       area_arg = 148, area_life = 250,  armour = {width = 0.015}, area_fire = { pos = {-35, 19, 0}, size = 1.2}},
    { area_name = "DECKHOUSE_AFT",      area_arg = 149, area_life = 300,  armour = {width = 0.020}, area_fire = { pos = {-70, 10, 0}, size = 1.0}},

    -- Main Battery 16-inch Barbettes (Armored Foundations)
    { area_name = "BARBETTE_MAIN_A",    area_arg = 105, area_life = 350,  armour = {width = 0.381}},
    { area_name = "BARBETTE_MAIN_B",    area_arg = 106, area_life = 350,  armour = {width = 0.381}},
    { area_name = "BARBETTE_MAIN_X",    area_arg = 107, area_life = 350,  armour = {width = 0.381}},

    -- Main Battery 16-inch Triple Turrets
    { area_name = "TURRET_A",           area_arg = 105, area_life = 300},
    { area_name = "TURRET_B",           area_arg = 106, area_life = 300},
    { area_name = "TURRET_X",           area_arg = 107, area_life = 300},

    -- Secondary Battery 6-inch Twin Turrets (Starboard S1-S3, Port P1-P3)
    { area_name = "SEC_S1",             area_arg = 108, area_life = 100},
    { area_name = "SEC_S2",             area_arg = 109, area_life = 100},
    { area_name = "SEC_S3",             area_arg = 110, area_life = 100},
    { area_name = "SEC_P1",             area_arg = 111, area_life = 100},
    { area_name = "SEC_P2",             area_arg = 112, area_life = 100},
    { area_name = "SEC_P3",             area_arg = 113, area_life = 100},

    -- Heavy AA Battery 4.7-inch Single Mounts (1 to 6)
    { area_name = "AA_47_1",            area_arg = 114, area_life = 50},
    { area_name = "AA_47_2",            area_arg = 115, area_life = 50},
    { area_name = "AA_47_3",            area_arg = 116, area_life = 50},
    { area_name = "AA_47_4",            area_arg = 117, area_life = 50},
    { area_name = "AA_47_5",            area_arg = 118, area_life = 50},
    { area_name = "AA_47_6",            area_arg = 119, area_life = 50},

    -- Light AA 2-pdr Pom-Pom Octuple Mounts (1 to 3)
    { area_name = "POMPOM_8_1",         area_arg = 120, area_life = 30},
    { area_name = "POMPOM_8_2",         area_arg = 121, area_life = 30},
    { area_name = "POMPOM_8_3",         area_arg = 122, area_life = 30},

    -- Light AA 2-pdr Pom-Pom Quadruple Mounts (1 to 2)
    { area_name = "POMPOM_4_1",         area_arg = 123, area_life = 25},
    { area_name = "POMPOM_4_2",         area_arg = 124, area_life = 25},

    -- Light AA Vickers .50cal Quadruple Mounts (1 to 2)
    { area_name = "VICKERS_1",          area_arg = 125, area_life = 20},
    { area_name = "VICKERS_2",          area_arg = 126, area_life = 20},

    -- Fire Control Directors
    { area_name = "DIRECTOR_MAIN_1",    area_arg = 127, area_life = 30},
    { area_name = "DIRECTOR_MAIN_2",    area_arg = 128, area_life = 30},
    { area_name = "DIRECTOR_MAIN_3",    area_arg = 129, area_life = 30},
    { area_name = "DIRECTOR_HACS_1",    area_arg = 142, area_life = 25},
    { area_name = "DIRECTOR_HACS_2",    area_arg = 143, area_life = 25},
    { area_name = "DIRECTOR_SEC_S",     area_arg = 144, area_life = 25},
    { area_name = "DIRECTOR_SEC_P",     area_arg = 145, area_life = 25},

    -- Fighting Searchlights (44-inch Projectors)
    { area_name = "SEARCHLIGHT_PORT",   area_arg = 164, area_life = 20, armour = {width = 0.008}},
    { area_name = "SEARCHLIGHT_STBD",   area_arg = 165, area_life = 20, armour = {width = 0.008}},
};

--####################################################################################
-- Note: Naval weapons & shells are centralized in Weapons/
-- When loaded through entry.lua, these are preloaded. For standalone loading / testing:
if not (GT_t and GT_t.WS_t and GT_t.WS_t.UK_16in_BL_MkI_Triple) then
    local wp_base = current_mod_path and (current_mod_path .. "/Weapons/") or "Weapons/"
    dofile(wp_base .. "WeaponConstants.lua")
    dofile(wp_base .. "shells.lua")
    dofile(wp_base .. "guns.lua")
    dofile(wp_base .. "directors.lua")
end

--####################################################################################
--###                                 Armament                                     ###
--####################################################################################

GT.WS = {};
GT.WS.maxTargetDetectionRange = 45000;
GT.WS.radar_type = 103;
GT.WS.searchRadarMaxElevation = math.rad(60);
GT.WS.searchRadarFrequencies = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}};

local ws;

--------------------------------------------------------------------------------------
-- 1. Fire Control Directors (Optical & Radar Rangefinders)
-- Mount templates defined in Database/Weapons/directors.lua
--------------------------------------------------------------------------------------

-- Main Battery Directors (DCT) - 3 units
-- 1: Tower Top Primary DCT (Arg 80)
-- 2: Aft Auxiliary DCT (Arg 82)
-- 3: Lower Bridge Conning Tower Director (Arg 84)
local ws_dct_main = {};
for i = 1, 2 do
    ws = GT_t.inc_ws();
    ws_dct_main[i] = ws;
    GT.WS[ws] = {};
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_DCT_Main_BL_16in);
    GT.WS[ws].center = 'CENTER_DIRECTOR_MAIN_' .. i;
    GT.WS[ws].area = 'DIRECTOR_MAIN_' .. i;
    GT.WS[ws].drawArgument1 = 80 + (i*2) - 2; -- 80, 82, 84 -- Azimuth
    GT.WS[ws].drawArgument2 = -1;            -- Azimuth-only tracking (no elevation pitch)
    GT.WS[ws].moveable = true;
    GT.WS[ws].pos = {0.0, 0.0, 0.0};

    if i == 2 then
        GT.WS[ws].reference_angle_Y = math.rad(180); -- Aft Auxiliary DCT stowed facing aft
        GT.WS[ws].angles = { {math.rad(180), math.rad(-180), math.rad(-10), math.rad(80)} };
    else
        GT.WS[ws].reference_angle_Y = math.rad(0);   -- Tower & Conning tower stowed facing bow
        GT.WS[ws].angles = { {math.rad(135), math.rad(-135), math.rad(-10), math.rad(80)} }; -- Forward & broadside tracking arc (+/-135 deg)
    end
end

-- HACS (High Angle Control System) for AA - 2 Units (Forward & Aft Island)
local ws_hacs = {};
for i = 1, 2 do
    ws = GT_t.inc_ws();
    ws_hacs[i] = ws;
    GT.WS[ws] = {};
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIII);
    GT.WS[ws].center = 'CENTER_DIRECTOR_HACS_' .. i;
    GT.WS[ws].area = 'DIRECTOR_HACS_' .. i;
    GT.WS[ws].drawArgument1 = 86 + (i*2) - 2; -- 86, 88
    GT.WS[ws].drawArgument2 = -1;            -- Azimuth-only tracking
    GT.WS[ws].moveable = true;
    GT.WS[ws].pos = {0.0, 0.0, 0.0};
    if i == 2 then
        GT.WS[ws].reference_angle_Y = math.rad(180); -- Aft HACS stowed facing aft
    else
        GT.WS[ws].reference_angle_Y = math.rad(0);   -- Forward HACS stowed facing bow
    end
    GT.WS[ws].angles = { {math.rad(180), math.rad(-180), math.rad(-10), math.rad(85)} };
end

-- Starboard Secondary Battery Director (Arg 90)
ws = GT_t.inc_ws();
local ws_dir_sec_s = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_DCT_Secondary_MkIV);
GT.WS[ws].center = 'CENTER_DIRECTOR_SEC_S';
GT.WS[ws].area = 'DIRECTOR_SEC_S';
GT.WS[ws].drawArgument1 = 90;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(-90); -- Starboard beam stowage
    -- Starboard broadside coverage: from forward (-30 deg bridge blind arc) around to aft (-170 deg)
    GT.WS[ws].angles = { {math.rad(-30), math.rad(-170), math.rad(-10), math.rad(85)} };

-- Port Secondary Battery Director (Arg 92)
ws = GT_t.inc_ws();
local ws_dir_sec_p = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_DCT_Secondary_MkIV);
GT.WS[ws].center = 'CENTER_DIRECTOR_SEC_P';
GT.WS[ws].area = 'DIRECTOR_SEC_P';
GT.WS[ws].drawArgument1 = 92;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(90); -- Port beam stowage
-- Port broadside coverage: from aft (+170 deg) around port to forward (+30 deg bridge blind arc)
GT.WS[ws].angles = { {math.rad(170), math.rad(30), math.rad(-10), math.rad(85)} };

--------------------------------------------------------------------------------------
-- 2. Fighting Searchlights: 44-inch (112cm) Projectors (4 Independent Stations)
--------------------------------------------------------------------------------------
-- Native DCS cLauncherSpotlight (type = 110) stations with dedicated light cones.
-- Configured with strict blind arcs to prevent illuminating ship superstructure.

-- Station 1: Port Forward Searchlight (Searchlight.006, Funnel Platform)
ws = GT_t.inc_ws();
local ws_searchlight_p_fwd = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = 'CENTER_SEARCHLIGHT_PORT_FWD';
GT.WS[ws].pointer = 'POINT_SIGHT_PORT_FWD';
GT.WS[ws].area = 'SEARCHLIGHT_PORT';
GT.WS[ws].drawArgument1 = 160; -- Port Fwd Azimuth
GT.WS[ws].drawArgument2 = 161; -- Port Fwd Elevation (-10 to +85 deg)
GT.WS[ws].reference_angle_Y = math.rad(90); -- Stowage: Facing Port abeam (+90 deg)
-- Blind arc: from +45 deg (clearing bridge tower) to +145 deg (funnel)
GT.WS[ws].angles = { {math.rad(145), math.rad(45), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = 'POINT_SPOTLIGHT_PORT_FWD';

-- Station 2: Port Aft Searchlight (Searchlight.001, Mainmast Shelter Deck)
ws = GT_t.inc_ws();
local ws_searchlight_p_aft = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = 'CENTER_SEARCHLIGHT_PORT_AFT';
GT.WS[ws].pointer = 'POINT_SIGHT_PORT_AFT';
GT.WS[ws].area = 'SEARCHLIGHT_PORT';
GT.WS[ws].drawArgument1 = 170; -- Port Aft Azimuth
GT.WS[ws].drawArgument2 = 171; -- Port Aft Elevation (-10 to +85 deg)
GT.WS[ws].reference_angle_Y = math.rad(90); -- Stowage: Facing Port abeam (+90 deg)
-- Blind arc: from +60 deg (clearing midship deckhouse and funnel) to +165 deg (stern)
GT.WS[ws].angles = { {math.rad(165), math.rad(60), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = 'POINT_SPOTLIGHT_PORT_AFT';

-- Station 3: Starboard Forward Searchlight (Searchlight.003, Funnel Platform)
ws = GT_t.inc_ws();
local ws_searchlight_s_fwd = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = 'CENTER_SEARCHLIGHT_STBD_FWD';
GT.WS[ws].pointer = 'POINT_SIGHT_STBD_FWD';
GT.WS[ws].area = 'SEARCHLIGHT_STBD';
GT.WS[ws].drawArgument1 = 162; -- Starboard Fwd Azimuth
GT.WS[ws].drawArgument2 = 163; -- Starboard Fwd Elevation (-10 to +85 deg)
GT.WS[ws].reference_angle_Y = math.rad(-90); -- Stowage: Facing Starboard abeam (-90 deg)
-- Blind arc: from -45 deg (clearing bridge tower) to -145 deg (funnel)
GT.WS[ws].angles = { {math.rad(-45), math.rad(-145), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = 'POINT_SPOTLIGHT_STBD_FWD';

-- Station 4: Starboard Aft Searchlight (Searchlight.002, Mainmast Shelter Deck)
ws = GT_t.inc_ws();
local ws_searchlight_s_aft = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = 'CENTER_SEARCHLIGHT_STBD_AFT';
GT.WS[ws].pointer = 'POINT_SIGHT_STBD_AFT';
GT.WS[ws].area = 'SEARCHLIGHT_STBD';
GT.WS[ws].drawArgument1 = 172; -- Starboard Aft Azimuth
GT.WS[ws].drawArgument2 = 173; -- Starboard Aft Elevation (-10 to +85 deg)
GT.WS[ws].reference_angle_Y = math.rad(-90); -- Stowage: Facing Starboard abeam (-90 deg)
-- Blind arc: from -60 deg (clearing midship deckhouse and funnel) to -165 deg (stern)
GT.WS[ws].angles = { {math.rad(-60), math.rad(-165), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = 'POINT_SPOTLIGHT_STBD_AFT';



-- Tracker link definitions for gun batteries:
-- Main Battery slaved to Tower DCT (Primary, Arg 80), fallback to autonomous
local main_battery_trackers = {
    {{"self", ws_dct_main[1]}}, -- ws 1: Tower Top Primary DCT (Arg 80, dist = 65.5m from Turret A)
    {{"none"}}, -- this provides "Fire at Point" support but also allows turrets to exceed their rotation angles  :(
};

-- Secondary Battery slaved to dedicated Port/Starboard directors, fallback to Main DCTs, fallback to autonomous
local sec_starboard_trackers = {
    {{"self", ws_dir_sec_s}},
    {{"self", ws_dct_main[1]}},
    {{"none"}},
};
local sec_port_trackers = {
    {{"self", ws_dir_sec_p}},
    {{"self", ws_dct_main[1]}},
    {{"none"}},
};

-- Heavy AA (4.7-inch) slaved to dual HACS directors, fallback to autonomous
local ha_starboard_trackers = {
    {{"self", ws_hacs[2]}}, -- HACS 2 (Aft / Stbd arc)
    {{"self", ws_hacs[1]}}, -- HACS 1 (Fwd)
    {{"none"}},
};
local ha_port_trackers = {
    {{"self", ws_hacs[1]}}, -- HACS 1 (Fwd / Port arc)
    {{"self", ws_hacs[2]}}, -- HACS 2 (Aft)
    {{"none"}},
};

--------------------------------------------------------------------------------------
-- 3. Main Battery: 16-inch (406mm) Mk I (3 x Triple Turrets)
--------------------------------------------------------------------------------------
-- Station template defined in Database/Weapons/guns.lua: GT_t.WS_t.UK_16in_BL_MkI_Triple

-- Turret A (Forward-most)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_16in_BL_MkI_Triple);
GT.WS[ws].center = 'CENTER_MAIN_A';
GT.WS[ws].area = 'TURRET_A';
GT.WS[ws].drawArgument1 = 1; -- Azimuth
GT.WS[ws].drawArgument2 = 2; -- Elevation
-- Forecastle clearance: +3 deg over bow to prevent deck blast damage
GT.WS[ws].angles = { 
    {math.rad(145), math.rad(30), math.rad(-3), math.rad(40)},
    {math.rad(30), math.rad(-30), math.rad(3), math.rad(40)},
    {math.rad(-30), math.rad(-145), math.rad(-3), math.rad(40)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_16in_BL_MkI_Triple.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = main_battery_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = 'POINT_MAIN_A_1', recoilArgument = 21, recoilTime = 0.8},
    {connector_name = 'POINT_MAIN_A_2', recoilArgument = 22, recoilTime = 0.8},
    {connector_name = 'POINT_MAIN_A_3', recoilArgument = 23, recoilTime = 0.8},
};

-- Turret B (Superfiring)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_16in_BL_MkI_Triple);
GT.WS[ws].center = 'CENTER_MAIN_B';
GT.WS[ws].area = 'TURRET_B';
GT.WS[ws].drawArgument1 = 3; -- Azimuth
GT.WS[ws].drawArgument2 = 4; -- Elevation
-- Superfiring clearance: Min 0 deg elevation firing forward over Turret A roof
GT.WS[ws].angles = { 
    {math.rad(145), math.rad(30), math.rad(-3), math.rad(40)},
    {math.rad(30), math.rad(-30), math.rad(0), math.rad(40)},
    {math.rad(-30), math.rad(-145), math.rad(-3), math.rad(40)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_16in_BL_MkI_Triple.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = main_battery_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = 'POINT_MAIN_B_1', recoilArgument = 24, recoilTime = 0.8},
    {connector_name = 'POINT_MAIN_B_2', recoilArgument = 25, recoilTime = 0.8},
    {connector_name = 'POINT_MAIN_B_3', recoilArgument = 26, recoilTime = 0.8},
};

-- Turret X (Deck Level, Broadside Only)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_16in_BL_MkI_Triple);
GT.WS[ws].center = 'CENTER_MAIN_X';
GT.WS[ws].area = 'TURRET_X';
GT.WS[ws].drawArgument1 = 5; -- Azimuth
GT.WS[ws].drawArgument2 = 6; -- Elevation
GT.WS[ws].reference_angle_Y = math.rad(0); -- Stowed facing forward
-- Broadside arcs: 30 to 115 deg on starboard side, -30 to -115 deg on port side
-- No forward firing arc (preventing barrel elevation lockout at rest)
GT.WS[ws].angles = { 
    {math.rad(135), math.rad(30), math.rad(-3), math.rad(40)},
    {math.rad(-30), math.rad(-135), math.rad(-3), math.rad(40)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_16in_BL_MkI_Triple.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = main_battery_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = 'POINT_MAIN_X_1', recoilArgument = 27, recoilTime = 0.8},
    {connector_name = 'POINT_MAIN_X_2', recoilArgument = 28, recoilTime = 0.8},
    {connector_name = 'POINT_MAIN_X_3', recoilArgument = 29, recoilTime = 0.8},
};

--------------------------------------------------------------------------------------
-- 4. Secondary Battery: 6-inch (152mm) Mk XXII (6 x Twin Turrets)
--------------------------------------------------------------------------------------
-- Station template defined in Database/Weapons/guns.lua: GT_t.WS_t.UK_6in_BL_MkXXII_Twin

-- Starboard Side Secondaries (S1, S2, S3)
-- True RN Mark XVIII training limits relative to ship:
-- S1: Forward Mount, stowed forward (0 deg), sweeps -15 deg to -140 deg Starboard
-- S2: Superfiring Center Mount, stowed forward (0 deg), sweeps 0 deg to -165 deg Starboard
-- S3: Aft Mount, stowed astern (-180 deg), sweeps -35 deg to -180 deg Stern
for i = 1, 3 do
    ws = GT_t.inc_ws();
    GT.WS[ws] = {};
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_6in_BL_MkXXII_Twin);
    GT.WS[ws].center = 'CENTER_SEC_S' .. i;
    GT.WS[ws].area = 'SEC_S' .. i;
    GT.WS[ws].drawArgument1 = 30 + (i*2) - 2; -- 30, 32, 34
    GT.WS[ws].drawArgument2 = 30 + (i*2) - 1; -- 31, 33, 35
    if i == 1 then
        GT.WS[ws].reference_angle_Y = math.rad(0);
        GT.WS[ws].angles = { {math.rad(5), math.rad(-140), math.rad(-5), math.rad(60)} };
    elseif i == 2 then
        GT.WS[ws].reference_angle_Y = math.rad(0);
        GT.WS[ws].angles = { {math.rad(5), math.rad(-165), math.rad(-5), math.rad(60)} };
    elseif i == 3 then
        GT.WS[ws].reference_angle_Y = math.rad(-180);
        GT.WS[ws].angles = { {math.rad(-35), math.rad(-180), math.rad(-5), math.rad(60)} };
    end
    GT.WS[ws].LN = { [1] = {} };
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_6in_BL_MkXXII_Twin.LN[1]);
    GT.WS[ws].LN[1].depends_on_unit = sec_starboard_trackers;
    GT.WS[ws].LN[1].BR = {
        {connector_name = 'POINT_SEC_S' .. i .. '_1', recoilArgument = 130 + (i*2) - 2, recoilTime = 0.3},
        {connector_name = 'POINT_SEC_S' .. i .. '_2', recoilArgument = 130 + (i*2) - 1, recoilTime = 0.3},
    };
end

-- Port Side Secondaries (P1, P2, P3)
-- True RN Mark XVIII training limits relative to ship:
-- P1: Forward Mount, stowed forward (0 deg), sweeps +140 deg to -5 deg across bow
-- P2: Superfiring Center Mount, stowed forward (0 deg), sweeps +165 deg to 0 deg Port
-- P3: Aft Mount, stowed astern (+180 deg), sweeps +180 deg Stern down to +35 deg Port
for i = 1, 3 do
    ws = GT_t.inc_ws();
    GT.WS[ws] = {};
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_6in_BL_MkXXII_Twin);
    GT.WS[ws].center = 'CENTER_SEC_P' .. i;
    GT.WS[ws].area = 'SEC_P' .. i;
    GT.WS[ws].drawArgument1 = 36 + (i*2) - 2; -- 36, 38, 40
    GT.WS[ws].drawArgument2 = 36 + (i*2) - 1; -- 37, 39, 41
    if i == 1 then
        GT.WS[ws].reference_angle_Y = math.rad(0);
        GT.WS[ws].angles = { {math.rad(140), math.rad(-5), math.rad(-5), math.rad(60)} };
    elseif i == 2 then
        GT.WS[ws].reference_angle_Y = math.rad(0);
        GT.WS[ws].angles = { {math.rad(165), math.rad(-5), math.rad(-5), math.rad(60)} };
    elseif i == 3 then
        GT.WS[ws].reference_angle_Y = math.rad(180);
        GT.WS[ws].angles = { {math.rad(180), math.rad(35), math.rad(-5), math.rad(60)} };
    end
    GT.WS[ws].LN = { [1] = {} };
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_6in_BL_MkXXII_Twin.LN[1]);
    GT.WS[ws].LN[1].depends_on_unit = sec_port_trackers;
    GT.WS[ws].LN[1].BR = {
        {connector_name = 'POINT_SEC_P' .. i .. '_1', recoilArgument = 136 + (i*2) - 2, recoilTime = 0.3},
        {connector_name = 'POINT_SEC_P' .. i .. '_2', recoilArgument = 136 + (i*2) - 1, recoilTime = 0.3},
    };
end

--------------------------------------------------------------------------------------
-- 5. Heavy AA: 4.7-inch (120mm) Mk VIII (6 x Single Mounts)
--------------------------------------------------------------------------------------
-- Station template defined in Database/Weapons/guns.lua: GT_t.WS_t.UK_120mm_QF_MkVIII_Single

-- Cruising Stowage & Physical Dead-Zone Firing Arcs
-- Matches authentic RN traverse sectors:
-- Mounts 1-3: Starboard Battery
-- Mounts 4-6: Port Battery
for i = 1, 6 do
    ws = GT_t.inc_ws();
    GT.WS[ws] = {};
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_120mm_QF_MkVIII_Single);
    GT.WS[ws].pidY = GT_t.AAA_PIDY;
    GT.WS[ws].pidZ = GT_t.AAA_PIDZ;
    GT.WS[ws].center = 'CENTER_AA_47_' .. i;
    GT.WS[ws].area = 'AA_47_' .. i;
    GT.WS[ws].drawArgument1 = 50 + (i*2) - 2; -- 50, 52, 54, 56, 58, 60
    GT.WS[ws].drawArgument2 = 50 + (i*2) - 1; -- 51, 53, 55, 57, 59, 61
    GT.WS[ws].LN = {};
    GT.WS[ws].LN[1] = {};
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_120mm_QF_MkVIII_Single.LN[1]);
    if i <= 3 then
        GT.WS[ws].LN[1].depends_on_unit = ha_starboard_trackers;
    else
        GT.WS[ws].LN[1].depends_on_unit = ha_port_trackers;
    end
    
    if i == 1 then
        -- Mount 1: Starboard Forecastle (Stowed forward 0 deg, sweeps +5 deg to -165 deg Starboard)
        GT.WS[ws].reference_angle_Y = math.rad(0);
        GT.WS[ws].angles = { {math.rad(5), math.rad(-165), math.rad(-5), math.rad(85)} };
    elseif i == 2 then
        -- Mount 2: Starboard Boat Deck (Stowed aft -180 deg, sweeps -15 deg to -180 deg Stern)
        GT.WS[ws].reference_angle_Y = math.rad(-180);
        GT.WS[ws].angles = { {math.rad(-15), math.rad(-180), math.rad(-5), math.rad(85)} };
    elseif i == 3 then
        -- Mount 3: Starboard Quarterdeck (Stowed aft -180 deg, sweeps -50 deg to -180 deg Stern)
        GT.WS[ws].reference_angle_Y = math.rad(-180);
        GT.WS[ws].angles = { {math.rad(-50), math.rad(-180), math.rad(-5), math.rad(85)} };
    elseif i == 4 then
        -- Mount 4: Port Quarterdeck (Stowed aft +180 deg, sweeps +180 deg Stern down to +50 deg Port)
        GT.WS[ws].reference_angle_Y = math.rad(180);
        GT.WS[ws].angles = { {math.rad(180), math.rad(50), math.rad(-5), math.rad(85)} };
    elseif i == 5 then
        -- Mount 5: Port Boat Deck (Stowed aft +180 deg, sweeps +180 deg Stern down to +15 deg Port)
        GT.WS[ws].reference_angle_Y = math.rad(180);
        GT.WS[ws].angles = { {math.rad(180), math.rad(15), math.rad(-5), math.rad(85)} };
    elseif i == 6 then
        -- Mount 6: Port Forecastle (Stowed forward 0 deg, sweeps +165 deg Port down to -5 deg Bow)
        GT.WS[ws].reference_angle_Y = math.rad(0);
        GT.WS[ws].angles = { {math.rad(165), math.rad(-5), math.rad(-5), math.rad(85)} };
    end
    GT.WS[ws].LN[1].BR = { {connector_name = 'POINT_AA_47_' .. i, recoilArgument = 150 + i, recoilTime = 0.2} };
end

--------------------------------------------------------------------------------------
-- 6. Light AA: 2-pdr "Pom-Pom" (3 x Octuple Mounts)
--------------------------------------------------------------------------------------
-- Station template defined in Database/Weapons/guns.lua: GT_t.WS_t.UK_40mm_PomPom_Octuple

for i = 1, 3 do
    ws = GT_t.inc_ws();
    GT.WS[ws] = {};
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Octuple);
    GT.WS[ws].pidY = GT_t.AAA_PIDY;
    GT.WS[ws].pidZ = GT_t.AAA_PIDZ;
    GT.WS[ws].center = 'CENTER_POMPOM_8_' .. i;
    GT.WS[ws].area = 'POMPOM_8_' .. i;
    GT.WS[ws].drawArgument1 = 62 + (i*2) - 2; -- 62, 64, 66
    GT.WS[ws].drawArgument2 = 62 + (i*2) - 1; -- 63, 65, 67
    if i == 1 then
        -- Starboard Funnel Mount: stowed broadside (-90 deg), sweeps -15 deg to -165 deg Starboard
        GT.WS[ws].reference_angle_Y = math.rad(-90);
        GT.WS[ws].angles = { {math.rad(-15), math.rad(-165), math.rad(-5), math.rad(85)} };
    elseif i == 2 then
        -- Port Funnel Mount: stowed broadside (+90 deg), sweeps +165 deg down to +15 deg Port
        GT.WS[ws].reference_angle_Y = math.rad(90);
        GT.WS[ws].angles = { {math.rad(165), math.rad(15), math.rad(-5), math.rad(85)} };
    else
        -- Stern Bandstand Mount: stowed aft (180 deg), sweeps aft hemisphere (+180 to +45 Port, and -45 to -180 Stbd)
        GT.WS[ws].reference_angle_Y = math.rad(180);
        GT.WS[ws].angles = { 
            {math.rad(180), math.rad(45), math.rad(-5), math.rad(85)} ,
            {math.rad(-45), math.rad(-180), math.rad(-5), math.rad(85)}
        };
    end
    GT.WS[ws].LN = {};
    GT.WS[ws].LN[1] = {};
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Octuple.LN[1]);
    GT.WS[ws].LN[1].BR = {};
    for j=1,8 do
        GT.WS[ws].LN[1].BR[j] = {connector_name = 'POINT_POM_8_' .. i .. '_' .. j};
    end
end

--------------------------------------------------------------------------------------
-- 7. Light AA: 2-pdr "Pom-Pom" (2 x Quadruple Mounts)
--------------------------------------------------------------------------------------
-- Station template defined in Database/Weapons/guns.lua: GT_t.WS_t.UK_40mm_PomPom_Quad

for i = 1, 2 do
    ws = GT_t.inc_ws();
    GT.WS[ws] = {};
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Quad);
    GT.WS[ws].pidY = GT_t.AAA_PIDY;
    GT.WS[ws].pidZ = GT_t.AAA_PIDZ;
    GT.WS[ws].center = 'CENTER_POMPOM_4_' .. i;
    GT.WS[ws].area = 'POMPOM_4_' .. i;
    GT.WS[ws].drawArgument1 = 68 + (i*2) - 2; -- 68, 70
    GT.WS[ws].drawArgument2 = 68 + (i*2) - 1; -- 69, 71
    if i == 1 then
        -- Mount 1: Starboard Aft Quarterdeck: stowed aft (-180 deg), sweeps -15 deg to -180 deg Stern
        GT.WS[ws].reference_angle_Y = math.rad(-180);
        GT.WS[ws].reference_angle_Z = math.rad(20);
        GT.WS[ws].angles = { {math.rad(-15), math.rad(-180), math.rad(-5), math.rad(85)} };
    else
        -- Mount 2: Port Aft Quarterdeck: stowed aft (+180 deg), sweeps +180 deg Stern down to +15 deg Port
        GT.WS[ws].reference_angle_Y = math.rad(180);
        GT.WS[ws].reference_angle_Z = math.rad(20);
        GT.WS[ws].angles = { {math.rad(180), math.rad(15), math.rad(-5), math.rad(85)} };
    end
    GT.WS[ws].LN = {};
    GT.WS[ws].LN[1] = {};
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Quad.LN[1]);
    GT.WS[ws].LN[1].BR = {};
    for j=1,4 do
        GT.WS[ws].LN[1].BR[j] = {connector_name = 'POINT_POM_4_' .. i .. '_' .. j};
    end
end

--------------------------------------------------------------------------------------
-- 8. Light AA: Vickers .5-inch Mk III (2 x Quadruple Mounts)
--------------------------------------------------------------------------------------
-- Station template defined in Database/Weapons/guns.lua: GT_t.WS_t.UK_50cal_Vickers_Quad

for i = 1, 2 do
    ws = GT_t.inc_ws();
    GT.WS[ws] = {};
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_50cal_Vickers_Quad);
    GT.WS[ws].pidY = GT_t.AAA_PIDY;
    GT.WS[ws].pidZ = GT_t.AAA_PIDZ;
    GT.WS[ws].center = 'CENTER_VICKERS_' .. i;
    GT.WS[ws].area = 'VICKERS_' .. i;
    GT.WS[ws].drawArgument1 = 73 + (i*2) - 2; -- 73, 75
    GT.WS[ws].drawArgument2 = 73 + (i*2) - 1; -- 74, 76
    if i == 1 then
        GT.WS[ws].reference_angle_Y = math.rad(-45); -- Starboard Bridge Wing rest
        GT.WS[ws].angles = { {math.rad(30), math.rad(-160), math.rad(-10), math.rad(80)} };
    else
        GT.WS[ws].reference_angle_Y = math.rad(45);  -- Port Bridge Wing rest
        GT.WS[ws].angles = { {math.rad(160), math.rad(-30), math.rad(-10), math.rad(80)} };
    end
    GT.WS[ws].LN = {};
    GT.WS[ws].LN[1] = {};
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_50cal_Vickers_Quad.LN[1]);
    GT.WS[ws].LN[1].BR = {};
    for j=1,4 do
        GT.WS[ws].LN[1].BR[j] = {connector_name = 'POINT_VICKERS_' .. i .. '_' .. j};
    end
end

--####################################################################################
--###                             Final Attributes                                 ###
--####################################################################################

GT.Name = "HMS_Nelson";
GT.DisplayName = _("HMS Nelson (28)");
GT.DisplayNameShort = _("HMS Nelson")
GT.Rate = 38000;
GT.livery_entry = "HMS_Nelson";

GT.Sensors = {
    OPTIC = {"long-range naval optics", "long-range air defence optics"},
    RADAR = {"carrier search radar"}, -- Placeholder for Type 281/284
};

GT.DetectionRange = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton = "yes";
GT.mapclasskey = "P0091000066"; -- This is CC, but should be BB for Battleship, but not in MissionEditor\data\NewMap\images
GT.attribute = {wsType_Navy, wsType_Ship, wsType_ArmedShip, WSTYPE_PLACEHOLDER,
    "Battleships",
    "Armed Air Defence",
    "RADAR_BAND1_FOR_ARM",
    "RADAR_BAND2_FOR_ARM",
};

GT.Categories = {
    {name = "Armed Ship"},
};

GT.tags = {
    "Battleship",
    "Air Defence",
};

GT.Countries = {"UK"};

GT.shape_table_data = 
{
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
        -- Main Battery 16-inch Triple Turrets (Posed tracking outward & elevated)
        [1] = -0.15, [2] = 0.20, -- Turret A trained 27 deg Starboard, elevated 8 deg
        [3] =  0.00, [4] = 0.35, -- Turret B trained forward, elevated 14 deg
        [5] =  0.25, [6] = 0.15, -- Turret X trained 45 deg Port, elevated 6 deg

        -- Secondary Battery 6-inch Twin Turrets (Broadside combat broadspread)
        [30] = -0.20, [31] = 0.15, -- S1 trained starboard, elevated
        [32] = -0.35, [33] = 0.15, -- S2 trained starboard, elevated
        [34] = -0.50, [35] = 0.15, -- S3 trained starboard, elevated
        [36] =  0.20, [37] = 0.15, -- P1 trained port, elevated
        [38] =  0.35, [39] = 0.15, -- P2 trained port, elevated
        [40] =  0.50, [41] = 0.15, -- P3 trained port, elevated

        -- Type 281 Air Search Radars & Fire Control Directors
        [11] =  0.25, -- Foretop Radar 1
        [12] =  0.75, -- Mainmast Radar 2
        [80] = -0.10, -- Tower Top Main DCT
        [86] = -0.15, -- Forward HACS Director
        [88] =  0.15, -- Aft HACS Director
        [90] = -0.25, -- Starboard Secondary DCT
        [92] =  0.25, -- Port Secondary DCT
    }
};

return GT

