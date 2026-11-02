-- ============================================================================
-- HMS Dido (37) - Dido-Class Light Anti-Aircraft Cruiser
-- Royal Navy Configuration (1940-1941)
--
-- HISTORICAL & TECHNICAL SPECIFICATIONS:
--   Displacement: 5,600 tons standard / 7,200 tons full load
--   Length: 156.4 m (512 ft) overall, 154.3 m waterline
--   Beam: 15.4 m (50.5 ft)
--   Draft: 5.2 m (17.0 ft) mean
--   Powerplant: 4 Admiralty 3-drum boilers, 4 Parsons geared turbines (62,000 shp)
--   Propulsion: 4 shafts (outward counter-rotating screws)
--   Speed: 32.25 knots (16.6 m/s)
--   Armament:
--     - 5 x Twin 5.25-inch (133mm) QF Mk I HA/LA Dual-Purpose (Turrets A, B, Q, X, Y)
--     - 2 x Quadruple 2-pdr (40mm) "Pom-Pom" Mk VIII AA Mounts
--     - 5 x Single 20mm Oerlikon AA Guns
--     - 2 x Triple 21-inch (533mm) Torpedo Tubes (Port & Starboard)
--   Fire Control:
--     - 1 x Bridge Optical Rangefinder / DCT (Arg 80)
--     - 2 x High Angle Control System (HACS Mk IV) with Type 285 Radar (Args 81 & 82)
--     - 1 x Auxiliary / Pom-Pom Director (Arg 83)
--     - 4 x 44-inch Fighting Searchlights (Args 160-163)
--     - 2 x Type 281 Long-Range Air Warning Radars (Foremast Arg 11, Mainmast Arg 12)
-- ============================================================================

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_ship);

GT.visual = {};
GT.visual.shape = "HMS_Dido.lods";
GT.visual.shape_dstr = "";

-- ####################################################################################
-- ###                         General Ship Parameters                              ###
-- ####################################################################################

GT.life                     = 4200;
GT.mass                     = 7200000;  -- 7,200 metric tons full load
GT.max_velocity             = 16.6;     -- 32.25 knots
GT.race_velocity            = 16.6;
GT.economy_velocity         = 8.23;     -- 16 knots
GT.economy_distance         = 7800000;  -- 4,240 nmi
GT.race_distance            = 2800000;  -- 1,500 nmi
GT.shipLength               = 156.4;
GT.Width                    = 15.4;
GT.Height                   = 34.0;     -- Keel to mast truck
GT.Length                   = 156.4;
GT.DeckLevel                = 5.2;      -- Estimated freeboard
GT.X_nose                   = 76.24;
GT.X_tail                   = -78.06;
GT.Tail_Width               = 2.24;
GT.draft                    = 5.2;
GT.Gamma_max                = 0.35;
GT.Om                       = 0.06;
GT.speedup                  = 0.06;
GT.R_min                    = 450.0;
GT.distFindObstacles        = 700.0;
GT.RCS                      = 18000;

GT.numParking               = 0;
GT.Plane_Num_               = 0;
GT.Helicopter_Num_          = 0;

GT.airWeaponDist            = 18000;
GT.airFindDist              = 35000;

GT.sensor = {
    max_range_finding_target = 35000,
    min_range_finding_target = 0,
    max_alt_finding_target   = 15000,
    min_alt_finding_target   = 0,
    pos                      = {15.82, 20.41, 0.0},
};

GT.exhaust = {
    [1] = { size = 0.85, connector = "POINT_SMOKE_STACK_01" }, -- Forward Funnel
    [2] = { size = 0.85, connector = "POINT_SMOKE_STACK_02" }, -- Aft Funnel
};

-- ####################################################################################
-- ###                           Animation Arguments                                ###
-- ####################################################################################

