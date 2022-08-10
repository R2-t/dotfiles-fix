local dap = require("dap")
local dapui = require("dapui")

dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/vscode-node-debug2/out/src/nodeDebug.js" },
}
dap.configurations.typescript = {
    {
        type = "node2",
        request = "attach",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        skipFiles = { "<node_internals>/**/*.js" },
        port = 9229,
    },
}

dapui.setup({
    layouts = {
        {
            elements = {
                "scopes",
                "breakpoints",
            },
            position = "left",
            size = 40,
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "rounded", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "WarningMsg", linehl = "", numhl = "" })
