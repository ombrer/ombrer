local plrs = game:GetService"Players"
local lp = plrs.LocalPlayer
local function sync(...)
return (lp.Backpack:FindFirstChild("Building Tools") or lp.Character:FindFirstChild("Building Tools")).SyncAPI:Invoke(...)
end
local ch = lp.Character
local a = Instance.new("Animation")
a.AnimationId = "rbxassetid://89343416"
ch.Humanoid:LoadAnimation(a):Play()
local a = Instance.new("Animation")
a.AnimationId = "rbxassetid://74897796"
local crunch = ch.Humanoid:LoadAnimation(a)
local zen = ch["Right Arm"].CFrame * CFrame.new(-1.5, 4.5, -2.25) * CFrame.Angles(0, math.rad(90), 0)
local fasces = sync('CreatePart', 'Normal', zen, ch)
fasces.Massless = true
sync('SyncResize', { {Part = fasces, Size = Vector3.new(4, 10, 2), CFrame = zen} })
spawn(function()
sync('CreateMeshes', { {Part = fasces} })
sync('SyncMesh', { {Part = fasces, MeshType = Enum.MeshType.FileMesh, MeshId = "rbxassetid://97927661077153", TextureId = "rbxassetid://82441429606110", Scale = Vector3.new(0.04, 0.04, 0.04)} })
end)
sync('CreateWelds', { fasces }, ch["Right Arm"])
sync('SyncAnchor', { {Part = fasces, Anchored = false} })
lp:GetMouse().Button1Down:Connect(function()
    crunch:Play()
end)
fasces.Touched:Connect(function(p)
    if p.Parent ~= ch and p.Parent:FindFirstChildWhichIsA("Humanoid") then
        sync('SyncResize', { {Part = p, Size = Vector3.new(0.005, 0.005, 0.005), CFrame = CFrame.new(0,-9e9,0)} })
    end
end)
