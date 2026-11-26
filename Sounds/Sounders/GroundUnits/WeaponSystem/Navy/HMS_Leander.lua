dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/_rn_naval_sounds.lua")

HMS_Leander_weapons = weapons:new()

-- WS 1..7: Directors & Searchlights (non-firing stations)

-- Main Battery: 4x 6-inch BL Mk XXIII Twin (WS 8..11)
for i = 8, 11 do
    HMS_Leander_weapons:addTurret(i)
    HMS_Leander_weapons:addLauncher(i, 1, RN_6in_Naval)
end

-- Heavy AA Battery: 4x 4-inch (102mm) QF Mk XVI Twin (WS 12..15)
for i = 12, 15 do
    HMS_Leander_weapons:addTurret(i)
    HMS_Leander_weapons:addLauncher(i, 1, RN_102mm_Naval)
    HMS_Leander_weapons:addLauncher(i, 2, RN_102mm_Naval)
end

-- Light AA: 3x .50-cal Vickers Quadruple (WS 16..18)
for i = 16, 18 do
    HMS_Leander_weapons:addTurret(i)
    HMS_Leander_weapons:addLauncher(i, 1, RN_50cal_Vickers_Quad)
end

-- Torpedo Battery: 2x 21-inch Quadruple Torpedo Mounts (WS 19..20)
for i = 19, 20 do
    HMS_Leander_weapons:addTurret(i)
    HMS_Leander_weapons:addLauncher(i, 1, RN_21in_Torpedo)
end
