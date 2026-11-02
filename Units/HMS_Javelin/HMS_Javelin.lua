-- ============================================================================
-- HMS Javelin (F61) — J-class Fleet Destroyer (Royal Navy)
-- Full DCS World Naval Unit Definition
-- Flotilla Leader of the 5th Destroyer Flotilla under Captain Lord Louis Mountbatten
-- ============================================================================

-- Ensure Common Naval Weapon Database is Loaded
if not (GT_t and GT_t.WS_t and GT_t.WS_t.UK_120mm_QF_MkXII_Twin) then
    local wp_base = current_mod_path and (current_mod_path .. "/Weapons/") or "Weapons/"
    dofile(wp_base .. "WeaponConstants.lua")
    dofile(wp_base .. "shells.lua")
    dofile(wp_base .. "torpedoes.lua")
    dofile(wp_base .. "guns.lua")
    dofile(wp_base .. "directors.lua")
end

GT = {}
GT_t.ws = 0

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {
    shape = "HMS_Javelin.lods",
    shape_dstr = "",
    fire_pos = {0, 4, 0},
}

-- Naval Displacement & Physical Characteristics
GT.life = 2200
GT.mass = 2.33e+006            -- 2,330 tonnes deep load displacement
GT.max_velocity = 18.52        -- 36 knots (m/s)
GT.race_velocity = 18.52
GT.economy_velocity = 8.23     -- 16 knots
GT.propeller_omega_max = 5000.0
GT.economy_distance = 6.5e+006
GT.race_distance = 2.2e+006
GT.shipLength = 107.16
GT.Width = 11.52
GT.Height = 31.17
GT.Length = 107.16
GT.DeckLevel = 4.0
GT.X_nose = 52.55
GT.X_tail = -54.61
GT.Tail_Width = 6.14
GT.draft = 3.96
GT.Gamma_max = 1.0
GT.Om = 0.06
GT.speedup = 0.28
GT.R_min = 260
GT.distFindObstacles = 400.0
GT.RCS = 6500
GT.IR_emission_coeff = 1.0

-- Propulsion & Steering Animation Arguments
GT.propellor_arg = 8
GT.propellor_speed = 3.5
GT.rudder_arg = 9

-- Radar Animation
GT.animation_arguments = {
    radar1_rotation = 11,
    water_propeller = 8,
    rudder = 9,
    nav_lights = 20,
}
GT.radar1_period = 10.0 -- Type 281 metric air search mattress radar (~6 RPM)

GT.airWeaponDist = 3500
GT.airFindDist = 15000

GT.DetectionRange = GT.airFindDist -- Yellow sensor detection circle in Mission Editor (15,000 m)
GT.ThreatRange = GT.airWeaponDist   -- Red air threat engagement circle in Mission Editor (3,500 m)
GT.Singleton = "no"

-- Naval Sensor Suite (Radar & Optics)
GT.sensor = {
    max_range_finding_target = 25000,
    min_range_finding_target = 100,
    max_alt_finding_target   = 6000,
    min_alt_finding_target   = 0,
    pos                      = {20.0, 11.0, 0.0},
}

-- Mission Editor & AI Classification
GT.mapclasskey = "P0091000068"
GT.attribute = {
    wsType_Navy,
    wsType_Ship,
    wsType_ArmedShip,
    WSTYPE_PLACEHOLDER,
    "Destroyers",
    "Armed Air Defence",
    "RADAR_BAND1_FOR_ARM",
    "RADAR_BAND2_FOR_ARM",
}
GT.Categories = {
    {name = "Armed Ship"},
}
GT.tags = {
    "Destroyer",
    "Air Defence",
}
GT.Countries = {"UK"}

GT.Sensors = {
    OPTIC = {"long-range naval optics"},
    RADAR = {"carrier search radar"},
}

-- Funnel Smoke Exhaust Connector (Single Trunked Funnel Standard)
GT.exhaust = {
    [1] = { size = 0.9, connector = "POINT_SMOKE_STACK_01" }, -- Single Combined Funnel
}

-- ============================================================================
-- WEAPON STATIONS & FIRE CONTROL SYSTEM
-- ============================================================================

GT.WS = {}
GT.WS.maxTargetDetectionRange = 25000
GT.WS.radar_type = 103
GT.WS.searchRadarMaxElevation = math.rad(60)
GT.WS.searchRadarFrequencies = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}}

