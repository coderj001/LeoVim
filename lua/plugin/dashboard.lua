vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {
[[                                  ,@@@@@@,                            ]],
[[                          ,@@@@@@@@@@@@/  .@@@@/                      ]],
[[.        .        .@@@@@@@@(,,,/@@@@@% %@@@@@  .@@@@                  ]],
[[  @@   .@@.       ..  @@@@@@&*....*&@@@  @@% @@ @@@@@*@               ]],
[[     @@@@@@@@%&@@@@@@@@@@@@  @@@@@@@@@@      @@ /@@@@@@,@             ]],
[[    @    @@@@@@@@@@@@@@@@@@*    @@@@@@@ @@@@@@@.@@@@@@@@ @@@          ]],
[[      %@@@@*          ,( @@@/    *@@@@@@@@@@@@  &  @@@@@@ @@          ]],
[[       @@@@@@@@@@* #@@@@   @@@@  (@@@* @& @@@&.   @@@  .@@@@          ]],
[[         @@@@@@@@@@@@  *@@@./@@@@@@@@@#  @@@  %@@@@@@@@    @@         ]],
[[            @@@@@@@  @@@@@@@@@@@@@@@@@@@@@   *@@             @@       ]],
[[          @@ #@@@ *@@@@@@   *@@@@   (@@@@  @@@@      .@@@@@@@@@@@&    ]],
[[        .@ (@@@@ @@@@@.   @@@@   @@@,    %@                        @  ]],
[[        @ @@@@@@@@@@#   @@@@   *@@@@   @@                @      @@@@@ ]],
[[         &@@ @@@@@@   ,@@@@    @@@@   @.   @@            @/@#     (   ]],
[[         @# @(@@@@   (@@@@@    @@@@  *@ @@@@@@&         &@@@@@@@@     ]],
[[            @@@@@ *  @&@@@#    @@@@  &(@@@@@@@@@ @@ @@@     @,.       ]],
[[            @@ @@.% @@ @@@&  @ @@@@@  @@@@@@@@@@@@ @@@&               ]],
[[            *@ @@@, @( @@@@  @@ @@@@@(&@@@@    %@  @@@.               ]],
[[             / @@@@ @  @@@@  @@@ @@@/@@@@        . @@@@@,             ]],
[[                @@@ ,. @@@ @ %@@@.@@@ @@@,                            ]],
[[                 @@@   .@@ @@ @@@@@%@@   @@                           ]],
[[                   @@   /@@ @@@@@ @@@@@                               ]],
[[                     @#   @@ ,@@@@. @@@@@                             ]],
[[                           ,@  @@@@@  @@@@@                           ]],
[[                              &  @@@#@   @@@@@                        ]],
[[                                    @@       *@@@&                    ]],
[[                                       &.                             ]],
}
vim.g.dashboard_custom_section = {
  a = {description = {'  New File           '}, command = ':ene!'},
  b = {description = {'  Colorscheme        '}, command = 'Telescope colorscheme'},
  c = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
  d = {description = {'  Configuration      '}, command = 'edit ~/.config/nvim/init.lua'},
}
vim.g.dashboard_custom_footer = {'leovim'}
vim.g.dashboard_preview_file_height = 12
vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_footer_icon = "ﬦ "
