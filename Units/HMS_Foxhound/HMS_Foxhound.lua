-- ============================================================================
-- HMS Foxhound (H69) — F-class Fleet Destroyer (Royal Navy)
-- Full DCS World Naval Unit Definition
-- ============================================================================

-- Ensure Common Naval Weapon Database is Loaded
if not (GT_t and GT_t.WS_t and GT_t.WS_t.UK_120mm_QF_MkIX_Single) then
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
    shape = "HMS_Foxhound.lods",
    shape_dstr = "",
    fire_pos = {0, 4, 0},
}

-- Naval Displacement & Physical Characteristics
GT.life = 1800
GT.mass = 1.95e+006            -- 1,950 tonnes full load
GT.max_velocity = 18.52        -- 36 knots (m/s)
GT.race_velocity = 18.52
GT.economy_velocity = 8.23     -- 16 knots
GT.propeller_omega_max = 5000.0
GT.economy_distance = 6.0e+006
GT.race_distance = 2.0e+006
GT.shipLength = 101.48
GT.Width = 10.49
GT.Height = 28.66
GT.Length = 101.48
GT.DeckLevel = 3.5
GT.X_nose = 48.69
GT.X_tail = -50.64
GT.Tail_Width = 4.50
GT.draft = 3.8
GT.Gamma_max = 1.0
GT.Om = 0.06
GT.speedup = 0.28
GT.R_min = 250
GT.distFindObstacles = 400.0
GT.RCS = 6000
GT.IR_emission_coeff = 1.0

-- Propulsion & Steering Animation Arguments
GT.propellor_arg = 8
GT.propellor_speed = 3.5
GT.rudder_arg = 9

-- Nav Lights & Propulsion Animation
GT.animation_arguments = {
    water_propeller = 8,
    rudder = 9,
    nav_lights = 20,
}

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
    pos                      = {18.0, 10.5, 0.0},
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
}

-- Funnel Smoke Exhaust Connectors (Two-digit rule)
GT.exhaust = {
    [1] = { size = 0.8, connector = "POINT_SMOKE_STACK_01" }, -- Forward Funnel
    [2] = { size = 0.8, connector = "POINT_SMOKE_STACK_02" }, -- Aft Funnel
}

-- ============================================================================
-- WEAPON STATIONS & FIRE CONTROL SYSTEM
-- ============================================================================

GT.WS = {}
GT.WS.maxTargetDetectionRange = 25000
GT.WS.radar_type = 103
GT.WS.searchRadarMaxElevation = math.rad(60)
GT.WS.searchRadarFrequencies = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}}

-- 1. Primary Fire Control Director (Admiralty DCT & Rangefinder Fire Control Team, Arg 80)
-- Combines the forward bridge Director Control Tower (DCT) with the after raised coincidence rangefinder.
-- Controls the 4.7-inch (120mm) QF Mk IX main battery and provides targeting for torpedoes.
local ws_director = GT_t.inc_ws()
GT.WS[ws_director] = {}
set_recursive_metatable(GT.WS[ws_director], GT_t.WS_t.UK_DCT_Destroyer_Optic)
GT.WS[ws_director].center = "CENTER_DIRECTOR"
GT.WS[ws_director].drawArgument1 = 80
GT.WS[ws_director].drawArgument2 = -1
GT.WS[ws_director].area = "COLLISION_SHELL_SUPERSTRUCTURE"
GT.WS[ws_director].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(60)}
}
GT.WS[ws_director].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws_director].LN[1], GT_t.WS_t.UK_DCT_Destroyer_Optic.LN[1])
GT.WS[ws_director].LN[1].BR = { {connector_name = "POINT_SIGHT_DIRECTOR"} }

local main_trackers = {
    {{"self", ws_director}},
    {{"none"}}
}

local torp_trackers = {
    {{"self", ws_director}},
    {{"none"}}
}

-- 2. Main Battery Station 1 (Turret A, Forecastle Lower, Args 1 & 2)
local ws = GT_t.inc_ws()
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_120mm_QF_MkIX_Single)
GT.WS[ws].center = "CENTER_GUN_A"
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].drawArgument1 = 1
GT.WS[ws].drawArgument2 = 2
GT.WS[ws].area = "COLLISION_SHELL_TURRET_A"
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(40)}
}
GT.WS[ws].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_120mm_QF_MkIX_Single.LN[1])
GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_GUN_01"} }

