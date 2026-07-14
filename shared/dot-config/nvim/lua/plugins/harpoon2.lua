---@type LazyPluginSpec
return {
  "eloraju/harpoon",
  branch = "harpoon2-tweaks",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 10,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    harpoon:extend({
      UI_CREATE = function(ctx)
        vim.keymap.set("n", "<S-L>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buf = ctx.bufnr })
        vim.keymap.set("n", "<S-J>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buf = ctx.bufnr })
      end,
    })
  end,
  keys = function()
    local harpoon = require("harpoon")
    ---@type LazyKeysSpec[]
    local keys = {
      {
        "<leader>a",
        function()
          local alread_harpooned = harpoon:list():get_item()
          if not alread_harpooned then
            harpoon:list():add()
            local repo_root = require("jutils").get_repo_root()
            local file = vim.fn.expand("%")
            if repo_root then
              file = file:gsub(repo_root, "")
            end
            vim.notify('"' .. file .. '"' .. " harpooned", vim.log.levels.INFO)
          else
            local choice = vim.fn.confirm("file already harpooned, remove?\n", "&yes\n&no", 2, "Warning")
            if choice == 1 then
              harpoon:list():remove(alread_harpooned)
              vim.notify("file released", vim.log.levels.INFO)
            end
          end
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>h",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<C-S-P>",
        function()
          harpoon:list():prev({ ui_nav_wrap = true })
        end,
        desc = "Harpoon previous file",
      },
      {
        "<C-S-N>",
        function()
          harpoon:list():next({ ui_nav_wrap = true })
        end,
        desc = "Harpoon next file",
      },
    }

    for i = 1, 9 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          harpoon:list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
