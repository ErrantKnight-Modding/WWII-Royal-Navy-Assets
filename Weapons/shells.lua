-- ============================================================================
-- Royal Navy Naval Shell & Projectile Definitions
-- Naming Convention:
-- (1) Commonly referred to whole-number units: UK_16in_*, UK_6in_*, UK_50cal_*, UK_40mm_*
-- (2) Fractional units converted to whole metric: UK_120mm_* (4.7-inch)
--
-- HISTORICAL REFERENCES & BALLISTIC SOURCES:
-- 1. Campbell, John (1985). "Naval Weapons of World War Two". Naval Institute Press.
--    - British 16"/45 (40.6 cm) Mark I: pp. 21-23.
--    - British 6"/50 (15.2 cm) BL Mark XXII: pp. 37-39.
--    - British 4.7"/45 (12.0 cm) QF Mark VIII: pp. 49-50.
--    - British 2-pdr [40 mm/39 (1.575")] QF Mark VIII: pp. 71-74.
--    - British 0.50"/62 (12.7 mm) Mark III: pp. 78-79.
-- 2. DiGiulian, Tony. "Naval Weapons of the World" (NavWeaps.com):
--    - 16"/45 Mk I:      http://www.navweaps.com/Weapons/WNBR_16-45_mk1.php
--    - 6"/50 Mk XXII:    http://www.navweaps.com/Weapons/WNBR_6-50_mk22.php
--    - 4.7"/40 Mk VIII:  http://www.navweaps.com/Weapons/WNBR_47-40_mk8.php
--    - 2-pdr Mk VIII:    http://www.navweaps.com/Weapons/WNBR_2pounder_mkviii.php
--    - 0.50"/62 Mk III:  http://www.navweaps.com/Weapons/WNBR_050-62_mk3.php
-- 3. Burt, R. A. (1993). "British Battleships 1919-1945". Arms and Armour Press.
--    - Nelson & Rodney shell weights, fillers, propellant charges, and muzzle velocities.
-- ============================================================================

-- ============================================================================
-- 16-inch (406mm) BL Mark I Projectiles
-- Sources: Campbell (1985) pp. 21-23; NavWeaps; Burt (1993)
-- Shell mass: 2,048 lb (929 kg)
-- Muzzle velocity: 2,580 fps (788 m/s) HE; 2,593 fps (790 m/s) AP
-- ============================================================================

-- 16-inch High Explosive Mark I
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_16in_HE_Mk1",
    user_name = _("16-inch HE Mark I"),
    model_name = "pula",
    v0 = 788,                      -- 2,580 fps muzzle velocity (Campbell p. 21)
    Da0 = 0.0012,                  -- Mechanical angular dispersion for 1920s Mark I mounting
    Da1 = 0.0005,                  -- Linear error / aerodynamic wobble
    Dv0 = 0.0035,                  -- Muzzle velocity variance across SC propellant charges
    mass = 929,                    -- 2,048 lb historical shell weight
    round_mass = 929,
    explosive = 80.0,              -- ~175 lb (79.4-80 kg) TNT/Shellite bursting charge
    life_time = 300,               -- Max flight duration to ~35,000 m
    caliber = 406,                 -- 406.4 mm
    piercing_mass = 185.8,         -- 20% penetrator mass for base/nose fuze detonation
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.5, 0.40, 0.70, 0.12, 1.10 }, -- Heavy naval ballistic drag curve
    k1 = 3.5e-10,                  -- Ballistic coefficient for 929 kg ogival projectile
    tracer_off = -1,               -- No tracer on main battery heavy shell
    rotation_freq = 5,             -- ~1 turn in 30 calibers rifling twist
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 788
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false
    },
});

