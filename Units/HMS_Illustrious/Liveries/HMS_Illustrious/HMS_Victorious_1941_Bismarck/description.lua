-- HMS Victorious — May 1941 (Bismarck Action / Operation Rheinubung Chase)
-- Historical Royal Navy Home Fleet Multi-Tone Camouflage Scheme:
--   * Hull & Island Disruptive & Counter-Shading Camouflage: Admiralty MS1, 507A, MS2, MS3, MS4, MS4a & White
--   * Armored Flight Deck: Disruptive Camouflage Bands in MS1, MS2 & 507A with 3D Armored Steel Plating
--   * Horizontal Steel Decks & Walkways: Admiralty Dark Deck Grey (507A)
--   * Lower Hull & Rudder: RN Bright Red Anti-Fouling

livery = {
    -- Primary Hull, Flight Deck & Island Superstructure
    {"Mat_Illustrious_Hull_Part1", DIFFUSE,            "Tex_Illustrious_Hull_Part1_Victorious_diffuse", false},
    {"Mat_Illustrious_Hull_Part1", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part1_RoughMet_59774c", true},
    {"Mat_Illustrious_Hull_Part1", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part1_bump_fa4f1f", true},
    {"Mat_Illustrious_Hull_Part2", DIFFUSE,            "Tex_Illustrious_Hull_Part2_Victorious_diffuse", false},
    {"Mat_Illustrious_Hull_Part2", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part2_RoughMet_50ebbc", true},
    {"Mat_Illustrious_Hull_Part2", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part2_bump_f37177", true},
    {"Mat_Illustrious_Hull_Part3", DIFFUSE,            "Tex_Illustrious_Hull_Part3_Victorious_diffuse", false},
    {"Mat_Illustrious_Hull_Part3", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part3_RoughMet_e0387d", true},
    {"Mat_Illustrious_Hull_Part3", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part3_bump_d46c2d", true},
    {"Mat_Illustrious_Hull_Part4", DIFFUSE,            "Tex_Illustrious_Hull_Part4_Victorious_diffuse", false},
    {"Mat_Illustrious_Hull_Part4", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part4_RoughMet_3898fe", true},
    {"Mat_Illustrious_Hull_Part4", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part4_bump_471118", true},

    -- Armament: 4.5-inch Twin Turrets & 2-pdr Octuple Pom-Poms
    {"Mat_114mm_QF_Mk_III",        DIFFUSE,            "Tex_114mm_QF_Mk_III_Victorious_diffuse", false},
    {"Mat_114mm_QF_Mk_III",        ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_114mm_qf_mk_iii_RoughMet_ef6104", true},
    {"Mat_QF_2-pounder",           DIFFUSE,            "Tex_QF_2-pounder_Octuple_Victorious_diffuse", false},
    {"Mat_QF_2-pounder",           ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_qf_2-pounder_octu_RoughMet_5cae12", true},

    -- Cranes, Masts, Radar, Fittings, Deck Plates & Rudder
    {"Mat_Illustrious_Crane",      DIFFUSE,            "Tex_Illustrious_Crane_Victorious_diffuse", false},
    {"Mat_Illustrious_Crane",      ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_crane_RoughMet_ed9fd4", true},
    {"Mat_Illustrious_Props",      DIFFUSE,            "Tex_Illustrious_Props_Victorious_diffuse", false},
    {"Mat_Illustrious_Props",      ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_props_RoughMet_b42cfd", true},
    {"Mat_IIllustrious_Radar",     DIFFUSE,            "Tex_Illustrious_Radar_Victorious_diffuse", false},
    {"Mat_IIllustrious_Radar",     ROUGHNESS_METALLIC, "Tex_Illustrious_Radar_Victorious_RoughMet", false},
    {"Mat_BaseMetal",              DIFFUSE,            "Tex_BaseMetal_Victorious_diffuse", false},
    {"Mat_BaseMetal",              ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_basemetal_RoughMet_7cfaf4", true},
    {"Mat_Illustrious_StructCamo", DIFFUSE,            "Tex_Illustrious_StructCamo_Victorious_diffuse", false},
    {"Mat_Illustrious_StructCamo", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_structcamo_RoughMet_059ca3", true},
    {"Mat_MetalFloor",             DIFFUSE,            "Shared_HMS_Illustrious_metalfloor_diffuse_6ce118", true},
    {"Mat_MetalFloor",             ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_metalfloor_RoughMet_74758d", true},
    {"Mat_Illustrious_Rudder",     DIFFUSE,            "Tex_Illustrious_Rudder_Victorious_diffuse", false},
    {"Mat_Illustrious_Rudder",     ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_rudder_RoughMet_f56e2d", true},

    -- Fire Control Directors, Optics, Carley Floats & Motor Launches
    {"Mat_UK_Optic.001",           DIFFUSE,            "Tex_UK_Optics_Victorious_diffuse", false},
    {"Mat_UK_Optic.001",           ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_optics_RoughMet_943fbc", true},
    {"Mat_UK_Optic_2",             DIFFUSE,            "Tex_UK_Optic_2_Victorious_diffuse", false},
    {"Mat_UK_Optic_2",             ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_optic_2_RoughMet_c2a684", true},
    {"Mat_UK_Props",               DIFFUSE,            "Tex_UK_props_Victorious_diffuse", false},
    {"Mat_UK_Props",               ROUGHNESS_METALLIC, "Tex_UK_props_Victorious_RoughMet", false},
    {"Mat_UK_Raft.001",            DIFFUSE,            "Shared_HMS_Illustrious_uk_raft_diffuse_027c38", true},
    {"Mat_UK_Raft.001",            ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_raft_RoughMet_128f05", true},
    {"Mat_UK_MotorLaunch_Medium",  DIFFUSE,            "Shared_HMS_Illustrious_uk_motorlaunch_med_diffuse_b106e8", true},
    {"Mat_UK_MotorLaunch_Medium",  ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_motorlaunch_me_RoughMet_232eb5", true},
}

name = "HMS Victorious - May 1941 (Bismarck Action)"
countries = {"UK"}
