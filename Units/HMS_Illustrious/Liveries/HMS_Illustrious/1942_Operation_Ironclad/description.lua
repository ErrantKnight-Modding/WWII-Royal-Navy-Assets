-- HMS Illustrious - May 1942 Operation Ironclad (507A/B5/507C Disruptive)
-- Historical Royal Navy Scheme (Madagascar Landing, May 1942):
--   * Hull, Island & StructCamo 3-Tone Disruptive: 507A Dark Grey, B.5 Medium Blue-Grey & 507C Light Grey
--   * Armored Flight Deck: Weathered Admiralty Pattern 631 Bronze Grey with 3D Steel Plating
--   * Horizontal Steel Decks & Walkways: Admiralty Dark Deck Grey

livery = {
    -- Primary Hull, Flight Deck & Island Superstructure
    {"Mat_Illustrious_Hull_Part1", DIFFUSE,            "Tex_Illustrious_Hull_Part1_1942a_diffuse", false},
    {"Mat_Illustrious_Hull_Part1", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part1_1942b_RoughMet_1593e8", true},
    {"Mat_Illustrious_Hull_Part1", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part1_1942b_bump_9b298d", true},
    {"Mat_Illustrious_Hull_Part2", DIFFUSE,            "Tex_Illustrious_Hull_Part2_1942a_diffuse", false},
    {"Mat_Illustrious_Hull_Part2", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part2_1942b_RoughMet_1a5db8", true},
    {"Mat_Illustrious_Hull_Part2", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part2_1942b_bump_26b392", true},
    {"Mat_Illustrious_Hull_Part3", DIFFUSE,            "Tex_Illustrious_Hull_Part3_1942a_diffuse", false},
    {"Mat_Illustrious_Hull_Part3", ROUGHNESS_METALLIC, "Tex_Illustrious_Hull_Part3_1942a_RoughMet", false},
    {"Mat_Illustrious_Hull_Part3", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part3_1942b_bump_e93c5d", true},
    {"Mat_Illustrious_Hull_Part4", DIFFUSE,            "Tex_Illustrious_Hull_Part4_1942a_diffuse", false},
    {"Mat_Illustrious_Hull_Part4", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_hull_part4_1942b_RoughMet_73d6db", true},
    {"Mat_Illustrious_Hull_Part4", NORMAL_MAP,         "Shared_HMS_Illustrious_hull_part4_1942b_bump_f61904", true},

    -- Armament: 4.5-inch Twin Turrets & 2-pdr Octuple Pom-Poms
    {"Mat_114mm_QF_Mk_III",        DIFFUSE,            "Tex_114mm_QF_Mk_III_1942a_diffuse", false},
    {"Mat_114mm_QF_Mk_III",        ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_114mm_qf_mk_iii_1_RoughMet_eecec9", true},
    {"Mat_QF_2-pounder",           DIFFUSE,            "Tex_QF_2-pounder_Octuple_1942a_diffuse", false},
    {"Mat_QF_2-pounder",           ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_qf_2-pounder_octu_RoughMet_6059d6", true},

    -- Cranes, Masts, Radar, Fittings, Deck Plates & Rudder
    {"Mat_Illustrious_Crane",      DIFFUSE,            "Tex_Illustrious_Crane_1942a_diffuse", false},
    {"Mat_Illustrious_Crane",      ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_crane_1942b_RoughMet_4fd28c", true},
    {"Mat_Illustrious_Props",      DIFFUSE,            "Tex_Illustrious_Props_1942a_diffuse", false},
    {"Mat_Illustrious_Props",      ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_props_1942b_RoughMet_2e487d", true},
    {"Mat_IIllustrious_Radar",     DIFFUSE,            "Tex_Illustrious_Radar_1942a_diffuse", false},
    {"Mat_IIllustrious_Radar",     ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_radar_1942b_RoughMet_671ff2", true},
    {"Mat_BaseMetal",              DIFFUSE,            "Tex_BaseMetal_1942a_diffuse", false},
    {"Mat_BaseMetal",              ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_basemetal_1942b_RoughMet_b97a69", true},
    {"Mat_Illustrious_StructCamo", DIFFUSE,            "Tex_Illustrious_StructCamo_1942a_diffuse", false},
    {"Mat_Illustrious_StructCamo", ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_structcamo_RoughMet_059ca3", true},
    {"Mat_MetalFloor",             DIFFUSE,            "Shared_HMS_Illustrious_metalfloor_1942b_diffuse_5ae72b", true},
    {"Mat_MetalFloor",             ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_metalfloor_1942b_RoughMet_a9adbd", true},
    {"Mat_Illustrious_Rudder",     DIFFUSE,            "Shared_HMS_Illustrious_rudder_1942b_diffuse_ccaf8e", true},
    {"Mat_Illustrious_Rudder",     ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_rudder_1942b_RoughMet_606fda", true},

    -- Fire Control Directors, Optics, Carley Floats & Motor Launches
    {"Mat_UK_Optic.001",           DIFFUSE,            "Tex_UK_Optics_1942a_diffuse", false},
    {"Mat_UK_Optic.001",           ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_optics_1942b_RoughMet_4df929", true},
    {"Mat_UK_Optic_2",             DIFFUSE,            "Tex_UK_Optic_2_1942a_diffuse", false},
    {"Mat_UK_Optic_2",             ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_optic_2_1942b_RoughMet_4a26e6", true},
    {"Mat_UK_Props",               DIFFUSE,            "Tex_UK_props_1942a_diffuse", false},
    {"Mat_UK_Props",               ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_props_1942b_RoughMet_5ba9f6", true},
    {"Mat_UK_Raft.001",            DIFFUSE,            "Tex_UK_Raft_1942a_diffuse", false},
    {"Mat_UK_Raft.001",            ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_raft_1942b_RoughMet_8f65b5", true},
    {"Mat_UK_MotorLaunch_Medium",  DIFFUSE,            "Tex_UK_MotorLaunch_Medium_1942a_diffuse", false},
    {"Mat_UK_MotorLaunch_Medium",  ROUGHNESS_METALLIC, "Shared_HMS_Illustrious_uk_motorlaunch_me_RoughMet_5085bc", true},
}

name = "HMS Illustrious - May 1942 Operation Ironclad (507A/B5/507C Disruptive)"
countries = {"UK"}
