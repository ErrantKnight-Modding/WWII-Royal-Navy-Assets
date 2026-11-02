-- ============================================================================
-- Sneaky_Assets: Global Weapon Constants
--
-- Contains ONLY magic numbers used by DCS World that do NOT already have
-- a constant declared for them in DCS Core scripts or wsTypes.lua.
-- ============================================================================

-- Guard against re-execution if loaded by another naval asset pack
if SNEAKY_WEAPON_CONSTANTS_LOADED then return end
SNEAKY_WEAPON_CONSTANTS_LOADED = true

-- ============================================================================
-- 1. LAUNCHER & WEAPON STATION TYPES (GT.WS[ws].type / LN[1].type)
-- In DCS C++ (Weapons.dll), weapon system logic is selected by raw integer IDs.
-- DCS does not declare symbolic constants for these launcher types.
-- ============================================================================
WS_GUN          = 0   -- Small Arms / Machine Guns / Light Auto-weapons (7.62mm - 20mm)
WS_SAM          = 1   -- Surface-to-Air Missile launcher
WS_GUN_HEAVY    = 2   -- Heavy Direct-Fire Naval Artillery (100mm - 406mm Main Batteries)
WS_GUN_AA       = 3   -- Fast Anti-Aircraft Gun (20mm Oerlikon, 40mm Bofors, FlaK)
WS_GUN_GROUND   = 6   -- Hybrid Gun (Can target ships, ground units, or map coordinates)
WS_ARTILLERY    = 10  -- Pure Artillery (High-arc ballistic shore bombardment)
WS_GUN_AA_HEAVY = 11  -- Heavy Dual-Purpose Flak (Timed fuse / Flak bursts, 4" to 6")
WS_CIWS         = 12  -- Close-In Weapon System / Point Defense rapid tracking
WS_TORPEDO      = 32  -- Naval Torpedo Launcher (Single / Multi-tube mounts)

-- ============================================================================
-- 2. SENSOR PROFILE INDICES (set_recursive_metatable(LN[1].sensor, GT_t.WSN_t[X]))
-- DCS Core stores sensor tracking profiles in an unkeyed numeric array GT_t.WSN_t[0..13].
-- DCS does not declare named constants for these indices.
-- ============================================================================
SN_NAVAL_STANDARD   = 0   -- Standard Long-Range Naval Search & Fire Control (Main/Secondary guns)
SN_INFANTRY_MG      = 1   -- Machine Gun / Light Automatic Optic (Fast target switching)
SN_DIRECT_ARMOR     = 2   -- Direct-Fire Vehicle Optic (Tanks, IFVs, coaxial mounts)
SN_AA_FAST          = 3   -- High-Agility Rapid Reaction (Light AA, MLRS, Torpedoes)
SN_RADAR_FCS        = 5   -- Radar Fire Control Tracker (SON-9, AK-725)
SN_GROUND_FIXED     = 6   -- Direct-Fire Anti-Tank / Shore Artillery (KwK 40, Pak 40)
SN_MODERN_FCS       = 7   -- Modern Thermal / Laser Rangefinder FCS (T-72B3, Leopard 2)
SN_HOWITZER         = 8   -- Howitzer Ballistic Computer (CN98, field artillery)
SN_ARTILLERY        = 10  -- Light / Direct-Indirect Naval Artillery (Bofors, L118)
SN_AUTOCANNON       = 11  -- Autocannon / IFV Sensor (BTR-82A)
SN_AA_HEAVY_FLAK    = 12  -- Heavy AA Timed-Fuse Altitude Ranging (88mm Flak 18, 100mm KS-19)