GT.animation_arguments = {
    radar1_rotation = 11, -- Primary Type 281 Air Warning Radar (Foremast)
    radar2_rotation = 12, -- Secondary Type 281 Air Warning Radar (Mainmast)
    water_propeller = 8,  -- Quad screws (outward counter-rotating)
    rudder          = 9,  -- Balanced rudder (+/-35 deg)
    nav_lights      = 20, -- Navigation lights & BANO point sprites
};
GT.radar1_period = 5.0;
GT.radar2_period = 5.0;

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
    "Air Defence",
};
GT.Countries = {"UK"};

GT.Sensors = {
    OPTIC = {"long-range naval optics"},
};

-- ####################################################################################
-- ###                               Damage Model                                   ###
-- ####################################################################################

GT.DM = {
    { area_name = "COLLISION_SHELL_BOW",                area_arg = 100, area_life = 800,  armour = {width = 0.025}, area_fire = { pos = {55, 3, 0}, size = 1.0} },
    { area_name = "COLLISION_SHELL_MIDSHIPS",            area_arg = 102, area_life = 1400, armour = {width = 0.076}, area_fire = { pos = {0, 4, 0}, size = 1.5} },
    { area_name = "COLLISION_SHELL_AFT",                 area_arg = 101, area_life = 800,  armour = {width = 0.025}, area_fire = { pos = {-55, 3, 0}, size = 1.0} },
    { area_name = "COLLISION_SHELL_SUPERSTRUCTURE_01",    area_arg = 104, area_life = 200,  armour = {width = 0.015}, area_fire = { pos = {12, 10, 0}, size = 1.2} },
    { area_name = "COLLISION_SHELL_SUPERSTRUCTURE_02",    area_arg = 104, area_life = 200,  armour = {width = 0.015} },
    { area_name = "COLLISION_SHELL_SUPERSTRUCTURE_03",    area_arg = 104, area_life = 300,  armour = {width = 0.015} },
    { area_name = "COLLISION_SHELL_SUPERSTRUCTURE_04",    area_arg = 104, area_life = 200,  armour = {width = 0.015} },
    { area_name = "COLLISION_SHELL_TURRET_A",            area_arg = 105, area_life = 250,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_TURRET_B",            area_arg = 106, area_life = 250,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_TURRET_Q",            area_arg = 107, area_life = 250,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_TURRET_X",            area_arg = 108, area_life = 250,  armour = {width = 0.025} },
    { area_name = "COLLISION_SHELL_TURRET_Y",            area_arg = 109, area_life = 250,  armour = {width = 0.025} },
};

-- ####################################################################################
-- Standalone weapon fallback loading
if not (GT_t and GT_t.WS_t and GT_t.WS_t.UK_133mm_QF_MkI_Twin) then
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
-- 1. Fire Control Directors (DCT Mk V, HACS Mk IV & Optical Rangefinders)
--------------------------------------------------------------------------------------

-- Station 1: Main Battery Director Control Tower (DCT Mk V - Arg 83)
-- Primary surface and low-angle fire control director for the 5.25-inch dual-purpose battery.
-- Fitted with Admiralty Fire Control Table (AFCT) and Type 285 metric radar.
ws = GT_t.inc_ws();
local ws_dct = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_DCT_Secondary_MkIV);
GT.WS[ws].center = "CENTER_DIRECTOR_AUX";
GT.WS[ws].pointer = "POINT_SIGHT_DIRECTOR_AUX";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE_02";
GT.WS[ws].drawArgument1 = 83;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_DCT_Secondary_MkIV.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_AUX"} };

-- Station 2: Forward High Angle Control System (HACS Mk IV - Arg 81)
-- Dedicated high-angle anti-aircraft director atop the fore superstructure tower.
-- Fitted with Type 285 ranging radar fishbone Yagi antennas.
ws = GT_t.inc_ws();
local ws_hacs_fwd = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIV);
GT.WS[ws].center = "CENTER_DIRECTOR_HACS_FWD";
GT.WS[ws].pointer = "POINT_SIGHT_DIRECTOR_HACS_FWD";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE_02";
GT.WS[ws].drawArgument1 = 81;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(160), math.rad(-160), math.rad(-10), math.rad(85)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_HACS_MkIV.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_HACS_FWD"} };

