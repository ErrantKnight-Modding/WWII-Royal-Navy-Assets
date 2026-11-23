-- HMCS Ottawa (H31) - 1943-44 North Atlantic & Normandy (Western Approaches)
-- Historical Royal Navy / RCN / ORP Camouflage Livery for HMS_Glowworm

livery = {
    -- Primary Hull, Superstructure, Funnels & Decks
    {"Mat_Glowworm_Hull_Part1",        0,                  "Tex_Glowworm_Hull_Part1_1943_44_H31_diffuse",        false},
    {"Mat_Glowworm_Hull_Part2",        0,                  "Tex_Glowworm_Hull_Part2_1943_44_H31_diffuse",        false},
    {"Mat_Glowworm_Hull_Part1",        ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_hull_part1_RoughMet_652121",       true},
    {"Mat_Glowworm_Hull_Part2",        ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_hull_part2_RoughMet_3e339c",       true},
    {"Mat_Glowworm_Hull_Part1",        NORMAL_MAP,         "Shared_HMS_Glowworm_hull_part1_bump_300976",           true},
    {"Mat_Glowworm_Hull_Part2",        NORMAL_MAP,         "Shared_HMS_Glowworm_hull_part2_bump_0501f8",           true},
    {"Mat_Glowworm_StructCamo",        0,                  "Tex_Glowworm_StructCamo_1943_44_H31_diffuse",        false},
    {"Mat_Glowworm_StructCamo",        ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_structcamo_RoughMet_20c585",       true},

    -- 4.7-inch (120mm) QF Mark IX Mounts A, B, X, Y (Per-Turret Camouflage & Dark Roofs)
    {"Mat_120mm_QF_MkIX",              0,                  "Shared_HMS_Glowworm_120mm_qf_mkix_diffuse_c6dba0",            true},
    {"Mat_120mm_QF_MkIX_B",            0,                  "Shared_HMS_Glowworm_120mm_qf_mkix_diffuse_c6dba0",            true},
    {"Mat_120mm_QF_MkIX_X",            0,                  "Tex_120mm_QF_MkIX_1943_44_H31_X_diffuse",            false},
    {"Mat_120mm_QF_MkIX_Y",            0,                  "Shared_HMS_Glowworm_120mm_qf_mkix_diffuse_c6dba0",            true},
    {"Mat_120mm_QF_MkIX",              ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_120mm_qf_mkix_RoughMet_f19161",             true},
    {"Mat_120mm_QF_MkIX_B",            ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_120mm_qf_mkix_RoughMet_f19161",             true},
    {"Mat_120mm_QF_MkIX_X",            ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_120mm_qf_mkix_RoughMet_f19161",             true},
    {"Mat_120mm_QF_MkIX_Y",            ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_120mm_qf_mkix_RoughMet_f19161",             true},

    -- Torpedo Tubes, Vickers AA & Radar
    {"Mat_530mm_Triple",               0,                  "Tex_530mm_Triple_1943_44_H31_diffuse",               false},
    {"Mat_530mm_Triple",               ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_530mm_triple_RoughMet_88a122",              true},
    {"Mat_Vickers_MkIII_Quadruple",    0,                  "Tex_Vickers_MkIII_Quadruple_1943_44_H31_diffuse",    false},
    {"Mat_Vickers_MkIII_Quadruple",    ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_vickers_mkiii_quadru_RoughMet_3d99a1",   true},
    {"Mat_Glowworm_Radar_2",           0,                  "Tex_Glowworm_Radar_2_1943_44_H31_diffuse",           false},
    {"Mat_Glowworm_Radar_2",           ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_radar_2_RoughMet_130ef4",          true},

    -- Deck Fittings, Sidelight Housing, BaseMetal, Optics & UK Props
    {"Mat_Glowworm_Props",             0,                  "Tex_Glowworm_Props_1943_44_H31_diffuse",             false},
    {"Mat_Glowworm_Props",             ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_props_RoughMet_30c33e",            true},
    {"Mat_NavLight_Housing",           0,                  "Tex_Glowworm_Props_1943_44_H31_diffuse",             false},
    {"Mat_NavLight_Housing",           ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_props_RoughMet_30c33e",            true},
    {"Mat_BaseMetal",                  0,                  "Tex_BaseMetal_1943_44_H31_diffuse",                  false},
    {"Mat_BaseMetal",                  ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_basemetal_RoughMet_b97a69",                 true},
    {"Mat_MetalStructure_Base",        0,                  "Tex_BaseMetal_1943_44_H31_diffuse",                  false},
    {"Mat_MetalStructure_Base",        ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_basemetal_RoughMet_b97a69",                 true},
    {"Mat_Optics",                     0,                  "Tex_Optics_Rangefinder_1943_44_H31_diffuse",         false},
    {"Mat_Optics",                     ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_optics_rangefinder_RoughMet_ccfadf",        true},
    {"Mat_UK_Optic",                   0,                  "Tex_UK_Optics_1943_44_H31_diffuse",                  false},
    {"Mat_UK_Optic",                   ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_uk_optics_RoughMet_092a17",                 true},
    {"Mat_UK_Props",                   0,                  "Tex_Glowworm_UK_props_1943_44_H31_diffuse",          false},
    {"Mat_UK_Props",                   ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_uk_props_RoughMet_60851a",         true},

    -- Perforated Stairway Landings & Wire-Mesh Vents/Netting
    {"Mat_PerforatedFloor",            0,                  "Tex_PerforatedFloor_1943_44_H31_diffuse",            false},
    {"Mat_PerforatedFloor",            ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_basemetal_RoughMet_b97a69",                 true},
    {"Mat_MetalGauze",                 0,                  "Tex_Netting_1943_44_H31_diffuse",                    false},
    {"Mat_MetalGauze",                 ROUGHNESS_METALLIC, "Shared_HMS_Glowworm_basemetal_RoughMet_b97a69",                 true},
}

name = "HMCS Ottawa (H31) - 1943-44 North Atlantic & Normandy (Western Approaches)"
countries = {"UK"}
