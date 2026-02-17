local handlers = require("user.lsp.handlers")

local function add_opts(opts)
  opts["on_attach"] = handlers.on_attach
  opts["capabilities"] = handlers.capabilities
  return opts
end

local function setup_language(name, opts)
  vim.lsp.config[name] = opts;
  vim.lsp.enable(name);
end

local default_opts = add_opts({})

-- Sumenko Lua
local sumneko_lua_opts = add_opts(require("user.lsp.settings.sumneko_lua"))
setup_language("lua_ls", sumneko_lua_opts)


-- -- Jsonls
local jsonls = add_opts(require("user.lsp.settings.jsonls"))
setup_language("jsonls", jsonls)

-- -- Tsserver
setup_language("ts_ls", default_opts)

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
          "*pipeline*/*.y*l",
          "Auth0Settings/auth0-release-pipeline.yml"
        },
      },
    },
  },
  root_markers = { "*.sln", "azyre-pipelines.yml", ".git" }
})
setup_language("azure_pipelines_ls", azure_pipeline_opts)

-- Angular
local angularls_opts = add_opts({
  root_markers = { "angular.json", "nx.json" }
})
setup_language("angularls", angularls_opts)

setup_language("bicep", default_opts)

setup_language("cssls", default_opts)

local html_opts = add_opts({
  filtypes = { "html", "templ", "razor" }
})
setup_language("html", html_opts)
