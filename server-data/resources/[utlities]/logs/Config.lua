DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/727069790820368384/bxuXCgzHpiGqewPwkFM7VDq6WLoOCidWqNaA51XzUH_yyWAvbE-ZKkAWY6PrR7CeUN9S'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/727068978081562654/ieN2tmzl3Jg4QS7yPGtX6t8us-D6kYmnDM_ZLDxmP0Vs-WoFFIjU9DcSCuMrzO0hNrqL'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/727069937742381126/knbU2mjp_b5uVKQkeN_B5sKg3_hsXfV_aRn8IiJONiYsiF7QF4MFjkoqynS19nxTSwr3'

SystemAvatar = 'https://wiki.fivem.net/w/images/d/db/FiveM-Wiki.png'

UserAvatar = 'https://i.imgur.com/KIcqSYs.png'

SystemName = 'SYSTEM'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
				   {'/report', '**[report]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/tpm',
					   '/lock',
					   '/engine',
					   '/hood',
					   '/CASH',
					   '/cash',
					   '/noclip',
					   '/cords',
					   '/admin',
					   '/car',
					   '/bank',
					   '/dv',
					   '/rdoors',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

