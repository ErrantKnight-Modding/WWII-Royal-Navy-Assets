---------------------------------------------------------------------------------------
-- WWII Royal Navy Assets for DCS World
-- DCS Conversion & Systems: ErrantKnight
--
-- Credits & Attribution:
-- Original 3D naval models created and generously shared by Thomas Beerens.
-- Patreon: https://www.patreon.com/ThomasBeerens
-- Master Index: https://www.patreon.com/ThomasBeerens/posts/links-to-all-52168097
---------------------------------------------------------------------------------------

declare_plugin("WWII Royal Navy Assets",
    {
        installed         = true, 
        dirName           = current_mod_path,
        version           = "1.0.0",
        state             = "installed",
        developerName     = "ErrantKnight",
        info              = _("Historical WWII Royal Navy naval assets for DCS World.\n\nCredits:\nOriginal 3D naval models created and generously shared by Thomas Beerens (https://www.patreon.com/ThomasBeerens).\nDCS conversion, animations, collision shells, weapons, and systems by ErrantKnight."),
        encyclopedia_path = current_mod_path .. '/Encyclopedia',
    })

---------------------------------------------------------------------------------------
-- Mount Virtual File System (VFS) Paths & Shared Weapons
---------------------------------------------------------------------------------------

dofile(current_mod_path .. "/Weapons/WeaponConstants.lua")
dofile(current_mod_path .. "/Weapons/shells.lua")
dofile(current_mod_path .. "/Weapons/torpedoes.lua")
dofile(current_mod_path .. "/Weapons/guns.lua")
dofile(current_mod_path .. "/Weapons/directors.lua")

---------------------------------------------------------------------------------------
-- Helper: Mount VFS & Register Surface Unit
---------------------------------------------------------------------------------------

local function load_unit(unit_name)
    local unit_path = current_mod_path .. "/Units/" .. unit_name

    -- 1. Mount 3D Shapes & Textures
    mount_vfs_model_path(unit_path .. "/Shapes")
    mount_vfs_texture_path(unit_path .. "/Shapes")
    mount_vfs_texture_path(unit_path .. "/Textures")
    mount_vfs_texture_path(unit_path .. "/Textures/" .. unit_name .. ".zip")

    -- 2. Mount Self-Contained Unit Liveries (CoreMods/WWII Units pattern)
    mount_vfs_liveries_path(unit_path .. "/Liveries")

    -- 3. Load Unit Definition & Register Shape Table
    local shipData = dofile(unit_path .. "/" .. unit_name .. ".lua")
    if shipData and type(shipData) == "table" then
        if not shipData.shape_table_data and shipData.visual then
            shipData.shape_table_data = 
            {
                {
                    file        = shipData.visual.shape,
                    name        = shipData.visual.shape,
                    username    = shipData.Name or unit_name,
                    desrt       = shipData.visual.shape_dstr or "",
                    classname   = "lLandShip",
                    positioning = "BYNORMAL",
                },
            }
            if shipData.visual.shape_dstr and shipData.visual.shape_dstr ~= "" then
                table.insert(shipData.shape_table_data, {
                    name  = shipData.visual.shape_dstr,
                    file  = shipData.visual.shape_dstr,
                })
            end
        end
        add_surface_unit(shipData)
    end
end

---------------------------------------------------------------------------------------
-- Registered Fleet Units (Comment out any line to disable a unit)
---------------------------------------------------------------------------------------

load_unit("HMS_Nelson")
load_unit("HMS_Foxhound")
load_unit("HMS_Glowworm")
load_unit("HMS_Javelin")
load_unit("HMS_Dido")
load_unit("HMS_Leander")
load_unit("HMS_Glorious")
load_unit("HMS_Illustrious")

plugin_done()