-- ----------------------------------------------------------------------------
-- Station 1: Bridge Admiralty Director Control Tower (DCT Mk V / XXI, Arg 80)
-- Dedicated to low-angle surface gunnery and torpedo solution calculation.
-- ----------------------------------------------------------------------------
local ws_dct = GT_t.inc_ws()
GT.WS[ws_dct] = {}
set_recursive_metatable(GT.WS[ws_dct], GT_t.WS_t.UK_DCT_Destroyer_Optic)
GT.WS[ws_dct].center = "CENTER_DIRECTOR_DCT"
GT.WS[ws_dct].pointer = "POINT_SIGHT_DIRECTOR_DCT"
GT.WS[ws_dct].drawArgument1 = 80
GT.WS[ws_dct].drawArgument2 = -1
GT.WS[ws_dct].area = "COLLISION_SHELL_SUPERSTRUCTURE"
GT.WS[ws_dct].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(60)}
}
GT.WS[ws_dct].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_dct].LN[1], GT_t.WS_t.UK_DCT_Destroyer_Optic.LN[1])
GT.WS[ws_dct].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_DCT"} }

-- ----------------------------------------------------------------------------
-- Station 2: Aft Deckhouse High Angle Control System (HACS Mk IV, Arg 81)
-- Fitted with Type 285 metric gunnery radar for AA barrage & blind fire.
-- ----------------------------------------------------------------------------
local ws_hacs = GT_t.inc_ws()
GT.WS[ws_hacs] = {}
set_recursive_metatable(GT.WS[ws_hacs], GT_t.WS_t.UK_Director_HACS_MkIV)
GT.WS[ws_hacs].center = "CENTER_DIRECTOR_HACS"
GT.WS[ws_hacs].pointer = "POINT_SIGHT_DIRECTOR_HACS"
GT.WS[ws_hacs].drawArgument1 = 81
GT.WS[ws_hacs].drawArgument2 = -1
GT.WS[ws_hacs].area = "COLLISION_SHELL_SUPERSTRUCTURE"
GT.WS[ws_hacs].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(80)}
}
GT.WS[ws_hacs].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_hacs].LN[1], GT_t.WS_t.UK_Director_HACS_MkIV.LN[1])
GT.WS[ws_hacs].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR_HACS"} }

-- Director slaving failover tracker chains:
-- 4.7" Main Battery: Surface tracking via DCT primary, AA tracking via HACS secondary, autonomous fallback
local main_trackers = {
    {{"self", ws_dct}},
    {{"self", ws_hacs}},
    {{"none"}}
}

-- Pom-Pom Close-in AA: Air tracking via HACS director primary, autonomous fallback
local pompom_trackers = {
    {{"self", ws_hacs}},
    {{"none"}}
}

-- Quintuple Torpedo Mounts: Surface solution via DCT primary, autonomous fallback
local torp_trackers = {
    {{"self", ws_dct}},
    {{"none"}}
}

-- 2. Turret A: Forward Lower Twin 120mm QF Mk XII (Mount Arg 1, Gun Arg 2)
local ws_A = GT_t.inc_ws()
GT.WS[ws_A] = {}
set_recursive_metatable(GT.WS[ws_A], GT_t.WS_t.UK_120mm_QF_MkXII_Twin)
GT.WS[ws_A].center = "CENTER_GUN_A"
GT.WS[ws_A].drawArgument1 = 1
GT.WS[ws_A].drawArgument2 = 2
GT.WS[ws_A].area = "COLLISION_SHELL_TURRET_A"
GT.WS[ws_A].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(40)}
}
GT.WS[ws_A].reference_angle_Y = math.rad(0)
GT.WS[ws_A].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_A].LN[1], GT_t.WS_t.UK_120mm_QF_MkXII_Twin.LN[1])
GT.WS[ws_A].LN[1].BR = {
    {connector_name = "POINT_GUN_01_1"},
    {connector_name = "POINT_GUN_01_2"},
}
GT.WS[ws_A].LN[1].depends_on_unit = main_trackers