-- 3. Main Battery Station 2 (Turret B, Forecastle Superfiring, Args 3 & 4)
ws = GT_t.inc_ws()
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_120mm_QF_MkIX_Single)
GT.WS[ws].center = "CENTER_GUN_B"
GT.WS[ws].reference_angle_Y = math.rad(0)
GT.WS[ws].drawArgument1 = 3
GT.WS[ws].drawArgument2 = 4
GT.WS[ws].area = "COLLISION_SHELL_TURRET_B"
GT.WS[ws].angles = {
    {math.rad(140), math.rad(-140), math.rad(-10), math.rad(40)}
}
GT.WS[ws].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_120mm_QF_MkIX_Single.LN[1])
GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_GUN_02"} }

-- 4. Main Battery Station 3 (Turret X, Aft Superfiring, Args 5 & 6)
ws = GT_t.inc_ws()
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_120mm_QF_MkIX_Single)
GT.WS[ws].center = "CENTER_GUN_X"
GT.WS[ws].reference_angle_Y = math.rad(180) -- Cruising stowage facing aft
GT.WS[ws].drawArgument1 = 5
GT.WS[ws].drawArgument2 = 6
GT.WS[ws].area = "COLLISION_SHELL_TURRET_X"
GT.WS[ws].angles = {
    {math.rad(180), math.rad(40), math.rad(-10), math.rad(40)},
    {math.rad(-40), math.rad(-180), math.rad(-10), math.rad(40)},
}
GT.WS[ws].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_120mm_QF_MkIX_Single.LN[1])
GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_GUN_03"} }

-- 5. Main Battery Station 4 (Turret Y, Aft Lower, Args 7 & 10)
ws = GT_t.inc_ws()
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_120mm_QF_MkIX_Single)
GT.WS[ws].center = "CENTER_GUN_Y"
GT.WS[ws].reference_angle_Y = math.rad(180) -- Cruising stowage facing aft
GT.WS[ws].drawArgument1 = 7
GT.WS[ws].drawArgument2 = 10
GT.WS[ws].area = "COLLISION_SHELL_TURRET_Y"
GT.WS[ws].angles = {
    {math.rad(180), math.rad(30), math.rad(-10), math.rad(40)},
    {math.rad(-30), math.rad(-180), math.rad(-10), math.rad(40)},
}
GT.WS[ws].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_120mm_QF_MkIX_Single.LN[1])
GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_GUN_04"} }

-- 6. Fighting Searchlight (Amidships Platform, Args 160 & 161)
ws = GT_t.inc_ws()
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_Searchlight_44in)
GT.WS[ws].center = "CENTER_SEARCHLIGHT"
GT.WS[ws].drawArgument1 = 160
GT.WS[ws].drawArgument2 = 161
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE"
GT.WS[ws].angles = {
    {math.rad(150), math.rad(-150), math.rad(-5), math.rad(70)}
}
GT.WS[ws].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_Searchlight_44in.LN[1])
GT.WS[ws].LN[1].BR = { {connector_name = "POINT_SIGHT_SEARCHLIGHT"} }

-- 7. Light AA Station 1: Vickers .50-cal Quad (Starboard Bridge Wing, Args 21 & 22)
ws = GT_t.inc_ws()
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_50cal_Vickers_Quad)
GT.WS[ws].center = "CENTER_VICKERS_01"
GT.WS[ws].reference_angle_Y = math.rad(-90)
GT.WS[ws].drawArgument1 = 21
GT.WS[ws].drawArgument2 = 22
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE"
GT.WS[ws].angles = {
    {math.rad(10), math.rad(-170), math.rad(-10), math.rad(70)}
}
GT.WS[ws].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_50cal_Vickers_Quad.LN[1])
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_VICKERS_01_1"},
    {connector_name = "POINT_GUN_VICKERS_01_2"},
    {connector_name = "POINT_GUN_VICKERS_01_3"},
    {connector_name = "POINT_GUN_VICKERS_01_4"},
}