-- Station 3: Aft High Angle Control System (HACS Mk IV - Arg 82)
-- High-angle anti-aircraft director atop the after deckhouse.
-- Provides rear hemisphere air defence and surface tracking for after mounts.
ws = GT_t.inc_ws();
local ws_hacs_aft = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Director_HACS_MkIV);
GT.WS[ws].center = "CENTER_DIRECTOR_HACS_AFT";
GT.WS[ws].pointer = "POINT_SIGHT_DIRECTOR_HACS_AFT";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE_04";
GT.WS[ws].drawArgument1 = 82;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(180); -- Stowed facing aft
GT.WS[ws].angles = {
    {math.rad(180), math.rad(-180), math.rad(-10), math.rad(85)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Director_HACS_MkIV.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_HACS_AFT"} };

-- Station 4: Bridge Optical Rangefinder & Torpedo Sight (Arg 80)
-- Open pedestal 11-ft coincidence optical rangefinder on navigating bridge front.
-- Provides surface optical tracking for torpedo mounts and backup for main battery.
ws = GT_t.inc_ws();
local ws_dir_bridge = ws;
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_DCT_Destroyer_Optic);
GT.WS[ws].center = "CENTER_DIRECTOR_BRIDGE";
GT.WS[ws].pointer = "POINT_SIGHT_DIRECTOR_BRIDGE";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE_02";
GT.WS[ws].drawArgument1 = 80;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].moveable = true;
GT.WS[ws].pos = {0.0, 0.0, 0.0};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_DCT_Destroyer_Optic.LN[1]);
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_BRIDGE"} };

-- Director slaving failover tracker chains:
-- Forward Main Battery (Turrets A, B, Q):
-- Surface/General: DCT Mk V -> Heavy AA: HACS Fwd -> HACS Aft -> Bridge Optic -> Local
local fwd_trackers = {
    {{"self", ws_dct}},
    {{"self", ws_hacs_fwd}},
    {{"self", ws_hacs_aft}},
    {{"self", ws_dir_bridge}},
    {{"none"}}
};

-- Aft Main Battery (Turrets X, Y):
-- Heavy AA: HACS Aft -> Surface: DCT Mk V -> HACS Fwd -> Local
local aft_trackers = {
    {{"self", ws_hacs_aft}},
    {{"self", ws_dct}},
    {{"self", ws_hacs_fwd}},
    {{"none"}}
};

-- Quad Pom-Poms (Close-Range AA):
-- Autonomous on-mount tachymetric sights with HACS designation failover
local pompom_trackers = {
    {{"self", ws_hacs_fwd}},
    {{"self", ws_hacs_aft}},
    {{"none"}}
};

-- Torpedo Battery (21-inch Triple Mounts):
-- Slaved to Bridge Optical Rangefinder / Torpedo Sight with DCT failover
local torp_trackers = {
    {{"self", ws_dir_bridge}},
    {{"self", ws_dct}},
    {{"none"}}
};

--------------------------------------------------------------------------------------
-- 2. Fighting Searchlights: 44-inch (112 cm) Projectors (Args 160-163)
--------------------------------------------------------------------------------------

-- Searchlight 1: Starboard Forward (Arg 160)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_01";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_01";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE_03";
GT.WS[ws].drawArgument1 = 160;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = { {math.rad(-30), math.rad(-150), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_01";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_01"} };

-- Searchlight 2: Port Forward (Arg 161)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_02";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_02";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE_03";
GT.WS[ws].drawArgument1 = 161;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = { {math.rad(150), math.rad(30), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_02";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_02"} };

