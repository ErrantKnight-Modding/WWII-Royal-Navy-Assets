dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/_rn_naval_sounds.lua")

HMS_Illustrious_weapons = weapons:new()

-- WS 1..9: HACS & Pom-Pom Directors (non-firing trackers)

-- Heavy Dual-Purpose Battery: 8x 4.5-inch (114mm) QF Mk III Twin (WS 10..17)
for i = 10, 17 do
    HMS_Illustrious_weapons:addTurret(i)
    HMS_Illustrious_weapons:addLauncher(i, 1, RN_114mm_Naval)
    HMS_Illustrious_weapons:addLauncher(i, 2, RN_114mm_Naval)
end

-- Medium AA: 6x 40mm Octuple Pom-Pom (WS 18..23)
for i = 18, 23 do
    HMS_Illustrious_weapons:addTurret(i)
    HMS_Illustrious_weapons:addLauncher(i, 1, RN_40mm_PomPom)
end