-- 8. Light AA Station 2: Vickers .50-cal Quad (Port Bridge Wing, Args 23 & 24)
ws = GT_t.inc_ws()
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_50cal_Vickers_Quad)
GT.WS[ws].center = "CENTER_VICKERS_02"
GT.WS[ws].reference_angle_Y = math.rad(90)
GT.WS[ws].drawArgument1 = 23
GT.WS[ws].drawArgument2 = 24
GT.WS[ws].area = "COLLISION_SHELL_SUPERSTRUCTURE"
GT.WS[ws].angles = {
    {math.rad(170), math.rad(-10), math.rad(-10), math.rad(70)}
}
GT.WS[ws].LN = { [1] = {} }
set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_50cal_Vickers_Quad.LN[1])
GT.WS[ws].LN[1].BR = {
    {connector_name = "POINT_GUN_VICKERS_02_1"},
    {connector_name = "POINT_GUN_VICKERS_02_2"},
    {connector_name = "POINT_GUN_VICKERS_02_3"},
    {connector_name = "POINT_GUN_VICKERS_02_4"},
}

-- ============================================================================
-- 9 & 10. Torpedo Battery: 21-inch Quadruple Mounts (Args 13 & 14)
-- ============================================================================
local torp_mounts = {
    {center = "CENTER_TORP_01", arg = 13, conn = "POINT_TORP_01"},
    {center = "CENTER_TORP_02", arg = 14, conn = "POINT_TORP_02"},
}
for i, tm in ipairs(torp_mounts) do
    ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.UK_21in_Quadruple_Torp)
    GT.WS[ws].center = tm.center
    GT.WS[ws].drawArgument1 = tm.arg
    GT.WS[ws].drawArgument2 = -1
    GT.WS[ws].area = "COLLISION_SHELL_MIDSHIPS"
    GT.WS[ws].reference_angle_Y = math.rad(180);
    GT.WS[ws].angles = {
        { math.rad(135), math.rad(45), math.rad(-5), math.rad(25) },
        { math.rad(-45), math.rad(-135), math.rad(-5), math.rad(25) },
    }
    GT.WS[ws].LN = { [1] = {} }
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.UK_21in_Quadruple_Torp.LN[1])
    GT.WS[ws].LN[1].depends_on_unit = torp_trackers
    GT.WS[ws].LN[1].BR = {
        {connector_name = tm.conn .. "_1"},
        {connector_name = tm.conn .. "_2"},
        {connector_name = tm.conn .. "_3"},
        {connector_name = tm.conn .. "_4"},
    }
end

-- ============================================================================
-- DAMAGE MODEL (GT.DM)
-- ============================================================================

GT.DM = {
    { area_name = "COLLISION_SHELL_BOW",            area_arg = 100, area_life = 400 },
    { area_name = "COLLISION_SHELL_MIDSHIPS",        area_arg = 102, area_life = 700 },
    { area_name = "COLLISION_SHELL_AFT",             area_arg = 101, area_life = 400 },
    { area_name = "COLLISION_SHELL_SUPERSTRUCTURE",  area_arg = 104, area_life = 300 },
    { area_name = "COLLISION_SHELL_TURRET_A",        area_arg = 105, area_life = 150 },
    { area_name = "COLLISION_SHELL_TURRET_B",        area_arg = 106, area_life = 150 },
    { area_name = "COLLISION_SHELL_TURRET_X",        area_arg = 107, area_life = 150 },
    { area_name = "COLLISION_SHELL_TURRET_Y",        area_arg = 108, area_life = 150 },
}

-- ############################################################################
-- ENCYCLOPEDIA COMBAT POSE DISPLAY
-- ############################################################################

GT.encyclopediaAnimation = {
    args = {
        -- 4.7-inch QF Mk IX Single Mounts (Trained outward & elevated)
        [1] = -0.20, [2] = 0.25,
        [3] = -0.20, [4] = 0.25,
        [5] =  0.20, [6] = 0.25,
        [7] =  0.20, [10] = 0.25,
        -- Quadruple 21-inch Torpedo Mounts (Trained outward)
        [13] = -0.35,
        [14] =  0.35,
        -- Vickers .50-cal Quad AA (Trained outward & elevated)
        [21] = -0.50, [22] = 0.30,
        [23] =  0.50, [24] = 0.30,
        -- Synchronized DCT & Rangefinder Fire Control Team
        [80] = -0.20,
    }
}

-- Unit Metadata
GT.Name = "HMS_Foxhound"
GT.DisplayName = _("HMS Foxhound (H69)")
GT.DisplayNameShort = _("HMS Foxhound")
GT.Rate = 1800

-- Shape Registration in Core Shape Table
GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = "",
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
}

return GT