-- Searchlight 3: Port Aft (Arg 162)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_03";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_03";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE_03";
GT.WS[ws].drawArgument1 = 162;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = { {math.rad(160), math.rad(45), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_03";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_03"} };

-- Searchlight 4: Starboard Aft (Arg 163)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in);
GT.WS[ws].center = "CENTER_SEARCHLIGHT_04";
GT.WS[ws].pointer = "POINT_SIGHT_SEARCHLIGHT_04";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE_03";
GT.WS[ws].drawArgument1 = 163;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = { {math.rad(-45), math.rad(-160), math.rad(-10), math.rad(85)} };
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1]);
GT.WS[ws].LN[1].spotlightConnectorName = "POINT_SIGHT_SEARCHLIGHT_04";
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT_04"} };

--------------------------------------------------------------------------------------
-- 3. Main Battery: 5.25-inch (133mm) QF Mk I Dual-Purpose (5 x Twin Turrets)
--------------------------------------------------------------------------------------

-- Turret A (Forecastle Lower, Args 1 & 2)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_133mm_QF_MkI_Twin);
GT.WS[ws].center = "CENTER_GUN_A";
GT.WS[ws].area = "COLLISION_SHELL_TURRET_A";
GT.WS[ws].drawArgument1 = 1;
GT.WS[ws].drawArgument2 = 2;
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-150), math.rad(-5), math.rad(70)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_133mm_QF_MkI_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = fwd_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_01_1"},
    {connector_name = "POINT_GUN_01_2"},
};

-- Turret B (Forecastle Superfiring, Args 3 & 4)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_133mm_QF_MkI_Twin);
GT.WS[ws].center = "CENTER_GUN_B";
GT.WS[ws].area = "COLLISION_SHELL_TURRET_B";
GT.WS[ws].drawArgument1 = 3;
GT.WS[ws].drawArgument2 = 4;
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(30), math.rad(-5), math.rad(70)},
    {math.rad(30), math.rad(-30), math.rad(0), math.rad(70)},
    {math.rad(-30), math.rad(-150), math.rad(-5), math.rad(70)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_133mm_QF_MkI_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = fwd_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_02_1"},
    {connector_name = "POINT_GUN_02_2"},
};

-- Turret Q (Forward Deckhouse Superfiring, Args 5 & 6)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_133mm_QF_MkI_Twin);
GT.WS[ws].center = "CENTER_GUN_Q";
GT.WS[ws].area = "COLLISION_SHELL_TURRET_Q";
GT.WS[ws].drawArgument1 = 5;
GT.WS[ws].drawArgument2 = 6;
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
    {math.rad(140), math.rad(30), math.rad(-5), math.rad(70)},
    {math.rad(30), math.rad(-30), math.rad(0), math.rad(70)},
    {math.rad(-30), math.rad(-140), math.rad(-5), math.rad(70)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_133mm_QF_MkI_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = fwd_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_03_1"},
    {connector_name = "POINT_GUN_03_2"},
};

-- Turret X (Aft Deckhouse Superfiring, Args 7 & 10)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_133mm_QF_MkI_Twin);
GT.WS[ws].center = "CENTER_GUN_X";
GT.WS[ws].area = "COLLISION_SHELL_TURRET_X";
GT.WS[ws].drawArgument1 = 7;
GT.WS[ws].drawArgument2 = 10;
GT.WS[ws].reference_angle_Y = math.rad(180); -- Stowed facing aft
GT.WS[ws].angles = {
    {math.rad(180), math.rad(35), math.rad(-5), math.rad(70)},
    {math.rad(-35), math.rad(-180), math.rad(-5), math.rad(70)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_133mm_QF_MkI_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = aft_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_04_1"},
    {connector_name = "POINT_GUN_04_2"},
};

-- Turret Y (Quarterdeck Lower, Args 15 & 16)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_133mm_QF_MkI_Twin);
GT.WS[ws].center = "CENTER_GUN_Y";
GT.WS[ws].area = "COLLISION_SHELL_TURRET_Y";
GT.WS[ws].drawArgument1 = 15;
GT.WS[ws].drawArgument2 = 16;
GT.WS[ws].reference_angle_Y = math.rad(180); -- Stowed facing aft
GT.WS[ws].angles = {
    {math.rad(180), math.rad(30), math.rad(-5), math.rad(70)},
    {math.rad(-30), math.rad(-180), math.rad(-5), math.rad(70)},
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_133mm_QF_MkI_Twin.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = aft_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_05_1"},
    {connector_name = "POINT_GUN_05_2"},
};