-- 16-inch Armor Piercing Mark IB
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_16in_AP_Mk1B",
    user_name = _("16-inch AP Mark IB"),
    model_name = "pula",
    v0 = 790,                      -- 2,593 fps nominal AP muzzle velocity (Campbell p. 21)
    Da0 = 0.0012,
    Da1 = 0.0005,
    Dv0 = 0.0035,
    mass = 929,                    -- 2,048 lb AP Mark IB
    round_mass = 929,
    explosive = 23.2,              -- 51.2 lb (23.2 kg) Shellite (70/30 picric acid/dinitrobenzene)
    life_time = 300,
    caliber = 406,
    piercing_mass = 880,           -- ~95% hardened steel body & armour-piercing cap
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.45, 0.38, 0.65, 0.11, 1.05 }, -- Streamlined AP cap ballistic drag
    k1 = 3.2e-10,
    tracer_off = -1,
    rotation_freq = 5,
    smoke_tail_life_time = -1,
    cartridge = 0,    
    aiming_table = { {
            init_vel = 790
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false
    },
});

-- ============================================================================
-- 6-inch (152mm) BL Mark XXII Projectiles
-- Sources: Campbell (1985) pp. 37-39; NavWeaps
-- Shell mass: 100 lb (45.36 kg)
-- Muzzle velocity: 2,945-2,960 fps (898-900 m/s) with 30 lb MD45 cordite
-- ============================================================================

-- 6-inch High Explosive Mark XXII
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_6in_HE_Mk22",
    user_name = _("6-inch HE Mark XXII"),
    model_name = "tracer_bullet_red",
    v0 = 899,                      -- 2,945 fps historical high muzzle velocity
    Da0 = 0.0008, 
    Da1 = 0.0003,
    Dv0 = 0.0028,    
    mass = 45.36,                  -- 100 lb shell weight
    round_mass = 45.36,
    explosive = 4.0,               -- ~8.8 lb (4.0 kg) TNT bursting filler
    life_time = 180,
    caliber = 152.4,
    piercing_mass = 9.07,          -- 20% general fragmentation casing
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.65, 0.48, 0.78, 0.13, 1.25 },
    k1 = 6.2e-10,
    tracer_off = 100,
    rotation_freq = 7,
    smoke_tail_life_time = -1,
    cartridge = 0,  
    aiming_table = { {
            init_vel = 899
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false
    },
});

-- 6-inch Armor Piercing Mark XXII
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_6in_AP_Mk22",
    user_name = _("6-inch AP Mark XXII"),
    model_name = "pula",
    v0 = 900,                      -- 2,950 fps AP muzzle velocity
    Da0 = 0.0008, 
    Da1 = 0.0003,
    Dv0 = 0.0028,    
    mass = 45.36,                  -- 100 lb AP shell
    round_mass = 45.36,
    explosive = 1.7,               -- 3.7 lb (1.7 kg) Shellite burster
    life_time = 180,
    caliber = 152.4,
    piercing_mass = 42.0,          -- Heavy forged penetrator body
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.60, 0.45, 0.75, 0.12, 1.20 },
    k1 = 6.0e-10,
    tracer_off = 100,
    rotation_freq = 7,
    smoke_tail_life_time = -1,
    cartridge = 0,  
    aiming_table = { {
            init_vel = 900
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false
    },
});

-- ============================================================================
-- 4.7-inch (120mm) QF Mark VIII Projectiles
-- Sources: Campbell (1985) pp. 49-50; NavWeaps
-- Shell mass: 50 lb (22.7 kg)
-- Muzzle velocity: 2,457 fps (749 m/s) with 9.4 lb Cordite SC 103 charge
-- ============================================================================

