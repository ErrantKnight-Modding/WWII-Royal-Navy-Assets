dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/_rn_naval_sounds.lua")

HMS_Glorious_weapons = weapons:new()

-- WS 1..8: Directors & Searchlights (non-firing stations)

-- Heavy AA Battery: 16x 4.7-inch (120mm) QF Mk VIII Single (WS 9..24)
for i = 9, 24 do
    HMS_Glorious_weapons:addTurret(i)
    HMS_Glorious_weapons:addLauncher(i, 1, RN_120mm_Naval)
    HMS_Glorious_weapons:addLauncher(i, 2, RN_120mm_Naval)
end

-- Medium AA: 3x 40mm Octuple Pom-Pom (WS 25..27)
for i = 25, 27 do
    HMS_Glorious_weapons:addTurret(i)
    HMS_Glorious_weapons:addLauncher(i, 1, RN_40mm_PomPom)
end

-- Light AA: 1x .50-cal Vickers Quadruple (WS 28)
HMS_Glorious_weapons:addTurret(28)
HMS_Glorious_weapons:addLauncher(28, 1, RN_50cal_Vickers_Quad)
