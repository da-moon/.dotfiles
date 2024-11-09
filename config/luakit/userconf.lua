local window = require "window"
-- window.add_signal("init", function (w)
--     w.win.fullscreen = true
-- end)

local settings = require "settings"

settings.application.prefer_dark_mode = true
settings.session.always_save = true

-- settings.window.home_page = "https://luakit.github.io"
settings.window.home_page = "https://www.perplexity.ai"

settings.webview.zoom_level = 100
settings.webview.hardware_acceleration_policy = "never"
settings.webview.enable_smooth_scrolling = true

local engines = settings.window.search_engines
engines.aur = "https://aur.archlinux.org/packages?O=0&K=%s"
engines.aw = "https://wiki.archlinux.org/index.php/Special:Search?fulltext=Search&search=%s"
engines.google = "https://www.google.com/search?name=f&hl=en&q=%s"
engines.default = engines.google


----------------------------------
-- Downloads
----------------------------------
-- Add download support
local downloads = require("downloads")
require("downloads_chrome")

-- Set download location
downloads.default_dir = os.getenv("HOME") .. "/Downloads"
downloads.add_signal("download-location", function(uri, file)
	if not file or file == "" then
		file = (
			string.match(uri, "/([^/]+)$")
			or string.match(uri, "^%w+://(.+)")
			or string.gsub(uri, "/", "_")
			or "untitled"
		)
	end
	return downloads.default_dir .. "/" .. file
end)

local modes = require "modes"

modes.add_binds("all", {
	{ "<Scroll>", "Scroll the page using the mouse wheel.", function (w, o)
			local scroll_step = settings.get_setting("window.scroll_step")
			w:scroll { yrel = scroll_step * o.dy * 3 }
	end },
})

-- Load the necessary modules
local webview = require "webview"
-- require("adblock_chrome")