-- 4.7-inch (120mm) High Explosive Mark VIII
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_120mm_HE_Mk8",
    user_name = _("4.7-inch HE Mark VIII"),
    model_name = "tracer_bullet_yellow",
    v0 = 749,                      -- 2,457 fps muzzle velocity (Campbell p. 49)
    Da0 = 0.0010,
    Da1 = 0.0004,
    Dv0 = 0.0030,
    mass = 22.7,                   -- 50.0 lb shell weight
    round_mass = 22.7,
    explosive = 1.8,               -- ~4.0 lb (1.8 kg) TNT/amatol bursting charge
    life_time = 60,                -- Sufficient for 14,500 m surface & 9,500 m altitude
    caliber = 120.0,
    piercing_mass = 5.0,
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.3, 0.63, 0.74, 0.18, 1.65 },
    k1 = 5.0e-10,
    tracer_off = 40,
    rotation_freq = 8,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 749
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = true
    },
});

-- ============================================================================
-- 4.7-inch (120mm) QF Mark IX Projectiles (Destroyer Main Battery)
-- Sources: Campbell (1985) pp. 49-50; NavWeaps (http://www.navweaps.com/Weapons/WNBR_47-45_mk9.php)
-- Shell mass: 50 lb (22.68 kg)
-- Muzzle velocity: 2,650 fps (808 m/s) with 10 lb 3 oz Cordite W
-- Maximum surface range: ~16,970 yards (15,520 m) at 40 degrees elevation
-- ============================================================================

-- 4.7-inch High Explosive Mark IX
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_120mm_HE_MkIX",
    user_name = _("4.7-inch HE Mark IX"),
    model_name = "tracer_bullet_yellow",
    v0 = 808,                      -- 2,650 fps muzzle velocity (Campbell p. 49)
    Da0 = 0.0012,
    Da1 = 0.0004,
    Dv0 = 0.0030,
    mass = 22.68,                  -- 50.0 lb shell weight
    round_mass = 22.68,
    explosive = 2.1,               -- ~4.6 lb (2.1 kg) TNT/Amatol bursting charge
    life_time = 75,                -- Sufficient for 15,500 m surface engagement
    caliber = 120.0,
    piercing_mass = 6.0,
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.3, 0.60, 0.72, 0.16, 1.50 },
    k1 = 5.2e-10,
    tracer_off = 50,
    rotation_freq = 8,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 808
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false
    },
});

-- 4.7-inch Semi-Armor Piercing Mark IX
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_120mm_SAP_MkIX",
    user_name = _("4.7-inch SAP Mark IX"),
    model_name = "tracer_bullet_yellow",
    v0 = 808,
    Da0 = 0.0010,
    Da1 = 0.0003,
    Dv0 = 0.0028,
    mass = 22.68,
    round_mass = 22.68,
    explosive = 1.3,               -- Heavy nose/body with base fuze burster
    life_time = 75,
    caliber = 120.0,
    piercing_mass = 16.0,          -- Heavy penetrator cap & body
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.3, 0.58, 0.70, 0.15, 1.45 },
    k1 = 5.0e-10,
    tracer_off = 50,
    rotation_freq = 8,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 808
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false
    },
});

-- ============================================================================
-- 4.5-inch (114mm) QF Mark III Projectiles (Carrier Dual-Purpose Battery)
-- Sources: Campbell (1985) pp. 54-55; NavWeaps (http://www.navweaps.com/Weapons/WNBR_45-45_mk1.php)
-- Shell mass: 55.0 lb (24.95 kg)
-- Muzzle velocity: 2,450 fps (747 m/s) with Cordite charge
-- Maximum surface range: ~20,700 yards (18,900 m) at 45 degrees elevation
-- Anti-aircraft ceiling: ~41,000 ft (12,500 m) at 80 degrees elevation
-- ============================================================================

-- 4.5-inch High Explosive Mark I
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_114mm_HE_MkI",
    user_name = _("4.5-inch HE Mark I"),
    model_name = "tracer_bullet_yellow",
    v0 = 747,                      -- 2,450 fps muzzle velocity (Campbell p. 55)
    Da0 = 0.0010,
    Da1 = 0.0004,
    Dv0 = 0.0030,
    mass = 24.95,                  -- 55.0 lb shell weight
    round_mass = 24.95,
    explosive = 1.77,              -- ~3.9 lb (1.77 kg) TNT/Amatol bursting charge
    life_time = 70,                -- Sufficient for 18,900 m surface engagement & 12,500 m altitude
    caliber = 114.3,
    piercing_mass = 5.5,
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.3, 0.62, 0.73, 0.17, 1.60 },
    k1 = 5.1e-10,
    tracer_off = 45,
    rotation_freq = 8,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 747
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = true
    },
});

