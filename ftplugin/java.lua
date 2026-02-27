local home = os.getenv 'HOME'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.cache/jdtls/workspace/' .. project_name

local config = {
  cmd = {
    'jdtls',
    '-data',
    workspace_dir, -- This is the magic line that gives it "memory"
  },
  root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' },
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' }, -- Better decompilation
      completion = {
        favoriteStaticMembers = {},
      },
    },
  },
}

-- Start the specialized Java engine
require('jdtls').start_or_attach(config)
