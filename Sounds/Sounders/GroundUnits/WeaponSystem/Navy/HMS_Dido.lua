dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/_rn_naval_sounds.lua")

HMS_Dido_weapons = weapons:new()

-- WS 1..8: Directors & Searchlights (non-firing stations)

-- Dual-Purpose Main Battery: 5x 5.25-inch (133mm) QF Mk I Twin (WS 9..13)
for i = 9, 13 do
    HMS_Dido_weapons:addTurret(i)
    HMS_Dido_weapons:addLauncher(i, 1, RN_133mm_Naval)
    HMS_Dido_weapons:addLauncher(i, 2, RN_133mm_Naval)
end

-- Medium AA: 2x 40mm Quadruple Pom-Pom (WS 14..15)
for i = 14, 15 do
    HMS_Dido_weapons:addTurret(i)
    HMS_Dido_weapons:addLauncher(i, 1, RN_40mm_PomPom)
end

-- Light AA: 5x 20mm Oerlikon Single (WS 16..20)
for i = 16, 20 do
    HMS_Dido_weapons:addTurret(i)
    HMS_Dido_weapons:addLauncher(i, 1, RN_20mm_Oerlikon)
end

-- Torpedo Battery: 2x 21-inch Triple Torpedo Mounts (WS 21..22)
for i = 21, 22 do
    HMS_Dido_weapons:addTurret(i)
    HMS_Dido_weapons:addLauncher(i, 1, RN_21in_Torpedo)
end