-- ============================================================================
-- 2-pdr (40mm) "Pom-Pom" Mark VIII Projectiles
-- Sources: Campbell (1985) pp. 71-74; NavWeaps
-- Shell mass: 1.68 lb (0.76 kg) High Velocity (HV) round
-- Muzzle velocity: 2,400 fps (732 m/s) with 10 oz cordite
-- ============================================================================

-- 2-pdr (40mm) "Pom-Pom" Mark VIII High Explosive
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_40mm_PomPom_HE",
    user_name = _("2-pdr Pom-Pom HE"),
    model_name = "tracer_bullet_yellow",
    v0 = 732,                      -- 2,400 fps HV muzzle velocity (Campbell p. 71)
    Da0 = 0.0015,
    Da1 = 0.0006,
    Dv0 = 0.0040,
    mass = 0.76,                   -- 1.68 lb HE shell
    round_mass = 0.76,
    explosive = 0.07,              -- 2.5 oz (0.071 kg) Lyddite/TNT
    life_time = 12,                -- Timed self-destruction fuze at ~3,800 yd (3,475 m)
    caliber = 40.0,
    piercing_mass = 0.1,
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.2, 0.50, 0.65, 0.20, 1.65 },
    k1 = 4.0e-10,
    tracer_off = 8,
    rotation_freq = 15,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 732
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = true
    },
});

-- ============================================================================
-- Vickers .50-inch (12.7mm) Mark III Projectiles
-- Sources: Campbell (1985) pp. 78-79; NavWeaps
-- Bullet mass: 580 grains (37.6 g = 0.0376 kg)
-- Muzzle velocity: 2,520 fps (768 m/s)
-- ============================================================================

-- Vickers .50-inch (12.7mm) Mark III Armor Piercing
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_50cal_Vickers_AP",
    user_name = _("Vickers .50-inch AP"),
    model_name = "tracer_bullet_yellow",
    v0 = 768,                      -- 2,520 fps muzzle velocity (Campbell p. 78)
    Da0 = 0.0020,
    Da1 = 0.0008,
    Dv0 = 0.0045,
    mass = 0.038,                  -- 580 grain AP projectile (~38 g)
    round_mass = 0.038,
    explosive = 0.0,               -- Solid hardened carbon steel core
    life_time = 6,                 -- Effective engagement window to 1,500 m
    caliber = 12.7,
    piercing_mass = 0.01,
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.15, 0.50, 0.65, 0.20, 1.65 },
    k1 = 3.0e-10,
    tracer_off = 4,
    rotation_freq = 20,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 768
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = true
    },
});

-- ============================================================================
-- 20mm /70 Mark II / IV Oerlikon Autocannon Projectiles
-- Sources: Campbell (1985) pp. 75-77; NavWeaps
-- Bullet mass: 0.27 lb (0.123 kg)
-- Muzzle velocity: 2,725 fps (830 m/s)
-- Maximum ceiling: ~5,000 ft (1,500 m) / 3,000 m horizontal reach
-- ============================================================================

declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_20mm_Oerlikon_HE",
    user_name = _("20mm Oerlikon HE"),
    model_name = "tracer_bullet_yellow",
    v0 = 830,                      -- 2,725 fps muzzle velocity (Campbell p. 75)
    Da0 = 0.0020,
    Da1 = 0.0008,
    Dv0 = 0.0040,
    mass = 0.123,                  -- 0.27 lb (123 g) HE-tracer projectile
    round_mass = 0.24,
    explosive = 0.010,             -- ~10 g Pentolite bursting charge
    life_time = 8,                 -- Tracer burn out / self-destruction fuze ~2,000 m
    caliber = 20.0,
    piercing_mass = 0.02,
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.18, 0.50, 0.65, 0.20, 1.65 },
    k1 = 3.5e-10,
    tracer_off = 5,
    rotation_freq = 18,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 830
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = true
    },
});

