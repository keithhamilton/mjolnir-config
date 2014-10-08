
local application = require "mjolnir.application"
local alert = require "mjolnir.alert"
local grid = require "mjolnir.sd.grid"
local fnutils = require "mjolnir.fnutils"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"

alert.show("Only He who is worthy may lift Mjolnir.")

local apps = { 
    chrome = "-a Google\\ Chrome.app",
    calc = 'Calculator',
    charles = 'Charles',
    dict = 'Dictionary',
    finder = 'Finder',
    github = 'https://github.com/wieden-kennedy',
    indesign = "Adobe\\ InDesign\\ CC",
    illustrator = "Adobe\\ Illustrator",
    idea = '-a IntelliJ\\ IDEA\\ 13.app',
    keepass = 'KeePassX',
    mail = 'AirMail',
    omnigraffle = 'OmniGraffle',
    photoshop = "Adobe\\ Photoshop\\ CC",
    spotify = 'Spotify',
    sublime = '-a Sublime\\ Text\\ 2.app',
    term = 'iTerm'

}


local mash = {"cmd", "alt", "ctrl"}
local halfmash = {'cmd','ctrl'}
local mashshift = {"cmd", "ctrl", "shift"}

local adobe = {"ctrl","alt"}

local function open_os(key)
    os.execute('open ' .. key)
end

local function open_hydra(key)
    application.launchorfocus(key)
end

local function onepass()
    # insert path to .1p
    os.execute('cat /path/to/.1p | tr -d "\n" | pbcopy')
    os.execute('open -a 1Password\\ 4.app')
end

--
local function aura_time()
    os.execute('open https://aura.mediaocean.com/viewport-home/#osAppId=rod-time&osPspId=rod-time')
    keepass()
end
--
local function wk_projects()
    os.execute('open file:///Users/keith.hamilton/src/github.com/wieden-kennedy')
end
--
--
--
-- 
-- custom launching
hotkey.bind(halfmash,'=', function() open_hydra(apps.calc) end)
hotkey.bind(halfmash, 'C', function() open_hydra(apps.charles) end)
hotkey.bind(halfmash, 'D', function() open_hydra(apps.dict) end)
hotkey.bind(halfmash,'F', function() open_hydra(apps.finder) end)
hotkey.bind(halfmash,'G', function() open_os(apps.chrome) end)
hotkey.bind(mash,'G', function() open_os(apps.github) end)
hotkey.bind(halfmash, 'J', function() open_os(apps.idea) end)
hotkey.bind(halfmash,'M', function() open_hydra(apps.mail) end)
hotkey.bind(halfmash, 'O', function() open_hydra(apps.omnigraffle) end)
hotkey.bind(halfmash, 'P', function() onepass() end)
hotkey.bind(halfmash,'space', function() open_hydra(apps.term) end)
hotkey.bind(halfmash,'S', function() open_hydra(apps.spotify) end)
hotkey.bind(halfmash, 'T', function() aura_time() end)
hotkey.bind(halfmash,'X', function() open_os(apps.sublime) end)
hotkey.bind(halfmash, 'W', function() wk_projects() end)

hotkey.bind(adobe,"D", function() open_hydra(apps.indesign) end)
hotkey.bind(adobe,"I", function() open_hydra(apps.illustrator) end)
hotkey.bind(adobe,"P", function() open_hydra(apps.photoshop) end)
--

hotkey.bind(mash, ';', function() grid.snap(window.focusedwindow()) end)
hotkey.bind(mash, "'", function() fnutils.map(window.visiblewindows(), ext.grid.snap) end)

hotkey.bind(mash, '=', function() grid.adjustwidth( 1) end)
hotkey.bind(mash, '-', function() grid.adjustwidth(-1) end)

hotkey.bind(mashshift, 'H', function() window.focusedwindow():focuswindow_west() end)
hotkey.bind(mashshift, 'L', function() window.focusedwindow():focuswindow_east() end)
hotkey.bind(mashshift, 'K', function() window.focusedwindow():focuswindow_north() end)
hotkey.bind(mashshift, 'J', function() window.focusedwindow():focuswindow_south() end)

hotkey.bind(mash, 'M', grid.maximize_window)

hotkey.bind(mash, 'N', grid.pushwindow_nextscreen)
hotkey.bind(mash, 'P', grid.pushwindow_prevscreen)

hotkey.bind(mash, 'J', grid.pushwindow_down)
hotkey.bind(mash, 'K', grid.pushwindow_up)
hotkey.bind(mash, 'H', grid.pushwindow_left)
hotkey.bind(mash, 'L', grid.pushwindow_right)

hotkey.bind(mash, 'U', grid.resizewindow_taller)
hotkey.bind(mash, 'O', grid.resizewindow_wider)
hotkey.bind(mash, 'I', grid.resizewindow_thinner)


