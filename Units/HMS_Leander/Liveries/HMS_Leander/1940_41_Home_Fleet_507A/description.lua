-- HMS Ajax & Neptune - 1940-41 Home Fleet (Pattern 507A Dark Grey)
-- Historical Royal Navy Camouflage Livery for HMS Leander (HMS Ajax & HMS Neptune Stand-In)

livery = {
    -- Primary Hull, Superstructure & Weathered Teak Decks
    {"Mat_Leander_Hull_Part1",          0,                  "Tex_Leander_Hull_Part1_1940_507A_diffuse",          false},
    {"Mat_Leander_Hull_Part2",          0,                  "Tex_Leander_Hull_Part2_1940_507A_diffuse",          false},
    {"Mat_Leander_Hull_Part1",          ROUGHNESS_METALLIC, "Shared_HMS_Leander_hull_part1_RoughMet_88173d",         true},
    {"Mat_Leander_Hull_Part2",          ROUGHNESS_METALLIC, "Shared_HMS_Leander_hull_part2_RoughMet_958965",         true},
    {"Mat_Leander_Hull_Part1",          NORMAL_MAP,         "Tex_Leander_Hull_Part1_1940_507A_bump",             false},
    {"Mat_Leander_Hull_Part2",          NORMAL_MAP,         "Tex_Leander_Hull_Part2_1940_507A_bump",             false},

    -- 6-inch Main Battery Turrets A, B, X, Y (Pattern 507A Dark Grey & Anti-Glare Roofs)
    {"Mat_152mm_BL_MKXXIII_Twin",       0,                  "Tex_152mm_BL_MKXXIII_Twin_1940_507A_diffuse",       false},
    {"Mat_152mm_BL_MKXXIII_Twin_B",     0,                  "Tex_152mm_BL_MKXXIII_Twin_1940_507A_diffuse",       false},
    {"Mat_152mm_BL_MKXXIII_Twin_X",     0,                  "Tex_152mm_BL_MKXXIII_Twin_1940_507A_diffuse",       false},
    {"Mat_152mm_BL_MKXXIII_Twin_Y",     0,                  "Tex_152mm_BL_MKXXIII_Twin_1940_507A_diffuse",       false},
    {"Mat_152mm_BL_MKXXIII_Twin",       ROUGHNESS_METALLIC, "Shared_HMS_Leander_152mm_bl_mkxxiii_twin_RoughMet_51a68d",      true},
    {"Mat_152mm_BL_MKXXIII_Twin_B",     ROUGHNESS_METALLIC, "Shared_HMS_Leander_152mm_bl_mkxxiii_twin_RoughMet_51a68d",      true},
    {"Mat_152mm_BL_MKXXIII_Twin_X",     ROUGHNESS_METALLIC, "Shared_HMS_Leander_152mm_bl_mkxxiii_twin_RoughMet_51a68d",      true},
    {"Mat_152mm_BL_MKXXIII_Twin_Y",     ROUGHNESS_METALLIC, "Shared_HMS_Leander_152mm_bl_mkxxiii_twin_RoughMet_51a68d",      true},

    -- 4-inch Twin HA Mounts
    {"Mat_102mm_QF_Mk_XVI_Twin",        0,                  "Tex_102mm_QF_Mk_XVI_Twin_1940_507A_diffuse",        false},
    {"Mat_102mm_QF_Mk_XVI_Twin_S2",     0,                  "Tex_102mm_QF_Mk_XVI_Twin_1940_507A_diffuse",        false},
    {"Mat_102mm_QF_Mk_XVI_Twin_P1",     0,                  "Tex_102mm_QF_Mk_XVI_Twin_1940_507A_diffuse",        false},
    {"Mat_102mm_QF_Mk_XVI_Twin_P2",     0,                  "Tex_102mm_QF_Mk_XVI_Twin_1940_507A_diffuse",        false},
    {"Mat_102mm_QF_Mk_XVI_Twin",        ROUGHNESS_METALLIC, "Shared_HMS_Leander_102mm_qf_mk_xvi_twin_RoughMet_ab4a2d",       true},
    {"Mat_102mm_QF_Mk_XVI_Twin_S2",     ROUGHNESS_METALLIC, "Shared_HMS_Leander_102mm_qf_mk_xvi_twin_RoughMet_ab4a2d",       true},
    {"Mat_102mm_QF_Mk_XVI_Twin_P1",     ROUGHNESS_METALLIC, "Shared_HMS_Leander_102mm_qf_mk_xvi_twin_RoughMet_ab4a2d",       true},
    {"Mat_102mm_QF_Mk_XVI_Twin_P2",     ROUGHNESS_METALLIC, "Shared_HMS_Leander_102mm_qf_mk_xvi_twin_RoughMet_ab4a2d",       true},

    -- Torpedo Tubes, AA Guns, Directors, Catapult & Radar
    {"Mat_530mm_Quad",                  0,                  "Tex_530mm_Quad_1940_507A_diffuse",                  false},
    {"Mat_530mm_Quad",                  ROUGHNESS_METALLIC, "Shared_HMS_Leander_530mm_quad_RoughMet_21bbfd",                 true},
    {"Mat_Vickers_MkIII_Quadruple",     0,                  "Tex_13mm_Vickers_MkIII_Quadruple_1940_507A_diffuse", false},
    {"Mat_Vickers_MkIII_Quadruple",     ROUGHNESS_METALLIC, "Tex_13mm_Vickers_MkIII_Quadruple_1940_507A_RoughMet", false},
    {"Mat_Director_HA_MK-III",          0,                  "Tex_Director_HA_MK-III_1940_507A_diffuse",          false},
    {"Mat_Director_HA_MK-III",          ROUGHNESS_METALLIC, "Tex_Director_HA_MK-III_1940_507A_RoughMet",         false},
    {"Mat_Leander_Catapult",            0,                  "Tex_Leander_Catapult_1940_507A_diffuse",            false},
    {"Mat_Leander_Catapult",            ROUGHNESS_METALLIC, "Tex_Leander_Catapult_1940_507A_RoughMet",           false},
    {"Mat_Leander_Radar",               0,                  "Tex_Leander_Radar_1940_507A_diffuse",               false},
    {"Mat_Leander_Radar",               ROUGHNESS_METALLIC, "Tex_Leander_Radar_1940_507A_RoughMet",              false},

    -- Deck Fittings, Sidelight Boxes, BaseMetal, Optics, Rangefinders & UK Props
    {"Mat_Leander_Props",               0,                  "Tex_Leander_Props_1940_507A_diffuse",               false},
    {"Mat_Leander_Props",               ROUGHNESS_METALLIC, "Tex_Leander_Props_1940_507A_RoughMet",              false},
    {"Mat_BaseMetal",                   0,                  "Tex_BaseMetal_1940_507A_diffuse",                   false},
    {"Mat_BaseMetal",                   ROUGHNESS_METALLIC, "Tex_BaseMetal_1940_507A_RoughMet",                  false},
    {"Mat_Leander_StructCamo",          0,                  "Tex_Leander_StructCamo_1940_507A_diffuse",          false},
    {"Mat_Leander_StructCamo",          ROUGHNESS_METALLIC, "Shared_HMS_Leander_structcamo_RoughMet_372792",         true},
    {"Mat_UK_Optic",                    0,                  "Tex_UK_Optics_1940_507A_diffuse",                   false},
    {"Mat_UK_Optic",                    ROUGHNESS_METALLIC, "Tex_UK_Optics_1940_507A_RoughMet",                  false},
    {"Mat_Optics.001",                  0,                  "Tex_Optics_Rangefinder_1940_507A_diffuse",          false},
    {"Mat_Optics.001",                  ROUGHNESS_METALLIC, "Tex_Optics_Rangefinder_1940_507A_RoughMet",         false},
    {"Mat_Optics",                      0,                  "Tex_Optics_Rangefinder_1940_507A_diffuse",          false},
    {"Mat_Optics",                      ROUGHNESS_METALLIC, "Tex_Optics_Rangefinder_1940_507A_RoughMet",         false},
    {"Mat_UK_Props",                    0,                  "Tex_Leander_UK_props_1940_507A_diffuse",            false},
    {"Mat_UK_Props",                    ROUGHNESS_METALLIC, "Tex_Leander_UK_props_1940_507A_RoughMet",           false},

    -- Perforated Stairway Landings & Wire-Mesh Vents/Netting
    {"Mat_PerforatedFloor",             0,                  "Tex_PerforatedFloor_1940_507A_diffuse",             false},
    {"Mat_PerforatedFloor",             ROUGHNESS_METALLIC, "Tex_BaseMetal_1940_507A_RoughMet",                  false},
    {"Mat_MetalGauze_vent",             0,                  "Tex_Netting_1940_507A_diffuse",                     false},
    {"Mat_MetalGauze_vent",             ROUGHNESS_METALLIC, "Tex_BaseMetal_1940_507A_RoughMet",                  false},
}

name = "HMS Ajax & Neptune - 1940-41 Home Fleet (Pattern 507A Dark Grey)"
countries = {"UK"}
