dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/_rn_naval_sounds.lua")

HMS_Foxhound_weapons = weapons:new()

-- WS 1: Optical Director (non-firing tracker)

-- Main Battery: 4x 4.7-inch (120mm) QF Mk IX Single (WS 2..5)
for i = 2, 5 do
    HMS_Foxhound_weapons:addTurret(i)
    HMS_Foxhound_weapons:addLauncher(i, 1, RN_120mm_Naval)
end

-- WS 6: Searchlight (non-firing)

-- Light AA: 2x .50-cal Vickers Quadruple (WS 7..8)
for i = 7, 8 do
    HMS_Foxhound_weapons:addTurret(i)
    HMS_Foxhound_weapons:addLauncher(i, 1, RN_50cal_Vickers_Quad)
end

-- Torpedo Battery: 2x 21-inch Quadruple Torpedo Mounts (WS 9..10)
for i = 9, 10 do
    HMS_Foxhound_weapons:addTurret(i)
    HMS_Foxhound_weapons:addLauncher(i, 1, RN_21in_Torpedo)
end
