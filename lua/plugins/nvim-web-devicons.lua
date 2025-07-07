local override = {}

return {
	"nvim-tree/nvim-web-devicons",
	opts = {
		override = override,
	},
	config = function(opts)
		local icons = require("nvim-web-devicons")

		local karma = {
			icon = "",
			color = "#87875f",
			cterm_color = "107",
			name = "KarmaConfig",
		}

		local routes = {
			icon = "󰑪",
			color = "#5fffff",
			cterm_color = "87",
			name = "RouteConfig",
		}

		icons.set_icon({
			["app.config.ts"] = {
				icon = "",
				color = "#af00af",
				cterm_color = "127",
				name = "AngularAppConfig",
			},
			["component.ts"] = {
				icon = "",
				color = "#0087ff",
				cterm_color = "33",
				name = "AngularComponent",
			},
			["service.ts"] = {
				icon = "",
				color = "#ffdf00",
				cterm_color = "220",
				name = "AngularService",
			},
			["guard.ts"] = {
				icon = "",
				color = "#87ff00",
				cterm_color = "118",
				name = "AngularGuard",
			},
			["routes.ts"] = routes,
			["route.ts"] = routes,
			["karma.conf.js"] = karma,
			["karma.conf.ci.js"] = karma,
			["project.json"] = {
				icon = "",
				color = "#eeeeee",
				cterm_color = "255",
				name = "NxProject",
			},
		})
	end,
}
