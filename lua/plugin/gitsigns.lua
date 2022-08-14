local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then return end

gitsigns.setup {
    signs = {
        add = {
            hl = "GitSignsAdd",
            text = "▎",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn"
        },
        change = {
            hl = "GitSignsChange",
            text = "▎",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn"
        },
        delete = {
            hl = "GitSignsDelete",
            text = "契",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn"
        },
        topdelete = {
            hl = "GitSignsDelete",
            text = "契",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn"
        },
        changedelete = {
            hl = "GitSignsChange",
            text = "▎",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn"
        }
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {interval = 1000, follow_files = true},
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false
    },
    current_line_blame_formatter_opts = {relative_time = false},
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = "shadow",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1
    },
    yadm = {enable = false},
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local opts = { buffer = bufnr }
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      -- Navigation
      map("n", "]c", function()
          if vim.wo.diff then
              return "]c"
          end
          vim.schedule(function()
              gs.next_hunk()
          end)
          return "<Ignore>"
      end, vim.tbl_extend("force", opts, { expr = true }))

      map("n", "[c", function()
          if vim.wo.diff then
              return "[c"
          end
          vim.schedule(function()
              gs.prev_hunk()
          end)
          return "<Ignore>"
      end, vim.tbl_extend("force", opts, { expr = true }))

      -- Actions
      map({ "n", "v" }, "<Leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
      map({ "n", "v" }, "<Leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
      map("n", "<Leader>hS", gs.stage_buffer)
      map("n", "<Leader>hu", gs.undo_stage_hunk)
      map("n", "<Leader>hR", gs.reset_buffer)
      map("n", "<Leader>hp", gs.preview_hunk)
      map("n", "<Leader>hb", function()
          gs.blame_line({ full = true })
      end)
      map("n", "<Leader>tb", gs.toggle_current_line_blame)
      map("n", "<Leader>hd", gs.diffthis)
      map("n", "<Leader>hD", function()
          gs.diffthis("~")
      end)
      map("n", "<Leader>td", gs.toggle_deleted)

      -- Text object
      map({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>")
    end,
}