-- ============================================================================
-- 5.25-inch (133mm) QF Mark I Dual-Purpose Projectiles (HMS Dido)
-- Sources: Campbell (1985) pp. 44-46; NavWeaps
-- Shell mass: 80 lb (36.3 kg)
-- Muzzle velocity: 2,600 fps (792 m/s) standard service charge
-- Max range: 25,600 yd (23,400 m) at +45 deg; AA ceiling: 46,500 ft (14,170 m) at +70 deg
-- ============================================================================

-- 5.25-inch High Explosive Mark I (Time / Proximity Fuze AA & Shore Bombardment)
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_133mm_HE_MkI",
    user_name = _("5.25-inch HE Mark I"),
    model_name = "pula",
    v0 = 792,                      -- 2,600 fps muzzle velocity (Campbell p. 44)
    Da0 = 0.0013,
    Da1 = 0.0006,
    Dv0 = 0.0035,
    mass = 36.3,                   -- 80 lb projectile weight
    round_mass = 52.0,             -- Separate propellant cartridge + shell
    explosive = 3.0,               -- ~6.6 lb (3.0 kg) TNT / Amatol bursting charge
    life_time = 90,                -- Trajectory duration out to ~23,000 m
    caliber = 133.3,
    piercing_mass = 7.2,           -- Nose fuze / fragmentation case
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.35, 0.45, 0.70, 0.15, 1.30 },
    k1 = 4.0e-10,
    tracer_off = -1,
    rotation_freq = 12,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 792
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = true
    },
});

-- 5.25-inch Semi-Armor Piercing Mark I (Anti-Surface Combat)
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_133mm_SAP_MkI",
    user_name = _("5.25-inch SAP Mark I"),
    model_name = "pula",
    v0 = 792,
    Da0 = 0.0013,
    Da1 = 0.0006,
    Dv0 = 0.0035,
    mass = 36.3,
    round_mass = 52.0,
    explosive = 1.45,              -- Base-fuzed Shellite filler (1.45 kg)
    life_time = 90,
    caliber = 133.3,
    piercing_mass = 28.0,          -- ~77% hardened armor-piercing core
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.35, 0.45, 0.70, 0.15, 1.30 },
    k1 = 4.0e-10,
    tracer_off = -1,
    rotation_freq = 12,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 792
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false
    },
});

-- ============================================================================
-- 4-inch (102mm) QF Mark XVI Projectiles (HMS Leander)
-- Sources: Campbell (1985) pp. 56-58; NavWeaps (http://www.navweaps.com/Weapons/WNBR_4-45_mk16.php)
-- Shell mass: 35.0 lb (15.88 kg)
-- Muzzle velocity: 2,660 fps (811 m/s) with 9 lb Cordite HS 100
-- Max surface range: 19,850 yd (18,150 m) at +45 deg; AA ceiling: 39,000 ft (11,890 m) at +80 deg
-- ============================================================================

-- 4-inch High Explosive Mark XVI (Timed / Proximity Fuze AA & Surface)
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_102mm_HE_MkXVI",
    user_name = _("4-inch HE Mark XVI"),
    model_name = "tracer_bullet_yellow",
    v0 = 811,                      -- 2,660 fps muzzle velocity (Campbell p. 56)
    Da0 = 0.0011,
    Da1 = 0.0004,
    Dv0 = 0.0030,
    mass = 15.88,                  -- 35.0 lb projectile weight
    round_mass = 28.5,             -- Fixed / separate cased ammunition
    explosive = 1.55,              -- 3.4 lb (1.55 kg) TNT/Amatol bursting charge
    life_time = 75,                -- Sufficient for 18,000 m surface engagement
    caliber = 101.6,
    piercing_mass = 4.0,           -- Fragmentation body
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.30, 0.55, 0.68, 0.16, 1.45 },
    k1 = 4.8e-10,
    tracer_off = 45,
    rotation_freq = 10,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 811
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = true
    },
});

