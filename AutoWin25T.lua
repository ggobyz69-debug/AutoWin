local REBIRTH_DELAY = 0.0001
local WIN_BUTTON_NAME = "Button16"

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local function getRebirthButton()
    local gui = player.PlayerGui
    if not gui then return nil end
    for _, v in ipairs(gui:GetDescendants()) do
        if v:IsA("TextButton") and v.Name == WIN_BUTTON_NAME then
            return v
        end
    end
    return nil
end

while task.wait(REBIRTH_DELAY) do
    local btn = getRebirthButton()
    if btn and btn.Visible and btn.Active then
        local pos = btn.AbsolutePosition + btn.AbsoluteSize / 2
        local ray = workspace.CurrentCamera:ScreenPointToRay(pos.X, pos.Y)
        local targetPos = ray.Origin + ray.Direction * 10
        hrp.CFrame = CFrame.new(targetPos)
        fireclickbutton(btn)
    else
        task.wait(0.5)
    end
end
