require("mason").setup()
require("mason-lspconfig").setup()

local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
	return
end

local handlers = require("user.lsp.handlers")

local function add_opts(opts)
	opts["on_attach"] = handlers.on_attach
	opts["capabilities"] = handlers.capabilities
	return opts
end

local default_opts = add_opts({})

-- Sumenko Lua
local sumneko_lua_opts = add_opts(require("user.lsp.settings.sumneko_lua"))
lsp_config.lua_ls.setup(sumneko_lua_opts)

-- Jsonls
local jsonls = add_opts(require("user.lsp.settings.jsonls"))
lsp_config.jsonls.setup(jsonls)

-- Tsserver
lsp_config.tsserver.setup(default_opts)

-- OmniSharp
local omnisharp_opts = add_opts(require("user.lsp.settings.omnisharp"))
lsp_config.omnisharp_mono.setup(omnisharp_opts)

-- RustAnalyzer
local rust_analyzer_opts = add_opts(require("user.lsp.settings.rust_analyzer"))
lsp_config.rust_analyzer.setup(rust_analyzer_opts)

-- Powershell
local pwsh_opts = add_opts({
	cmd = { "pwsh",
		"-NoLogo",
		"-NoProfile",
		"-Command",
		"C:/Users/dmeyer.CCL/AppData/Local/nvim-data/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1",
		"-BundledModulesPath",
		"C:/Users/dmeyer.CCL/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
		"-LogPath",
		"C:/Users/dmeyer.CCL/AppData/Local/Temp/nvim/powershell_es.log",
		"-SessionDetailsPath",
		"C:/Users/dmeyer.CCL/AppData/Local/Temp/nvim/powershell_es.session.json",
		"-AdditionalModules",
		"@('PSScriptAnalyzer')",
		"-HostName",
		"nvim",
		"-HostProfileId",
		"0",
		"-HostVersion",
		"1.0.0",
		"-Stdio",
		"-LogLevel",
		"Normal"
	}
})
lsp_config.powershell_es.setup(pwsh_opts)

-- Azure Pipelines
local azure_pipeline_opts = add_opts({
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
					"/azure-pipeline*.y*l",
					"/*.azure*",
					"Azure-Pipelines/**/*.y*l",
					"Pipelines/*.y*l",
					"*pipeline*/*.y*l"
				},
			},
		},
	},
})
lsp_config.azure_pipelines_ls.setup(azure_pipeline_opts)

local angularls_opts = add_opts({
	root_dir = lsp_config.util.root_pattern("angular.json", "nx.json")
})
lsp_config.angularls.setup(angularls_opts)

lsp_config.pylsp.setup(add_opts({
	settings = {
		pylsp = {
			plugins = {
				yapf = { enabled = true }
			}
		}
	}
}))

lsp_config.bicep.setup(default_opts)

lsp_config.cssls.setup(default_opts)