--------------------------------------------------------------------------------------
-- 4. Light AA: 2-pdr (40mm) "Pom-Pom" Mk VIII (2 x Quad Mounts, Args 25-28)
--------------------------------------------------------------------------------------

-- Pom-Pom Starboard (Args 25 & 26)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Quad);
GT.WS[ws].center = "CENTER_POMPOM_01";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE_03";
GT.WS[ws].drawArgument1 = 25;
GT.WS[ws].drawArgument2 = 26;
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].angles = {
    {math.rad(-10), math.rad(-170), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Quad.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = pompom_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_POMPOM_01_1"},
    {connector_name = "POINT_GUN_POMPOM_01_2"},
    {connector_name = "POINT_GUN_POMPOM_01_3"},
    {connector_name = "POINT_GUN_POMPOM_01_4"},
};

-- Pom-Pom Port (Args 27 & 28)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_40mm_PomPom_Quad);
GT.WS[ws].center = "CENTER_POMPOM_02";
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE_03";
GT.WS[ws].drawArgument1 = 27;
GT.WS[ws].drawArgument2 = 28;
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].angles = {
    {math.rad(170), math.rad(10), math.rad(-10), math.rad(80)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_40mm_PomPom_Quad.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = pompom_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_POMPOM_02_1"},
    {connector_name = "POINT_GUN_POMPOM_02_2"},
    {connector_name = "POINT_GUN_POMPOM_02_3"},
    {connector_name = "POINT_GUN_POMPOM_02_4"},
};

--------------------------------------------------------------------------------------
-- 5. Close-in AA: 20mm Oerlikon Single Mounts (5 Units, Args 31-40)
--------------------------------------------------------------------------------------

local oerlikon_data = {
    { center = "CENTER_OERLIKON_01", az_arg = 31, el_arg = 32, ref_y = math.rad(-90), conn = "POINT_GUN_OERLIKON_01", area = "COLLISION_SHELL_SUPERSTRUCTURE_01", angles = { {math.rad(-10), math.rad(-170), math.rad(-10), math.rad(70)} } },
    { center = "CENTER_OERLIKON_02", az_arg = 33, el_arg = 34, ref_y = math.rad(90),  conn = "POINT_GUN_OERLIKON_02", area = "COLLISION_SHELL_SUPERSTRUCTURE_01", angles = { {math.rad(170), math.rad(10), math.rad(-10), math.rad(70)} } },
    { center = "CENTER_OERLIKON_03", az_arg = 35, el_arg = 36, ref_y = math.rad(90),  conn = "POINT_GUN_OERLIKON_03", area = "COLLISION_SHELL_SUPERSTRUCTURE_03", angles = { {math.rad(160), math.rad(20), math.rad(-10), math.rad(70)} } },
    { center = "CENTER_OERLIKON_04", az_arg = 37, el_arg = 38, ref_y = math.rad(-90), conn = "POINT_GUN_OERLIKON_04", area = "COLLISION_SHELL_SUPERSTRUCTURE_03", angles = { {math.rad(-20), math.rad(-160), math.rad(-10), math.rad(70)} } },
    { center = "CENTER_OERLIKON_05", az_arg = 39, el_arg = 40, ref_y = math.rad(180), conn = "POINT_GUN_OERLIKON_05", area = "COLLISION_SHELL_AFT",                 angles = { {math.rad(180), math.rad(30), math.rad(-10), math.rad(70)}, {math.rad(-30), math.rad(-180), math.rad(-10), math.rad(70)} } },
};

for i, oer in ipairs(oerlikon_data) do
    ws = GT_t.inc_ws();
    GT.WS[ws] = {};
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_20mm_Oerlikon_Single);
    GT.WS[ws].center = oer.center;
    GT.WS[ws].area = oer.area;
    GT.WS[ws].drawArgument1 = oer.az_arg;
    GT.WS[ws].drawArgument2 = oer.el_arg;
    GT.WS[ws].reference_angle_Y = oer.ref_y;
    GT.WS[ws].angles = oer.angles;
    GT.WS[ws].LN = { [1] = {} };
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_20mm_Oerlikon_Single.LN[1]);
    GT.WS[ws].LN[1].BR = { {connector_name = oer.conn} };