-- 3. Turret B: Forward Superfiring Twin 120mm QF Mk XII (Mount Arg 3, Gun Arg 4)
local ws_B = GT_t.inc_ws()
GT.WS[ws_B] = {}
set_recursive_metatable(GT.WS[ws_B], GT_t.WS_t.UK_120mm_QF_MkXII_Twin)
GT.WS[ws_B].center = "CENTER_GUN_B"
GT.WS[ws_B].drawArgument1 = 3
GT.WS[ws_B].drawArgument2 = 4
GT.WS[ws_B].area = "COLLISION_SHELL_TURRET_B"
GT.WS[ws_B].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(40)}
}
GT.WS[ws_B].reference_angle_Y = math.rad(0)
GT.WS[ws_B].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_B].LN[1], GT_t.WS_t.UK_120mm_QF_MkXII_Twin.LN[1])
GT.WS[ws_B].LN[1].BR = {
    {connector_name = "POINT_GUN_02_1"},
    {connector_name = "POINT_GUN_02_2"},
}
GT.WS[ws_B].LN[1].depends_on_unit = main_trackers

-- 4. Turret X: Aft Superfiring Twin 120mm QF Mk XII (Mount Arg 5, Gun Arg 6)
local ws_X = GT_t.inc_ws()
GT.WS[ws_X] = {}
set_recursive_metatable(GT.WS[ws_X], GT_t.WS_t.UK_120mm_QF_MkXII_Twin)
GT.WS[ws_X].center = "CENTER_GUN_X"
GT.WS[ws_X].drawArgument1 = 5
GT.WS[ws_X].drawArgument2 = 6
GT.WS[ws_X].area = "COLLISION_SHELL_TURRET_X"
GT.WS[ws_X].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(40)}
}
GT.WS[ws_X].reference_angle_Y = math.rad(180) -- Bow-Relative Zero standard: cruising heading faces aft
GT.WS[ws_X].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_X].LN[1], GT_t.WS_t.UK_120mm_QF_MkXII_Twin.LN[1])
GT.WS[ws_X].LN[1].BR = {
    {connector_name = "POINT_GUN_03_1"},
    {connector_name = "POINT_GUN_03_2"},
}
GT.WS[ws_X].LN[1].depends_on_unit = main_trackers

-- 5. Quadruple 2-pounder (40mm) "Pom-Pom" AA (Mount Arg 25, Barrel Arg 26)
local ws_pompom = GT_t.inc_ws()
GT.WS[ws_pompom] = {}
set_recursive_metatable(GT.WS[ws_pompom], GT_t.WS_t.UK_40mm_PomPom_Quad)
GT.WS[ws_pompom].center = "CENTER_POMPOM"
GT.WS[ws_pompom].drawArgument1 = 25
GT.WS[ws_pompom].drawArgument2 = 26
GT.WS[ws_pompom].area = "COLLISION_SHELL_MIDSHIPS"
GT.WS[ws_pompom].angles = {
    {math.rad(160), math.rad(-160), math.rad(-10), math.rad(80)}
}
GT.WS[ws_pompom].reference_angle_Y = math.rad(180) -- Cruising heading faces aft
GT.WS[ws_pompom].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_pompom].LN[1], GT_t.WS_t.UK_40mm_PomPom_Quad.LN[1])
GT.WS[ws_pompom].LN[1].BR = {
    {connector_name = "POINT_GUN_POMPOM_01_1"},
    {connector_name = "POINT_GUN_POMPOM_01_2"},
    {connector_name = "POINT_GUN_POMPOM_01_3"},
    {connector_name = "POINT_GUN_POMPOM_01_4"},
}
GT.WS[ws_pompom].LN[1].depends_on_unit = pompom_trackers

-- 6. Bridge Wing Twin 20mm Oerlikon AA Port (Mount Arg 27, Gun Arg 28)
local ws_oer_p_twin = GT_t.inc_ws()
GT.WS[ws_oer_p_twin] = {}
set_recursive_metatable(GT.WS[ws_oer_p_twin], GT_t.WS_t.UK_20mm_Oerlikon_Twin)
GT.WS[ws_oer_p_twin].center = "CENTER_OERLIKON_01"
GT.WS[ws_oer_p_twin].drawArgument1 = 27
GT.WS[ws_oer_p_twin].drawArgument2 = 28
GT.WS[ws_oer_p_twin].area = "COLLISION_SHELL_SUPERSTRUCTURE"
GT.WS[ws_oer_p_twin].angles = {
    {math.rad(160), math.rad(0), math.rad(-10), math.rad(85)}
}
GT.WS[ws_oer_p_twin].reference_angle_Y = math.rad(45)
GT.WS[ws_oer_p_twin].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_oer_p_twin].LN[1], GT_t.WS_t.UK_20mm_Oerlikon_Twin.LN[1])
GT.WS[ws_oer_p_twin].LN[1].BR = {
    {connector_name = "POINT_GUN_OERLIKON_01_1"},
    {connector_name = "POINT_GUN_OERLIKON_01_2"},
}

