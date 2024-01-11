AddCSLuaFile()

hook.Add("LVS.PopulateVehicles", "lvs_kalamari", function(lvsNode, pnlContent, tree)
    local node = lvsNode:AddNode("Kalamari's Vehicle Settings", "icon16/cog.png")
    node.DoPopulate = function(self)
        if (self.PropPanel) then return end
        self.PropPanel = vgui.Create( "ContentContainer", pnlContent )
        self.PropPanel:SetVisible( false )
        self.PropPanel:SetTriggerSpawnlistChange( false )
        hook.Run("LVS.Kalamari.AddVehicleSettings", self.PropPanel, node)
    end
    node.DoClick = function(self)
        self:DoPopulate()
        pnlContent:SwitchPanel(self.PropPanel)
    end
end)