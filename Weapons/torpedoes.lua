-- ============================================================================
-- Royal Navy 21-inch Mark IX Steam-Gas Naval Torpedo
-- Standardized for Sneaky_Assets (UK_*)
--
-- HISTORICAL & TECHNICAL SPECIFICATIONS:
-- - Type: Admiralty 21-inch Mark IX (enriched-air steam burner cycle)
-- - Caliber: 533.4 mm (21.0 in)
-- - Length: 7.24 m (23 ft 9 in)
-- - Weight: 1,524 kg (3,360 lb)
-- - Warhead: 340 kg (750 lb) Torpex / TNT
-- - Speed & Range settings:
--     * High: 41 knots (21.1 m/s) to 5,000 m (standard fleet destroyer combat setting)
--     * Low: 36 knots (18.5 m/s) to 9,600 m
-- ============================================================================

local uk_21in_warhead = {
    mass                 = 340.0,
    caliber              = 533,
    expl_mass            = 340.0,
    piercing_mass        = 68.0,
    fantom               = 0,
    other_factors        = { 4.0, 4.0, 4.0 },
    concrete_factors     = { 8.0, 8.0, 20.0 },
    concrete_obj_factor  = 8.0,
    obj_factors          = { 8.0, 8.0 },
    cumulative_factor    = 4.0,
    cumulative_thickness = 0.5,
    time_self_destruct   = 900,
}

UK_21in_Mk_IX = {
    category            = CAT_TORPEDOES or 4,
    name                = "UK_21in_Mk_IX",
    user_name           = _("Mark IX 21-inch Torpedo"),
    display_name_short  = "Mk IX 21in",
    scheme              = "unguided_preset_torpedo",
    class_name          = "wAmmunition",
    model               = "Torpedo_G7A_T1",
    mass                = 1524.0,

    wsTypeOfWeapon      = {
        wsType_Weapon or 4,
        wsType_Torpedo or 8,
        wsType_S_Torpedo or 11,
        WSTYPE_PLACEHOLDER or "WSTYPE_PLACEHOLDER"
    },

    Head_Type           = 0,
    Diam                = 533.4,
    D_max               = 8000.0,
    D_min               = 200.0,
    V_min               = -1.0,
    V_max               = 300.0,
    H_max               = 25.0,             -- High vertical tolerance to engage surface vessels
    H_min               = -100.0,
    Life_Time           = 900.0,
    Nr_max              = 2.0,
    v_mid               = 21.1,             -- 41 knots combat speed

    shape_table_data = {
        {
            name     = "UK_21in_Mk_IX",
            file     = "Torpedo_G7A_T1",     -- Stock DCS WWII 21-inch steam torpedo EDM
            life     = 1,
            fire     = {0, 1},
            username = _("Mark IX 21-inch Torpedo"),
            index    = WSTYPE_PLACEHOLDER or "WSTYPE_PLACEHOLDER",
        },
    },

    fm = {
        mass         = 1524.0,
        caliber      = 0.5334,
        cx_coeff     = {1, 0.39, 0.38, 0.236, 1.31},
        L            = 7.24,
        I            = 1 / 12 * 1524.0 * 7.24 * 7.24,
        Ma           = 0.2,
        Ma_x         = 0.1,
        Mw           = 0.4,
        Mw_x         = 0.01,
        Sw           = 0.5,
        Sww          = 0.5,
        dCydA        = {0.07, 0.036},
        A            = 0.5,
        maxAoa       = 0.3,
        finsTau      = 0.02,
        fins_val_div = 10000,
        int_rho_y    = 0.5,
        rho_w        = 517,
        splash_time  = 0.5,
        splash_dt    = 0.004,
        wind_sigma   = 0.0,
        wind_time    = 0.0,
    },

    autopilot = {
        delay                = 2.0,
        Kpv                  = 0.03,
        Kdv                  = 0.0,
        Kiv                  = 0.00002,
        Kph                  = 28.0,
        Kdh                  = 3.0,
        Kih                  = 0.0,
        steady_depth         = 3.0,          -- Runs at 3m depth to impact warship hull
        hKp_err_croll        = 0.0,
        roll_diff_correction = 1,
        fins_limit           = 0.25,
        x_fins_limit         = 0.0,
        vel_proj_div         = 10.0,
        v_vel_limit          = 25.0,
        hor_spir_on_time     = 0,
        hor_spir_period      = 0,
        hor_spir_power       = 0,
    },

    engine = {
        data_table     = {6600, 777, 11300, 365, 13600, 222},
        default_thrust = 11300,
        rail_thrust    = 6000,
    },

    warhead       = uk_21in_warhead,
    warhead_water = uk_21in_warhead,
}

declare_weapon(UK_21in_Mk_IX)
