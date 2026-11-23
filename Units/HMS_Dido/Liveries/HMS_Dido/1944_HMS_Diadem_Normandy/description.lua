-- HMS Diadem (84) - 1944 Normandy D-Day Admiralty Light Disruptive
-- Historical Royal Navy Camouflage Livery for HMS Dido

livery = {
    -- Primary Hull, Superstructure, Funnels & Decks (Part 1..4)
    {"Mat_Dido_Hull_Part1",          0,                  "Tex_Dido_Hull_Part1_1944_diadem_diffuse",          false},
    {"Mat_Dido_Hull_Part2",          0,                  "Tex_Dido_Hull_Part2_1944_diadem_diffuse",          false},
    {"Mat_Dido_Hull_Part3",          0,                  "Tex_Dido_Hull_Part3_1944_diadem_diffuse",          false},
    {"Mat_Dido_Hull_Part4",          0,                  "Tex_Dido_Hull_Part4_1944_diadem_diffuse",          false},
    {"Mat_Dido_Hull_Part1",          ROUGHNESS_METALLIC, "Shared_HMS_Dido_hull_part1_RoughMet_3c9b02",         true},
    {"Mat_Dido_Hull_Part2",          ROUGHNESS_METALLIC, "Shared_HMS_Dido_hull_part2_RoughMet_7a7cf3",         true},
    {"Mat_Dido_Hull_Part3",          ROUGHNESS_METALLIC, "Shared_HMS_Dido_hull_part3_RoughMet_63bc29",         true},
    {"Mat_Dido_Hull_Part4",          ROUGHNESS_METALLIC, "Shared_HMS_Dido_hull_part4_RoughMet_d9dae9",         true},
    {"Mat_Dido_Hull_Part1",          NORMAL_MAP,         "Tex_Dido_Hull_Part1_1944_diadem_bump",             false},
    {"Mat_Dido_Hull_Part2",          NORMAL_MAP,         "Tex_Dido_Hull_Part2_1944_diadem_bump",             false},
    {"Mat_Dido_Hull_Part3",          NORMAL_MAP,         "Tex_Dido_Hull_Part3_1944_diadem_bump",             false},
    {"Mat_Dido_Hull_Part4",          NORMAL_MAP,         "Shared_HMS_Dido_hull_part4_bump_11eede",             true},

    -- Secondary Structural Camouflage (Doors, Sidewalls, Bridge Wings, Porthole Rims, Stanchions)
    {"Mat_Dido_StructCamo",          0,                  "Tex_Dido_StructCamo_1944_diadem_diffuse",          false},
    {"Mat_Dido_StructCamo",          ROUGHNESS_METALLIC, "Shared_HMS_Dido_structcamo_RoughMet_fd1631",         true},

    -- 5.25-inch (133mm) Dual-Purpose Twin Turrets A, B, Q, X, Y (Per-Turret Camouflage & Dark Grey Roofs)
    {"Mat_133mm_QF_Mk_I_Twin",       0,                  "Tex_133mm_QF_Mk_I_Twin_1944_diadem_A_diffuse",     false},
    {"Mat_133mm_QF_Mk_I_Twin_B",     0,                  "Tex_133mm_QF_Mk_I_Twin_1944_diadem_B_diffuse",     false},
    {"Mat_133mm_QF_Mk_I_Twin_Q",     0,                  "Tex_133mm_QF_Mk_I_Twin_1944_diadem_Q_diffuse",     false},
    {"Mat_133mm_QF_Mk_I_Twin_X",     0,                  "Tex_133mm_QF_Mk_I_Twin_1944_diadem_X_diffuse",     false},
    {"Mat_133mm_QF_Mk_I_Twin_Y",     0,                  "Tex_133mm_QF_Mk_I_Twin_1944_diadem_Y_diffuse",     false},
    {"Mat_133mm_QF_Mk_I_Twin",       ROUGHNESS_METALLIC, "Shared_HMS_Dido_133mm_qf_mk_i_twin_RoughMet_d84900",      true},
    {"Mat_133mm_QF_Mk_I_Twin_B",     ROUGHNESS_METALLIC, "Shared_HMS_Dido_133mm_qf_mk_i_twin_RoughMet_d84900",      true},
    {"Mat_133mm_QF_Mk_I_Twin_Q",     ROUGHNESS_METALLIC, "Shared_HMS_Dido_133mm_qf_mk_i_twin_RoughMet_d84900",      true},
    {"Mat_133mm_QF_Mk_I_Twin_X",     ROUGHNESS_METALLIC, "Shared_HMS_Dido_133mm_qf_mk_i_twin_RoughMet_d84900",      true},
    {"Mat_133mm_QF_Mk_I_Twin_Y",     ROUGHNESS_METALLIC, "Shared_HMS_Dido_133mm_qf_mk_i_twin_RoughMet_d84900",      true},

    -- AA Armament, Torpedo Tubes & Radars
    {"Mat_QF_2-pounder_Quadruple",   0,                  "Tex_QF_2-pounder_Quadruple_1944_diadem_diffuse",   false},
    {"Mat_QF_2-pounder_Quadruple",   ROUGHNESS_METALLIC, "Shared_HMS_Dido_qf_2-pounder_quadruple_RoughMet_0eb55e",  true},
    {"Mat_20mm_Oerlikon",            0,                  "Tex_20mm_Oerlikon_1944_diadem_diffuse",            false},
    {"Mat_20mm_Oerlikon",            ROUGHNESS_METALLIC, "Shared_HMS_Dido_20mm_oerlikon_RoughMet_80dad8",           true},
    {"Mat_530mm_Triple",             0,                  "Tex_530mm_Triple_1944_diadem_diffuse",             false},
    {"Mat_530mm_Triple",             ROUGHNESS_METALLIC, "Shared_HMS_Dido_530mm_triple_RoughMet_8b3edc",            true},
    {"Mat_Dido_Radar",               0,                  "Tex_Dido_Radar_1944_diadem_diffuse",               false},
    {"Mat_Dido_Radar",               ROUGHNESS_METALLIC, "Shared_HMS_Dido_radar_RoughMet_03613c",              true},
    {"Mat_Dido_Radar_2",             0,                  "Tex_Dido_Radar_2_1944_diadem_diffuse",             false},
    {"Mat_Dido_Radar_2",             ROUGHNESS_METALLIC, "Shared_HMS_Dido_radar_2_RoughMet_170e45",            true},

    -- Deck Fittings, Sidelight Boxes, BaseMetal, Optics & UK Props
    {"Mat_Dido_Props",               0,                  "Tex_Dido_Props_1944_diadem_diffuse",               false},
    {"Mat_Dido_Props",               ROUGHNESS_METALLIC, "Shared_HMS_Dido_props_RoughMet_c502d1",              true},
    {"Mat_BaseMetal",                0,                  "Tex_BaseMetal_1944_diadem_diffuse",                false},
    {"Mat_BaseMetal",                ROUGHNESS_METALLIC, "Shared_HMS_Dido_basemetal_RoughMet_dff591",               true},
    {"Mat_Optics",                   0,                  "Tex_Optics_Rangefinder_1944_diadem_diffuse",       false},
    {"Mat_Optics",                   ROUGHNESS_METALLIC, "Shared_HMS_Dido_optics_rangefinder_RoughMet_72c5ce",      true},
    {"Mat_UK_Optic",                 0,                  "Tex_UK_Optics_1944_diadem_diffuse",                false},
    {"Mat_UK_Optic",                 ROUGHNESS_METALLIC, "Shared_HMS_Dido_uk_optics_RoughMet_bf4380",               true},
    {"Mat_UK_Props",                 0,                  "Tex_Dido_UK_props_1944_diadem_diffuse",            false},
    {"Mat_UK_Props",                 ROUGHNESS_METALLIC, "Shared_HMS_Dido_uk_props_RoughMet_58df95",           true},

    -- Perforated Stairway Landings & Wire-Mesh Vents/Netting
    {"Mat_PerforatedFloor",          0,                  "Tex_PerforatedFloor_1944_diadem_diffuse",          false},
    {"Mat_PerforatedFloor",          ROUGHNESS_METALLIC, "Shared_HMS_Dido_basemetal_RoughMet_dff591",               true},
    {"Mat_MetalGauze",               0,                  "Tex_Netting_1944_diadem_diffuse",                  false},
    {"Mat_MetalGauze",               ROUGHNESS_METALLIC, "Shared_HMS_Dido_basemetal_RoughMet_dff591",               true},
}

name = "HMS Diadem (84) - 1944 Normandy D-Day Admiralty Light Disruptive"
countries = {"UK"}