-- 7. Bridge Wing Twin 20mm Oerlikon AA Starboard (Mount Arg 29, Gun Arg 30)
local ws_oer_s_twin = GT_t.inc_ws()
GT.WS[ws_oer_s_twin] = {}
set_recursive_metatable(GT.WS[ws_oer_s_twin], GT_t.WS_t.UK_20mm_Oerlikon_Twin)
GT.WS[ws_oer_s_twin].center = "CENTER_OERLIKON_02"
GT.WS[ws_oer_s_twin].drawArgument1 = 29
GT.WS[ws_oer_s_twin].drawArgument2 = 30
GT.WS[ws_oer_s_twin].area = "COLLISION_SHELL_SUPERSTRUCTURE"
GT.WS[ws_oer_s_twin].angles = {
    {math.rad(0), math.rad(-160), math.rad(-10), math.rad(85)}
}
GT.WS[ws_oer_s_twin].reference_angle_Y = math.rad(-45)
GT.WS[ws_oer_s_twin].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_oer_s_twin].LN[1], GT_t.WS_t.UK_20mm_Oerlikon_Twin.LN[1])
GT.WS[ws_oer_s_twin].LN[1].BR = {
    {connector_name = "POINT_GUN_OERLIKON_02_1"},
    {connector_name = "POINT_GUN_OERLIKON_02_2"},
}

-- 8. Aft Single 20mm Oerlikon AA Port (Mount Arg 31, Gun Arg 32)
local ws_oer_p_sgl = GT_t.inc_ws()
GT.WS[ws_oer_p_sgl] = {}
set_recursive_metatable(GT.WS[ws_oer_p_sgl], GT_t.WS_t.UK_20mm_Oerlikon_Single)
GT.WS[ws_oer_p_sgl].center = "CENTER_OERLIKON_03"
GT.WS[ws_oer_p_sgl].drawArgument1 = 31
GT.WS[ws_oer_p_sgl].drawArgument2 = 32
GT.WS[ws_oer_p_sgl].area = "COLLISION_SHELL_AFT"
GT.WS[ws_oer_p_sgl].angles = {
    {math.rad(160), math.rad(20), math.rad(-10), math.rad(85)}
}
GT.WS[ws_oer_p_sgl].reference_angle_Y = math.rad(90)
GT.WS[ws_oer_p_sgl].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_oer_p_sgl].LN[1], GT_t.WS_t.UK_20mm_Oerlikon_Single.LN[1])
GT.WS[ws_oer_p_sgl].LN[1].BR = { {connector_name = "POINT_GUN_OERLIKON_03"} }

-- 9. Aft Single 20mm Oerlikon AA Starboard (Mount Arg 33, Gun Arg 34)
local ws_oer_s_sgl = GT_t.inc_ws()
GT.WS[ws_oer_s_sgl] = {}
set_recursive_metatable(GT.WS[ws_oer_s_sgl], GT_t.WS_t.UK_20mm_Oerlikon_Single)
GT.WS[ws_oer_s_sgl].center = "CENTER_OERLIKON_04"
GT.WS[ws_oer_s_sgl].drawArgument1 = 33
GT.WS[ws_oer_s_sgl].drawArgument2 = 34
GT.WS[ws_oer_s_sgl].area = "COLLISION_SHELL_AFT"
GT.WS[ws_oer_s_sgl].angles = {
    {math.rad(-20), math.rad(-160), math.rad(-10), math.rad(85)}
}
GT.WS[ws_oer_s_sgl].reference_angle_Y = math.rad(-90)
GT.WS[ws_oer_s_sgl].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_oer_s_sgl].LN[1], GT_t.WS_t.UK_20mm_Oerlikon_Single.LN[1])
GT.WS[ws_oer_s_sgl].LN[1].BR = { {connector_name = "POINT_GUN_OERLIKON_04"} }

