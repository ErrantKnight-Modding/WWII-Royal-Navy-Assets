-- HMS Javelin (G61) - 1940-41 Home Fleet (Pattern 507A Dark Grey)
-- Fleet-standard historical Royal Navy livery for HMS_Javelin

livery = {
    -- Primary Hull & Superstructure
    {"Mat_Javelin_Hull_Part1",      DIFFUSE,            "Tex_Javelin_Hull_Part1_1941_diffuse", false},
    {"Mat_Javelin_Hull_Part1",      ROUGHNESS_METALLIC, "Shared_HMS_Javelin_hull_part1_RoughMet_aad161", true},
    {"Mat_Javelin_Hull_Part1",      NORMAL_MAP,         "Shared_HMS_Javelin_hull_part1_bump_218963", true},
    {"Mat_Javelin_Hull_Part2",      DIFFUSE,            "Tex_Javelin_Hull_Part2_1941_diffuse", false},
    {"Mat_Javelin_Hull_Part2",      ROUGHNESS_METALLIC, "Shared_HMS_Javelin_hull_part2_RoughMet_6959b8", true},
    {"Mat_Javelin_Hull_Part2",      NORMAL_MAP,         "Shared_HMS_Javelin_hull_part2_bump_d9905e", true},

    -- Secondary Structural Camouflage (Doors, Rims, Walkways, Superstructure Bulkheads)
    {"Mat_Javelin_StructCamo",      DIFFUSE,            "Tex_Javelin_StructCamo_1941_diffuse", false},
    {"Mat_Javelin_StructCamo",      ROUGHNESS_METALLIC, "Shared_HMS_Javelin_structcamo_RoughMet_e24165", true},

    -- Main 4.7-inch Turrets (Per-Mount A, B, X)
    {"Mat_120mm_Turret_A",          DIFFUSE,            "Tex_120mm_QF_MkXII_1941_diffuse", false},
    {"Mat_120mm_Turret_A",          ROUGHNESS_METALLIC, "Shared_HMS_Javelin_120mm_qf_mkxii_RoughMet_dfce0c", true},
    {"Mat_120mm_Turret_B",          DIFFUSE,            "Tex_120mm_QF_MkXII_1941_diffuse", false},
    {"Mat_120mm_Turret_B",          ROUGHNESS_METALLIC, "Shared_HMS_Javelin_120mm_qf_mkxii_RoughMet_dfce0c", true},
    {"Mat_120mm_Turret_X",          DIFFUSE,            "Tex_120mm_QF_MkXII_1941_diffuse", false},
    {"Mat_120mm_Turret_X",          ROUGHNESS_METALLIC, "Shared_HMS_Javelin_120mm_qf_mkxii_RoughMet_dfce0c", true},

    -- Light AA & Torpedo Armament
    {"Mat_20mm_Oerlikon",           DIFFUSE,            "Tex_20mm_Oerlikon_1941_diffuse", false},
    {"Mat_20mm_Oerlikon",           ROUGHNESS_METALLIC, "Shared_HMS_Javelin_20mm_oerlikon_RoughMet_15dc49", true},
    {"Mat_20mm_Oerlikon_twin",      DIFFUSE,            "Tex_20mm_Oerlikon_Twin_1941_diffuse", false},
    {"Mat_20mm_Oerlikon_twin",      ROUGHNESS_METALLIC, "Shared_HMS_Javelin_20mm_oerlikon_twin_RoughMet_6d41e7", true},
    {"Mat_QF_2-pounder_Quadruple",  DIFFUSE,            "Tex_QF_2-pounder_Quadruple_1941_diffuse", false},
    {"Mat_QF_2-pounder_Quadruple",  ROUGHNESS_METALLIC, "Shared_HMS_Javelin_qf_2-pounder_quadrupl_RoughMet_4b58ba", true},
    {"Mat_530mm_Quintuple",         DIFFUSE,            "Tex_530mm_Quintuple_1941_diffuse", false},
    {"Mat_530mm_Quintuple",         ROUGHNESS_METALLIC, "Shared_HMS_Javelin_530mm_quintuple_RoughMet_e402e2", true},

    -- Fittings, NavLight Exterior Housing, Radar & Masts
    {"Mat_Javelin_Props",           DIFFUSE,            "Tex_Javelin_Props_1941_diffuse", false},
    {"Mat_Javelin_Props",           ROUGHNESS_METALLIC, "Shared_HMS_Javelin_props_RoughMet_ef9eb2", true},
    {"Mat_NavLight_Housing",        DIFFUSE,            "Tex_Javelin_Props_1941_diffuse", false},
    {"Mat_NavLight_Housing",        ROUGHNESS_METALLIC, "Shared_HMS_Javelin_props_RoughMet_ef9eb2", true},
    {"Mat_Javelin_Radar",           DIFFUSE,            "Tex_Javelin_Radar_1941_diffuse", false},
    {"Mat_Javelin_Radar",           ROUGHNESS_METALLIC, "Shared_HMS_Javelin_radar_RoughMet_b49662", true},
    {"Mat_Javelin_Radar_2",         DIFFUSE,            "Tex_Javelin_Radar_2_1941_diffuse", false},
    {"Mat_Javelin_Radar_2",         ROUGHNESS_METALLIC, "Shared_HMS_Javelin_radar_2_RoughMet_09a4ca", true},
    {"Mat_BaseMetal",               DIFFUSE,            "Tex_BaseMetal_1941_diffuse", false},
    {"Mat_BaseMetal",               ROUGHNESS_METALLIC, "Shared_HMS_Javelin_basemetal_RoughMet_b97a69", true},
    {"Mat_BlackMetal",              DIFFUSE,            "Shared_HMS_Javelin_blackmetal_diffuse_72f197", true},
    {"Mat_BlackMetal",              ROUGHNESS_METALLIC, "Shared_HMS_Javelin_basemetal_RoughMet_b97a69", true},

    -- Optics (Wood Seats/Backrests Preserved), Props & Rudder
    {"Mat_UK_Optic",                DIFFUSE,            "Tex_UK_Optics_1941_diffuse", false},
    {"Mat_UK_Optic",                ROUGHNESS_METALLIC, "Shared_HMS_Javelin_uk_optics_RoughMet_95b75e", true},
    {"Mat_UK_Props",                DIFFUSE,            "Tex_UK_props_1941_diffuse", false},
    {"Mat_UK_Props",                ROUGHNESS_METALLIC, "Shared_HMS_Javelin_uk_props_RoughMet_5828c2", true},
    {"Mat_Javelin_Rudder",          DIFFUSE,            "Shared_HMS_Javelin_rudder_diffuse_000157", true},
    {"Mat_Javelin_Rudder",          ROUGHNESS_METALLIC, "Shared_HMS_Javelin_rudder_RoughMet_e82936", true},

    -- Perforated Stairway Landings & Wire-Mesh Vents/Netting
    {"Mat_PerforatedFloor",         DIFFUSE,            "Shared_HMS_Javelin_perforatedfloor_diffuse_510362", true},
    {"Mat_PerforatedFloor",         ROUGHNESS_METALLIC, "Shared_HMS_Javelin_basemetal_RoughMet_b97a69", true},
    {"Mat_MetalGauze",              DIFFUSE,            "Tex_Javelin_Netting_1941_diffuse", false},
    {"Mat_MetalGauze",              ROUGHNESS_METALLIC, "Shared_HMS_Javelin_basemetal_RoughMet_b97a69", true},
}

name = "HMS Javelin (G61) - 1940-41 Home Fleet (Pattern 507A Dark Grey)"
countries = {"UK"}