-- 4-inch Semi-Armor Piercing Mark XVI (Anti-Surface Combat)
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_102mm_SAP_MkXVI",
    user_name = _("4-inch SAP Mark XVI"),
    model_name = "tracer_bullet_yellow",
    v0 = 811,
    Da0 = 0.0010,
    Da1 = 0.0003,
    Dv0 = 0.0028,
    mass = 15.88,
    round_mass = 28.5,
    explosive = 0.85,              -- Base-fuzed Shellite filler (0.85 kg)
    life_time = 75,
    caliber = 101.6,
    piercing_mass = 11.5,          -- ~72% hardened steel armor-piercing body
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.30, 0.52, 0.65, 0.15, 1.40 },
    k1 = 4.6e-10,
    tracer_off = 45,
    rotation_freq = 10,
    smoke_tail_life_time = -1,
    cartridge = 0,
    aiming_table = { {
            init_vel = 811
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false
    },
});

-- ============================================================================
-- 6-inch (152mm) BL Mark XXIII Cruiser Projectiles (HMS Leander / Ajax / Achilles)
-- Sources: Campbell (1985) pp. 34-36; NavWeaps
-- Shell mass: 112 lb (50.8 kg)
-- Muzzle velocity: 2,760 fps (841 m/s) with 30 lb SC084 cordite charge
-- ============================================================================

-- 6-inch High Explosive Mark XXIII
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_6in_HE_MkXXIII",
    user_name = _("6-inch HE Mark XXIII"),
    model_name = "tracer_bullet_red",
    v0 = 841,                      -- 2,760 fps cruiser muzzle velocity (Campbell p. 35)
    Da0 = 0.0008, 
    Da1 = 0.0003,
    Dv0 = 0.0028,    
    mass = 50.8,                   -- 112 lb historical shell weight
    round_mass = 50.8,
    explosive = 6.5,               -- ~14.3 lb (6.5 kg) TNT bursting filler
    life_time = 180,
    caliber = 152.4,
    piercing_mass = 10.16,         -- 20% general fragmentation casing
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.60, 0.45, 0.75, 0.12, 1.20 },
    k1 = 5.8e-10,
    tracer_off = 100,
    rotation_freq = 7,
    smoke_tail_life_time = -1,
    cartridge = 0,  
    aiming_table = { {
            init_vel = 841
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false
    },
});

-- 6-inch Armor Piercing Mark XXIII
declare_weapon( {
    category = CAT_SHELLS,
    name = "UK_6in_AP_MkXXIII",
    user_name = _("6-inch AP Mark XXIII"),
    model_name = "pula",
    v0 = 841,                      -- 2,760 fps AP muzzle velocity
    Da0 = 0.0008, 
    Da1 = 0.0003,
    Dv0 = 0.0028,    
    mass = 50.8,                   -- 112 lb AP shell
    round_mass = 50.8,
    explosive = 1.7,               -- 3.7 lb (1.7 kg) Shellite burster
    life_time = 180,
    caliber = 152.4,
    piercing_mass = 45.72,         -- Hardened armor-piercing cap & body (90%)
    s = 0,
    j = 0,
    l = 0,
    cx = { 0.55, 0.42, 0.70, 0.11, 1.15 },
    k1 = 5.4e-10,
    tracer_off = -1,
    rotation_freq = 7,
    smoke_tail_life_time = -1,
    cartridge = 0,  
    aiming_table = { {
            init_vel = 841
        },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false
    },
});