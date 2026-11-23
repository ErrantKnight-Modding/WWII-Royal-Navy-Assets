-- HMS Illustrious — November 1940 (Operation Judgement / Taranto Raid)
-- Historical Royal Navy Mediterranean Fleet Camouflage Scheme:
--   * Hull & Island Disruptive Camouflage: Admiralty 507A Dark Grey & 507A/507C 50:50 Mix
--   * Armored Flight Deck: Weathered Admiralty Pattern 631 Bronze Grey with 3D Armored Steel Plating
--   * Horizontal Steel Decks & Walkways: Admiralty Dark Deck Grey (507A)

livery = {
    -- Primary Hull, Flight Deck & Island Superstructure
    {"Mat_Illustrious_Hull_Part1", DIFFUSE,            "Tex_Illustrious_Hull_Part1_1940_diffuse", false},
    {"Mat_Illustrious_Hull_Part1", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part1_RoughMet_59774c", true},
    {"Mat_Illustrious_Hull_Part1", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part1_bump_fa4f1f", true},
    {"Mat_Illustrious_Hull_Part2", DIFFUSE,            "Tex_Illustrious_Hull_Part2_1940_diffuse", false},
    {"Mat_Illustrious_Hull_Part2", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part2_RoughMet_50ebbc", true},
    {"Mat_Illustrious_Hull_Part2", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part2_bump_f37177", true},
    {"Mat_Illustrious_Hull_Part3", DIFFUSE,            "Tex_Illustrious_Hull_Part3_1940_diffuse", false},
    {"Mat_Illustrious_Hull_Part3", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part3_RoughMet_e0387d", true},
    {"Mat_Illustrious_Hull_Part3", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part3_bump_d46c2d", true},
    {"Mat_Illustrious_Hull_Part4", DIFFUSE,            "Tex_Illustrious_Hull_Part4_1940_diffuse", false},
    {"Mat_Illustrious_Hull_Part4", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part4_RoughMet_3898fe", true},
    {"Mat_Illustrious_Hull_Part4", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part4_bump_471118", true},

    -- Armament: 4.5-inch Twin Turrets & 2-pdr Octuple Pom-Poms
    {"Mat_114mm_QF_Mk_III",        DIFFUSE,            "Tex_114mm_QF_Mk_III_1940_diffuse", false},
    {"Mat_114mm_QF_Mk_III",        ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_114mm_qf_mk_iii_RoughMet_ef6104", true},
    {"Mat_QF_2-pounder",           DIFFUSE,            "Tex_QF_2-pounder_Octuple_1940_diffuse", false},
    {"Mat_QF_2-pounder",           ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_qf_2-pounder_octu_RoughMet_5cae12", true},

    -- Cranes, Masts, Radar, Fittings, Deck Plates & Rudder
    {"Mat_Illustrious_Crane",      DIFFUSE,            "Tex_Illustrious_Crane_1940_diffuse", false},
    {"Mat_Illustrious_Crane",      ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_crane_RoughMet_ed9fd4", true},
    {"Mat_Illustrious_Props",      DIFFUSE,            "Tex_Illustrious_Props_1940_diffuse", false},
    {"Mat_Illustrious_Props",      ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_props_RoughMet_b42cfd", true},
    {"Mat_IIllustrious_Radar",     DIFFUSE,            "Tex_Illustrious_Radar_1940_diffuse", false},
    {"Mat_IIllustrious_Radar",     ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_radar_RoughMet_32dbf4", true},
    {"Mat_BaseMetal",              DIFFUSE,            "Tex_BaseMetal_1940_diffuse", false},
    {"Mat_BaseMetal",              ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_basemetal_RoughMet_7cfaf4", true},
    {"Mat_Illustrious_StructCamo", DIFFUSE,            "Tex_Illustrious_StructCamo_1940_diffuse", false},
    {"Mat_Illustrious_StructCamo", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_structcamo_RoughMet_059ca3", true},
    {"Mat_MetalFloor",             DIFFUSE,            "Shared_HMS_Illustrious_metalfloor_diffuse_6ce118", true},
    {"Mat_MetalFloor",             ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_metalfloor_RoughMet_74758d", true},
    {"Mat_Illustrious_Rudder",     DIFFUSE,            "Tex_Illustrious_Rudder_1940_diffuse", false},
    {"Mat_Illustrious_Rudder",     ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_rudder_RoughMet_f56e2d", true},

    -- Fire Control Directors, Optics, Carley Floats & Motor Launches
    -- (Note: Mat_UK_Vessel.001 rowboats retain their native wooden & painted hull texture)
    {"Mat_UK_Optic.001",           DIFFUSE,            "Tex_UK_Optics_1940_diffuse", false},
    {"Mat_UK_Optic.001",           ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_optics_RoughMet_943fbc", true},
    {"Mat_UK_Optic_2",             DIFFUSE,            "Tex_UK_Optic_2_1940_diffuse", false},
    {"Mat_UK_Optic_2",             ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_optic_2_RoughMet_c2a684", true},
    {"Mat_UK_Props",               DIFFUSE,            "Tex_UK_props_1940_diffuse", false},
    {"Mat_UK_Props",               ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_props_RoughMet_21d0c2", true},
    {"Mat_UK_Raft.001",            DIFFUSE,            "Shared_HMS_Illustrious_uk_raft_diffuse_027c38", true},
    {"Mat_UK_Raft.001",            ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_raft_RoughMet_128f05", true},
    {"Mat_UK_MotorLaunch_Medium",  DIFFUSE,            "Shared_HMS_Illustrious_uk_motorlaunch_med_diffuse_b106e8", true},
    {"Mat_UK_MotorLaunch_Medium",  ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_motorlaunch_me_RoughMet_232eb5", true},
}

name = "HMS Illustrious - Nov 1940 (Operation Judgement)"
countries = {"UK"}
