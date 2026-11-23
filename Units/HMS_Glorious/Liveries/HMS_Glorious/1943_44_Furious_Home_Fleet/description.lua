-- HMS Furious - 1943-44 Home Fleet & Tirpitz Strikes (June 1943 Disruptive)
-- Historical Royal Navy Home Fleet Camouflage Scheme (CAFO 679/43 G & B Series):
--   * Hull & Island 4-Tone Admiralty Disruptive Camouflage: G5, B15, B30 & G45 ("Panel X" eliminated on Starboard)
--   * Uncamouflaged Weathered Silver-Grey Teak Main Flight Deck & Lower Flying-Off Deck with G45 Steel Round-Down Nose
--   * Horizontal Steel Superstructure, Sponson & Gallery Decks: Weathered Naval Steel Deck Grey

livery = {
    -- Primary Hull, Island Superstructure & Uncamouflaged Weathered Teak Flight Deck
    {"Mat_Glorious_Hull_Part1",        DIFFUSE,            "Tex_Glorious_Hull_Part1_1943_diffuse", false},
    {"Mat_Glorious_Hull_Part1",        ROUGHNESS_METALLIC, "Shared_HMS_Glorious_hull_part1_RoughMet_89c8fa", true},
    {"Mat_Glorious_Hull_Part1",        NORMAL_MAP,         "Shared_HMS_Glorious_hull_part1_bump_62cb6a", true},
    {"Mat_Glorious_Hull_Part2",        DIFFUSE,            "Tex_Glorious_Hull_Part2_1943_diffuse", false},
    {"Mat_Glorious_Hull_Part2",        ROUGHNESS_METALLIC, "Shared_HMS_Glorious_hull_part2_RoughMet_9f48be", true},
    {"Mat_Glorious_Hull_Part2",        NORMAL_MAP,         "Shared_HMS_Glorious_hull_part2_bump_f8ebb8", true},
    {"Mat_Glorious_Hull_Part3",        DIFFUSE,            "Tex_Glorious_Hull_Part3_1943_diffuse", false},
    {"Mat_Glorious_Hull_Part3",        ROUGHNESS_METALLIC, "Shared_HMS_Glorious_hull_part3_RoughMet_d434e2", true},
    {"Mat_Glorious_Hull_Part3",        NORMAL_MAP,         "Shared_HMS_Glorious_hull_part3_bump_67ccb8", true},
    {"Mat_Glorious_Part3_WalkFunnel",  DIFFUSE,            "Tex_Glorious_Hull_Part3_1943_diffuse", false},
    {"Mat_Glorious_Part3_WalkFunnel",  ROUGHNESS_METALLIC, "Shared_HMS_Glorious_hull_part3_RoughMet_d434e2", true},
    {"Mat_Glorious_Part3_WalkFunnel",  NORMAL_MAP,         "Shared_HMS_Glorious_hull_part3_bump_67ccb8", true},
    {"Mat_Glorious_Hull_Part4",        DIFFUSE,            "Tex_Glorious_Hull_Part4_1943_diffuse", false},
    {"Mat_Glorious_Hull_Part4",        ROUGHNESS_METALLIC, "Tex_Glorious_Hull_Part4_1943_RoughMet", false},
    {"Mat_Glorious_Hull_Part4",        NORMAL_MAP,         "Shared_HMS_Glorious_hull_part4_bump_0e126b", true},

    -- Armament: 4.7-inch QF Mk VIII, 2-pdr Quadruple Pom-Poms, 0.50-in Vickers Quadruple & HACS Mk III Directors
    {"Mat_120mm_QF_MkVIII",            DIFFUSE,            "Tex_120mm_QF_MkVIII_1943_diffuse", false},
    {"Mat_120mm_QF_MkVIII",            ROUGHNESS_METALLIC, "Shared_HMS_Glorious_120mm_qf_mkviii_RoughMet_af0005", true},
    {"Mat_40mm_QF_2-pounder",          DIFFUSE,            "Tex_40mm_QF_2-pounder_Quadruple_1943_diffuse", false},
    {"Mat_40mm_QF_2-pounder",          ROUGHNESS_METALLIC, "Shared_HMS_Glorious_40mm_qf_2-pounder_qu_RoughMet_f4db53", true},
    {"Mat_13mm_Vickers_MkIII_Quadruple", DIFFUSE,          "Tex_13mm_Vickers_MkIII_Quadruple_1943_diffuse", false},
    {"Mat_13mm_Vickers_MkIII_Quadruple", ROUGHNESS_METALLIC, "Shared_HMS_Glorious_13mm_vickers_mkiii_q_RoughMet_b1f711", true},
    {"Mat_Director_HA_MK-III",         DIFFUSE,            "Tex_Director_HA_MK-III_1943_diffuse", false},
    {"Mat_Director_HA_MK-III",         ROUGHNESS_METALLIC, "Shared_HMS_Glorious_director_ha_mk-iii_RoughMet_769f7c", true},

    -- Deck Fittings, Cranes, Masts, Hangar Shutters & Walkways
    {"Mat_Glorious_Props",             DIFFUSE,            "Tex_Glorious_Props_1943_diffuse", false},
    {"Mat_Glorious_Props",             ROUGHNESS_METALLIC, "Shared_HMS_Glorious_props_RoughMet_4df842", true},
    {"Mat_BaseMetal",                  DIFFUSE,            "Tex_BaseMetal_1943_diffuse", false},
    {"Mat_BaseMetal",                  ROUGHNESS_METALLIC, "Shared_HMS_Glorious_basemetal_RoughMet_ef8059", true},
    {"Mat_MetalFloor",                 DIFFUSE,            "Shared_HMS_Glorious_metalfloor_diffuse_f07935", true},
    {"Mat_MetalFloor",                 ROUGHNESS_METALLIC, "Shared_HMS_Glorious_basemetal_RoughMet_ef8059", true},
    {"Mat_HangarDoors",                DIFFUSE,            "Tex_HangarDoors_1943_diffuse", false},
    {"Mat_HangarDoors",                ROUGHNESS_METALLIC, "Shared_HMS_Glorious_hangardoors_RoughMet_7e2390", true},

    -- Optics, Rangefinders, Carley Floats & Ship's Boats
    -- (Note: Mat_UK_Vessel.001 wooden cutters/whalers retain their native wooden & painted hull texture)
    {"Mat_Optics.001",                 DIFFUSE,            "Tex_Optics_Rangefinder_1943_diffuse", false},
    {"Mat_Optics.001",                 ROUGHNESS_METALLIC, "Shared_HMS_Glorious_optics_rangefinder_RoughMet_6e1d3e", true},
    {"Mat_UK_Optic",                   DIFFUSE,            "Tex_UK_Optics_1943_diffuse", false},
    {"Mat_UK_Optic",                   ROUGHNESS_METALLIC, "Shared_HMS_Glorious_uk_optics_RoughMet_c8ddd6", true},
    {"Mat_UK_Props",                   DIFFUSE,            "Tex_UK_props_1943_diffuse", false},
    {"Mat_UK_Props",                   ROUGHNESS_METALLIC, "Shared_HMS_Glorious_uk_props_RoughMet_fe3cda", true},
    {"Mat_UK_Raft",                    DIFFUSE,            "Tex_UK_Raft_1943_diffuse", false},
    {"Mat_UK_Raft",                    ROUGHNESS_METALLIC, "Shared_HMS_Glorious_uk_raft_RoughMet_83ba73", true},
    {"Mat_UK_MotorLaunch_Medium",      DIFFUSE,            "Tex_UK_MotorLaunch_Medium_1943_diffuse", false},
    {"Mat_UK_MotorLaunch_Medium",      ROUGHNESS_METALLIC, "Shared_HMS_Glorious_uk_motorlaunch_mediu_RoughMet_4be81d", true},
    {"Mat_UK_MotorVessel_Large",       DIFFUSE,            "Tex_UK_MotorVessel_Large_1943_diffuse", false},
    {"Mat_UK_MotorVessel_Large",       ROUGHNESS_METALLIC, "Shared_HMS_Glorious_uk_motorvessel_large_RoughMet_2f3d96", true},
    -- Perforated Stairway Landings & Wire-Mesh Vents/Netting
    {"Mat_MetalGauze",                 DIFFUSE,            "Tex_Netting_1943_diffuse", false},
    {"Mat_MetalGauze",                 ROUGHNESS_METALLIC, "Shared_HMS_Glorious_basemetal_RoughMet_ef8059", true},
    {"Mat_Netting",                    DIFFUSE,            "Tex_Netting_1943_diffuse", false},
    {"Mat_Netting",                    ROUGHNESS_METALLIC, "Shared_HMS_Glorious_basemetal_RoughMet_ef8059", true},
    {"Mat_Netting_solid",              DIFFUSE,            "Tex_Netting_1943_diffuse", false},
    {"Mat_Netting_solid",              ROUGHNESS_METALLIC, "Shared_HMS_Glorious_basemetal_RoughMet_ef8059", true},
}

name = "HMS Furious - 1943-44 Home Fleet & Tirpitz Strikes (Disruptive)"
countries = {"UK"}
