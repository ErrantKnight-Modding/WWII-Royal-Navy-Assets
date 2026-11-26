dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/_rn_naval_sounds.lua")

HMS_Javelin_weapons = weapons:new()

-- WS 1..2: Directors (non-firing trackers)

-- Main Battery: 3x 4.7-inch (120mm) QF Mk XII Twin (WS 3..5)
for i = 3, 5 do
    HMS_Javelin_weapons:addTurret(i)
    HMS_Javelin_weapons:addLauncher(i, 1, RN_120mm_Naval)
end

-- Medium AA: 1x 40mm Quadruple Pom-Pom (WS 6)
HMS_Javelin_weapons:addTurret(6)
HMS_Javelin_weapons:addLauncher(6, 1, RN_40mm_PomPom)

-- Light AA: 2x Twin + 2x Single 20mm Oerlikon (WS 7..10)
for i = 7, 10 do
    HMS_Javelin_weapons:addTurret(i)
    HMS_Javelin_weapons:addLauncher(i, 1, RN_20mm_Oerlikon)
end

-- Torpedo Battery: 2x 21-inch Quintuple Torpedo Mounts (WS 11..12)
for i = 11, 12 do
    HMS_Javelin_weapons:addTurret(i)
    HMS_Javelin_weapons:addLauncher(i, 1, RN_21in_Torpedo)
end
