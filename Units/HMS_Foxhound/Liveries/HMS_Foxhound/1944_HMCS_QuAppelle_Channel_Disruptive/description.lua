-- HMCS Qu'Appelle (H69) - 1944 English Channel & Normandy (Admiralty Disruptive)
-- Historical Royal Navy / RCN / ORP Camouflage Livery for HMS_Foxhound

livery = {
    -- Primary Hull, Superstructure, Funnels & Decks
    {"Mat_Foxhound_Hull_Part1",        0,                  "Tex_Foxhound_Hull_Part1_1944_H69_diffuse",        false},
    {"Mat_Foxhound_Hull_Part2",        0,                  "Tex_Foxhound_Hull_Part2_1944_H69_diffuse",        false},
    {"Mat_Foxhound_Hull_Part1",        ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_hull_part1_RoughMet_9afde1",       true},
    {"Mat_Foxhound_Hull_Part2",        ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_hull_part2_RoughMet_3e339c",       true},
    {"Mat_Foxhound_Hull_Part1",        NORMAL_MAP,         "Shared_HMS_Foxhound_hull_part1_bump_300976",           true},
    {"Mat_Foxhound_Hull_Part2",        NORMAL_MAP,         "Shared_HMS_Foxhound_hull_part2_bump_0501f8",           true},
    {"Mat_Foxhound_StructCamo",        0,                  "Tex_Foxhound_StructCamo_1944_H69_diffuse",        false},
    {"Mat_Foxhound_StructCamo",        ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_structcamo_RoughMet_20c585",       true},

    -- 4.7-inch (120mm) QF Mark IX Mounts A, B, X, Y (Per-Turret Camouflage & Dark Roofs)
    {"Mat_120mm_QF_MkIX",              0,                  "Tex_120mm_QF_MkIX_1944_H69_A_diffuse",            false},
    {"Mat_120mm_QF_MkIX_B",            0,                  "Shared_HMS_Foxhound_120mm_qf_mkix_diffuse_f5d9a3",            true},
    {"Mat_120mm_QF_MkIX_X",            0,                  "Shared_HMS_Foxhound_120mm_qf_mkix_diffuse_f5d9a3",            true},
    {"Mat_120mm_QF_MkIX_Y",            0,                  "Tex_120mm_QF_MkIX_1944_H69_Y_diffuse",            false},
    {"Mat_120mm_QF_MkIX",              ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_120mm_qf_mkix_RoughMet_f19161",             true},
    {"Mat_120mm_QF_MkIX_B",            ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_120mm_qf_mkix_RoughMet_f19161",             true},
    {"Mat_120mm_QF_MkIX_X",            ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_120mm_qf_mkix_RoughMet_f19161",             true},
    {"Mat_120mm_QF_MkIX_Y",            ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_120mm_qf_mkix_RoughMet_f19161",             true},

    -- Torpedo Tubes, Vickers AA & Radar
    {"Mat_530mm_Triple",               0,                  "Tex_530mm_Triple_1944_H69_diffuse",               false},
    {"Mat_530mm_Triple",               ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_530mm_triple_RoughMet_88a122",              true},
    {"Mat_Vickers_MkIII_Quadruple",    0,                  "Tex_Vickers_MkIII_Quadruple_1944_H69_diffuse",    false},
    {"Mat_Vickers_MkIII_Quadruple",    ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_vickers_mkiii_quadru_RoughMet_3d99a1",   true},
    {"Mat_Foxhound_Radar_2",           0,                  "Tex_Foxhound_Radar_2_1944_H69_diffuse",           false},
    {"Mat_Foxhound_Radar_2",           ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_radar_2_RoughMet_130ef4",          true},

    -- Deck Fittings, Sidelight Housing, BaseMetal, Optics & UK Props
    {"Mat_Foxhound_Props",             0,                  "Tex_Foxhound_Props_1944_H69_diffuse",             false},
    {"Mat_Foxhound_Props",             ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_props_RoughMet_30c33e",            true},
    {"Mat_NavLight_Housing",           0,                  "Tex_Foxhound_Props_1944_H69_diffuse",             false},
    {"Mat_NavLight_Housing",           ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_props_RoughMet_30c33e",            true},
    {"Mat_BaseMetal",                  0,                  "Tex_BaseMetal_1944_H69_diffuse",                  false},
    {"Mat_BaseMetal",                  ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_basemetal_RoughMet_b97a69",                 true},
    {"Mat_MetalStructure_Base",        0,                  "Tex_BaseMetal_1944_H69_diffuse",                  false},
    {"Mat_MetalStructure_Base",        ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_basemetal_RoughMet_b97a69",                 true},
    {"Mat_Optics",                     0,                  "Tex_Optics_Rangefinder_1944_H69_diffuse",         false},
    {"Mat_Optics",                     ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_optics_rangefinder_RoughMet_ccfadf",        true},
    {"Mat_UK_Optic",                   0,                  "Tex_UK_Optics_1944_H69_diffuse",                  false},
    {"Mat_UK_Optic",                   ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_uk_optics_RoughMet_092a17",                 true},
    {"Mat_UK_Props",                   0,                  "Tex_Foxhound_UK_props_1944_H69_diffuse",          false},
    {"Mat_UK_Props",                   ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_uk_props_RoughMet_60851a",         true},

    -- Perforated Stairway Landings & Wire-Mesh Vents/Netting
    {"Mat_PerforatedFloor",            0,                  "Shared_HMS_Foxhound_perforatedfloor_diffuse_2f59f2",            true},
    {"Mat_PerforatedFloor",            ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_basemetal_RoughMet_b97a69",                 true},
    {"Mat_MetalGauze",                 0,                  "Tex_Netting_1944_H69_diffuse",                    false},
    {"Mat_MetalGauze",                 ROUGHNESS_METALLIC, "Shared_HMS_Foxhound_basemetal_RoughMet_b97a69",                 true},
}

name = "HMCS Qu'Appelle (H69) - 1944 English Channel & Normandy (Admiralty Disruptive)"
countries = {"UK"}
