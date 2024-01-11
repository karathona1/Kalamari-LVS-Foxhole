include("shared.lua")
include("sh_turret.lua")
include("cl_tankview.lua")
include("cl_attached_playermodels.lua")
include("cl_optics.lua")

function ENT:OnSpawn( PObj )

    if GetConVar("lvs_kalamari_turret_driver"):GetBool() then
        self.TurretSeatIndex = 1
    else
        self.TurretSeatIndex = 2
    end

    self.OpticsPodIndex[self.TurretSeatIndex] = true
end