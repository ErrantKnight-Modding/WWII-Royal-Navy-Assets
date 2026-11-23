-- HMS Glorious - June 1940 (Home Fleet / Norwegian Campaign - Pattern 507A Dark Grey)
-- Historical Royal Navy Livery:
--   * Hull, Island & Curved Round-Down Nose: Admiralty Pattern 507A Dark Grey
--   * Main Flight Deck & Flying-Off Deck: Weathered Admiralty Pattern 631 Bronze Grey
--   * Quarterdeck & Forecastle: Dark Weathered Teak; Steel Decks: Admiralty Dark Grey

livery = {
    -- Primary Hull, Island Superstructure & Bronze Grey Flight Deck
    {"Mat_Glorious_Hull_Part1",        DIFFUSE,            "Tex_Glorious_Hull_Part1_1940_diffuse", false},
    {"Mat_Glorious_Hull_Part1",        ROUGHNESS_METALLIC, "Tex_Glorious_Hull_Part1_1940_RoughMet", false},
    {"Mat_Glorious_Hull_Part1",        NORMAL_MAP,         "Tex_Glorious_Hull_Part1_1940_bump", false},
    {"Mat_Glorious_Hull_Part2",        DIFFUSE,            "Tex_Glorious_Hull_Part2_1940_diffuse", false},
    {"Mat_Glorious_Hull_Part2",        ROUGHNESS_METALLIC, "Tex_Glorious_Hull_Part2_1940_RoughMet", false},
    {"Mat_Glorious_Hull_Part2",        NORMAL_MAP,         "Tex_Glorious_Hull_Part2_1940_bump", false},
    {"Mat_Glorious_Hull_Part3",        DIFFUSE,            "Tex_Glorious_Hull_Part3_1940_diffuse", false},
    {"Mat_Glorious_Hull_Part3",        ROUGHNESS_METALLIC, "Tex_Glorious_Hull_Part3_1940_RoughMet", false},
    {"Mat_Glorious_Hull_Part3",        NORMAL_MAP,         "Tex_Glorious_Hull_Part3_1940_bump", false},
    {"Mat_Glorious_Part3_WalkFunnel",  DIFFUSE,            "Tex_Glorious_Hull_Part3_1940_diffuse", false},
    {"Mat_Glorious_Part3_WalkFunnel",  ROUGHNESS_METALLIC, "Tex_Glorious_Hull_Part3_1940_RoughMet", false},
    {"Mat_Glorious_Part3_WalkFunnel",  NORMAL_MAP,         "Tex_Glorious_Hull_Part3_1940_bump", false},
    {"Mat_Glorious_Hull_Part4",        DIFFUSE,            "Tex_Glorious_Hull_Part4_1940_diffuse", false},
    {"Mat_Glorious_Hull_Part4",        ROUGHNESS_METALLIC, "Tex_Glorious_Hull_Part4_1940_RoughMet", false},
    {"Mat_Glorious_Hull_Part4",        NORMAL_MAP,         "Tex_Glorious_Hull_Part4_1940_bump", false},

    -- Armament: 4.7-inch QF Mk VIII, 2-pdr Quadruple Pom-Poms, 0.50-in Vickers Quadruple & HACS Mk III Directors
    {"Mat_120mm_QF_MkVIII",            DIFFUSE,            "Tex_120mm_QF_MkVIII_1940_diffuse", false},
    {"Mat_120mm_QF_MkVIII",            ROUGHNESS_METALLIC, "Tex_120mm_QF_MkVIII_1940_RoughMet", false},
    {"Mat_40mm_QF_2-pounder",          DIFFUSE,            "Tex_40mm_QF_2-pounder_Quadruple_1940_diffuse", false},
    {"Mat_40mm_QF_2-pounder",          ROUGHNESS_METALLIC, "Tex_40mm_QF_2-pounder_Quadruple_1940_RoughMet", false},
    {"Mat_13mm_Vickers_MkIII_Quadruple", DIFFUSE,          "Tex_13mm_Vickers_MkIII_Quadruple_1940_diffuse", false},
    {"Mat_13mm_Vickers_MkIII_Quadruple", ROUGHNESS_METALLIC, "Tex_13mm_Vickers_MkIII_Quadruple_1940_RoughMet", false},
    {"Mat_Director_HA_MK-III",         DIFFUSE,            "Tex_Director_HA_MK-III_1940_diffuse", false},
    {"Mat_Director_HA_MK-III",         ROUGHNESS_METALLIC, "Tex_Director_HA_MK-III_1940_RoughMet", false},

    -- Deck Fittings, Cranes, Masts, Hangar Shutters & Walkways
    {"Mat_Glorious_Props",             DIFFUSE,            "Tex_Glorious_Props_1940_diffuse", false},
    {"Mat_Glorious_Props",             ROUGHNESS_METALLIC, "Tex_Glorious_Props_1940_RoughMet", false},
    {"Mat_BaseMetal",                  DIFFUSE,            "Tex_BaseMetal_1940_diffuse", false},
    {"Mat_BaseMetal",                  ROUGHNESS_METALLIC, "Tex_BaseMetal_1940_RoughMet", false},
    {"Mat_MetalFloor",                 DIFFUSE,            "Tex_MetalFloor_1940_diffuse", false},
    {"Mat_MetalFloor",                 ROUGHNESS_METALLIC, "Tex_BaseMetal_1940_RoughMet", false},
    {"Mat_HangarDoors",                DIFFUSE,            "Tex_HangarDoors_1940_diffuse", false},
    {"Mat_HangarDoors",                ROUGHNESS_METALLIC, "Tex_HangarDoors_1940_RoughMet", false},

    -- Optics, Rangefinders, Carley Floats & Ship's Boats
    {"Mat_Optics.001",                 DIFFUSE,            "Tex_Optics_Rangefinder_1940_diffuse", false},
    {"Mat_Optics.001",                 ROUGHNESS_METALLIC, "Tex_Optics_Rangefinder_1940_RoughMet", false},
    {"Mat_UK_Optic",                   DIFFUSE,            "Tex_UK_Optics_1940_diffuse", false},
    {"Mat_UK_Optic",                   ROUGHNESS_METALLIC, "Tex_UK_Optics_1940_RoughMet", false},
    {"Mat_UK_Props",                   DIFFUSE,            "Tex_UK_props_1940_diffuse", false},
    {"Mat_UK_Props",                   ROUGHNESS_METALLIC, "Tex_UK_props_1940_RoughMet", false},
    {"Mat_UK_Raft",                    DIFFUSE,            "Tex_UK_Raft_1940_diffuse", false},
    {"Mat_UK_Raft",                    ROUGHNESS_METALLIC, "Tex_UK_Raft_1940_RoughMet", false},
    {"Mat_UK_MotorLaunch_Medium",      DIFFUSE,            "Tex_UK_MotorLaunch_Medium_1940_diffuse", false},
    {"Mat_UK_MotorLaunch_Medium",      ROUGHNESS_METALLIC, "Tex_UK_MotorLaunch_Medium_1940_RoughMet", false},
    {"Mat_UK_MotorVessel_Large",       DIFFUSE,            "Tex_UK_MotorVessel_Large_1940_diffuse", false},
    {"Mat_UK_MotorVessel_Large",       ROUGHNESS_METALLIC, "Tex_UK_MotorVessel_Large_1940_RoughMet", false},
    -- Perforated Stairway Landings & Wire-Mesh Vents/Netting
    {"Mat_MetalGauze",                 DIFFUSE,            "Tex_Netting_1940_diffuse", false},
    {"Mat_MetalGauze",                 ROUGHNESS_METALLIC, "Tex_BaseMetal_1940_RoughMet", false},
    {"Mat_Netting",                    DIFFUSE,            "Tex_Netting_1940_diffuse", false},
    {"Mat_Netting",                    ROUGHNESS_METALLIC, "Tex_BaseMetal_1940_RoughMet", false},
    {"Mat_Netting_solid",              DIFFUSE,            "Tex_Netting_1940_diffuse", false},
    {"Mat_Netting_solid",              ROUGHNESS_METALLIC, "Tex_BaseMetal_1940_RoughMet", false},
}

name = "HMS Glorious - Jun 1940 (Home Fleet - Pattern 507A Dark Grey)"
countries = {"UK"}
