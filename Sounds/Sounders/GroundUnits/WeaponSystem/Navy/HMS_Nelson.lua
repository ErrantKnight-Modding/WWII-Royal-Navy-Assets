dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/_rn_naval_sounds.lua")

HMS_Nelson_weapons = weapons:new()

-- WS 1..10: Directors & Searchlights (non-firing stations)

-- Main Battery: 3x 16-inch BL Mk I Triple (WS 11..13)
for i = 11, 13 do
    HMS_Nelson_weapons:addTurret(i)
    HMS_Nelson_weapons:addLauncher(i, 1, RN_16in_BL_MkI)
end

-- Secondary Battery: 6x 6-inch BL Mk XXII Twin (WS 14..19)
for i = 14, 19 do
    HMS_Nelson_weapons:addTurret(i)
    HMS_Nelson_weapons:addLauncher(i, 1, RN_6in_Naval)
end

-- Heavy AA Battery: 6x 4.7-inch (120mm) QF Mk VIII Single (WS 20..25)
for i = 20, 25 do
    HMS_Nelson_weapons:addTurret(i)
    HMS_Nelson_weapons:addLauncher(i, 1, RN_120mm_Naval)
    HMS_Nelson_weapons:addLauncher(i, 2, RN_120mm_Naval)
end

-- Medium AA: 3x Octuple + 2x Quadruple 40mm Pom-Pom (WS 26..30)
for i = 26, 30 do
    HMS_Nelson_weapons:addTurret(i)
    HMS_Nelson_weapons:addLauncher(i, 1, RN_40mm_PomPom)
end

-- Light AA: 2x .50-cal Vickers Quadruple (WS 31..32)
for i = 31, 32 do
    HMS_Nelson_weapons:addTurret(i)
    HMS_Nelson_weapons:addLauncher(i, 1, RN_50cal_Vickers_Quad)
end