end

--------------------------------------------------------------------------------------
-- 6. Torpedo Battery: 21-inch Triple Mounts (2 Mounts, Args 13 & 14)
--------------------------------------------------------------------------------------

-- Torpedo Mount Starboard (Arg 13)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_21in_Triple_Torpedo);
GT.WS[ws].center = "CENTER_TORP_01";
GT.WS[ws].area = "COLLISION_SHELL_MIDSHIPS";
GT.WS[ws].drawArgument1 = 13;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(-180);
GT.WS[ws].angles = {
    {math.rad(-30), math.rad(-150), math.rad(-5), math.rad(25)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_21in_Triple_Torpedo.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = torp_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_TORP_01_1"},
    {connector_name = "POINT_TORP_01_2"},
    {connector_name = "POINT_TORP_01_3"},
};

-- Torpedo Mount Port (Arg 14)
ws = GT_t.inc_ws();
GT.WS[ws] = {};
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_21in_Triple_Torpedo);
GT.WS[ws].center = "CENTER_TORP_02";
GT.WS[ws].area = "COLLISION_SHELL_MIDSHIPS";
GT.WS[ws].drawArgument1 = 14;
GT.WS[ws].drawArgument2 = -1;
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles = {
    {math.rad(150), math.rad(30), math.rad(-5), math.rad(25)}
};
GT.WS[ws].LN = { [1] = {} };
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_21in_Triple_Torpedo.LN[1]);
GT.WS[ws].LN[1].depends_on_unit = torp_trackers;
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_TORP_02_1"},
    {connector_name = "POINT_TORP_02_2"},
    {connector_name = "POINT_TORP_02_3"},
};

-- ####################################################################################
-- ###                  Encyclopedia 3D Viewer Posed Combat Display                 ###
-- ####################################################################################

GT.encyclopediaAnimation = {
    args = {
        -- Main Battery 5.25-inch Twin Turrets trained outward & elevated
        [1] = -0.15, [2] = 0.20,
        [3] = -0.15, [4] = 0.20,
        [5] = -0.15, [6] = 0.20,
        [7] =  0.15, [10] = 0.20,
        [15] = 0.15, [16] = 0.20,
        -- Torpedo Mounts trained slightly outboard
        [13] = -0.25,
        [14] =  0.25,
        -- Quad Pom-Poms trained outboard & elevated
        [25] = -0.50, [26] = 0.25,
        [27] =  0.50, [28] = 0.25,
        -- Fire Control Directors
        [80] = -0.15, -- Bridge Optical Rangefinder
        [81] = -0.20, -- Fwd HACS Mk IV Director
        [82] =  0.20, -- Aft HACS Mk IV Director
        [83] = -0.15, -- DCT Mk V Main Director
    }
};

-- ####################################################################################
-- Unit Identification & Shape Registration
-- ####################################################################################

GT.Name = "HMS_Dido";
GT.DisplayName = _("HMS Dido (37)");
GT.DisplayNameShort = _("HMS Dido");
GT.Rate = 3500;

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