-- ============================================================================
-- 10. Torpedo Weapon Stations (Quintuple 21-inch Mounts, Args 13 & 14)
-- ============================================================================
local torp_mounts = {
    {center = "CENTER_TORP_01", arg = 13, conn = "POINT_TORP_01"},
    {center = "CENTER_TORP_02", arg = 14, conn = "POINT_TORP_02"},
}
for i, tm in ipairs(torp_mounts) do
    ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_21in_Torpedo_Mount)
    GT.WS[ws].center = tm.center
    GT.WS[ws].reference_angle_Y = math.rad(180)
    GT.WS[ws].drawArgument1 = tm.arg
    GT.WS[ws].drawArgument2 = -1
    GT.WS[ws].area = "COLLISION_SHELL_MIDSHIPS"
    GT.WS[ws].angles = {
        { math.rad(135), math.rad(45), math.rad(-5), math.rad(25) },
        { math.rad(-45), math.rad(-135), math.rad(-5), math.rad(25) },
    }
    GT.WS[ws].LN = { [1] = {} }
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_21in_Torpedo_Mount.LN[1])
    GT.WS[ws].LN[1].BR = {
        {connector_name = tm.conn .. "_1"},
        {connector_name = tm.conn .. "_2"},
        {connector_name = tm.conn .. "_3"},
        {connector_name = tm.conn .. "_4"},
        {connector_name = tm.conn .. "_5"},
    }
    GT.WS[ws].LN[1].depends_on_unit = torp_trackers
end

-- ============================================================================
-- FLEET CARGO & SUPPLY LOGISTICS
-- ============================================================================
-- ============================================================================
-- DAMAGE MODEL (GT.DM)
-- ============================================================================
GT.DM = {
    { area_name = "COLLISION_SHELL_BOW",            area_arg = 100, area_life = 450 },
    { area_name = "COLLISION_SHELL_MIDSHIPS",        area_arg = 102, area_life = 750 },
    { area_name = "COLLISION_SHELL_AFT",             area_arg = 101, area_life = 450 },
    { area_name = "COLLISION_SHELL_SUPERSTRUCTURE",  area_arg = 104, area_life = 350 },
    { area_name = "COLLISION_SHELL_TURRET_A",        area_arg = 105, area_life = 150 },
    { area_name = "COLLISION_SHELL_TURRET_B",        area_arg = 106, area_life = 150 },
    { area_name = "COLLISION_SHELL_TURRET_X",        area_arg = 107, area_life = 150 },
}

-- Registration in DCS Global Fleet Database
GT.Name = "HMS_Javelin"
GT.DisplayName = _("HMS Javelin (F61) Destroyer")
GT.DisplayNameShort = _("Javelin")
GT.Rate = 1800

-- Sound & Wake
GT.SoundMove = {
    sound = "Sound/Vehicles/Ships/CruiserEngine",
    pitch = 1.0,
    volume = 1.0
}

-- Multi-LOD Shape Table Registration
GT.shape_table_data = {
    {
        file        = "HMS_Javelin.lods",
        username    = "HMS Javelin (F61)",
        desrt       = "",
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
}

GT.encyclopediaAnimation = {
    args = {
        -- Twin 120mm QF Mk XII Mounts (Trained slightly outward & elevated)
        [1] = -0.20, [2] = 0.25,
        [3] = -0.20, [4] = 0.25,
        [5] =  0.20, [6] = 0.25,
        -- Quintuple 21-inch Torpedo Mounts (Trained outward)
        [13] = -0.35,
        [14] =  0.35,
        -- Quadruple 2-pounder Pom-Pom
        [25] = -0.30, [26] = 0.35,
        -- Twin 20mm Oerlikon Bridge Wings
        [27] =  0.40, [28] = 0.30,
        [29] = -0.40, [30] = 0.30,
        -- Single 20mm Oerlikon Aft
        [31] =  0.50, [32] = 0.30,
        [33] = -0.50, [34] = 0.30,
        -- Dual Independent Fire Control Directors
        [80] = -0.20,  -- Admiralty DCT trained with main battery
        [81] =  0.30,  -- HACS Mk IV trained skyward tracking air
    }
}

return GT

