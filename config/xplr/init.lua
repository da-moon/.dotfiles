version = "1.0.0"
local xplr = xplr -- The globally exposed configuration to be overridden.

local home = os.getenv("HOME")
package.path = home
.. "/.config/xplr/plugins/?/init.lua;"
.. home
.. "/.config/xplr/plugins/?.lua;"
.. package.path

local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"
package.path = package.path
  .. ";"
  .. xpm_path
  .. "/?.lua;"
  .. xpm_path
  .. "/?/init.lua"

xplr.config.general.disable_debug_error_mode = false
xplr.config.general.enable_mouse = false
xplr.config.general.show_hidden = false
xplr.config.general.read_only = false
xplr.config.general.enable_recover_mode = false
xplr.config.general.hide_remaps_in_help_menu = false
xplr.config.general.enforce_bounded_index_navigation = false
xplr.config.general.prompt.format = "❯ "
xplr.config.general.prompt.style = {}
xplr.config.general.logs.info.format = "INFO"
xplr.config.general.logs.info.style = { fg = "LightBlue" }
xplr.config.general.logs.success.format = "SUCCESS"
xplr.config.general.logs.success.style = { fg = "Green" }
xplr.config.general.logs.warning.format = "WARNING"
xplr.config.general.logs.warning.style = { fg = "Yellow" }
xplr.config.general.logs.error.format = "ERROR"
xplr.config.general.logs.error.style = { fg = "Red" }
xplr.config.general.table.header.cols = {
  { format = " index", style = {} },
  { format = "╭─── path", style = {} },
  { format = "perm", style = {} },
  { format = "size", style = {} },
  { format = "modified", style = {} },
}
xplr.config.general.table.header.style = {}
xplr.config.general.table.header.height = 1
xplr.config.general.table.row.cols = {
  {
    format = "builtin.fmt_general_table_row_cols_0",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_1",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_2",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_3",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_4",
    style = {},
  },
}
xplr.config.general.table.row.style = {}
xplr.config.general.table.row.height = 0
xplr.config.general.table.style = {}
xplr.config.general.table.tree = {
  { format = "├", style = {} },
  { format = "├", style = {} },
  { format = "╰", style = {} },
}
xplr.config.general.table.col_spacing = 1
xplr.config.general.table.col_widths = {
  { Percentage = 10 },
  { Percentage = 50 },
  { Percentage = 10 },
  { Percentage = 10 },
  { Percentage = 20 },
}
xplr.config.general.selection.item.format = "builtin.fmt_general_selection_item"
xplr.config.general.selection.item.style = {}
xplr.config.general.search.algorithm = "Fuzzy"
xplr.config.general.search.unordered = false
xplr.config.general.default_ui.prefix = "  "
xplr.config.general.default_ui.suffix = ""
xplr.config.general.default_ui.style = {}
xplr.config.general.focus_ui.prefix = "▸["
xplr.config.general.focus_ui.suffix = "]"
xplr.config.general.focus_ui.style = { add_modifiers = { "Bold" } }
xplr.config.general.selection_ui.prefix = " {"
xplr.config.general.selection_ui.suffix = "}"
xplr.config.general.selection_ui.style = {
  fg = "DarkGray",
  add_modifiers = { "CrossedOut" },
}
xplr.config.general.focus_selection_ui.prefix = "▸["
xplr.config.general.focus_selection_ui.suffix = "]"
xplr.config.general.focus_selection_ui.style = {
  add_modifiers = { "Bold", "CrossedOut" },
}
xplr.config.general.sort_and_filter_ui.separator.format = " › "
xplr.config.general.sort_and_filter_ui.separator.style = {
  add_modifiers = { "Dim" },
}
xplr.config.general.sort_and_filter_ui.default_identifier.format = nil
xplr.config.general.sort_and_filter_ui.default_identifier.style = {}
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.forward.format = "↓"
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.forward.style = nil
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.reverse.format = "↑"
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.reverse.style = nil
xplr.config.general.sort_and_filter_ui.sorter_identifiers = {
  ByExtension = { format = "ext", style = {} },
  ByICanonicalAbsolutePath = { format = "[ci]abs", style = {} },
  ByIRelativePath = { format = "[i]rel", style = {} },
  ByISymlinkAbsolutePath = { format = "[si]abs", style = {} },
  ByIsBroken = { format = "⨯", style = {} },
  ByIsDir = { format = "dir", style = {} },
  ByIsFile = { format = "file", style = {} },
  ByIsReadonly = { format = "ro", style = {} },
  ByIsSymlink = { format = "sym", style = {} },
  ByMimeEssence = { format = "mime", style = {} },
  ByRelativePath = { format = "rel", style = {} },
  BySize = { format = "size", style = {} },
  ByCreated = { format = "created", style = {} },
  ByLastModified = { format = "modified", style = {} },
  ByCanonicalAbsolutePath = { format = "[c]abs", style = {} },
  ByCanonicalExtension = { format = "[c]ext", style = {} },
  ByCanonicalIsDir = { format = "[c]dir", style = {} },
  ByCanonicalIsFile = { format = "[c]file", style = {} },
  ByCanonicalIsReadonly = { format = "[c]ro", style = {} },
  ByCanonicalMimeEssence = { format = "[c]mime", style = {} },
  ByCanonicalSize = { format = "[c]size", style = {} },
  ByCanonicalCreated = { format = "[c]created", style = {} },
  ByCanonicalLastModified = { format = "[c]modified", style = {} },
  BySymlinkAbsolutePath = { format = "[s]abs", style = {} },
  BySymlinkExtension = { format = "[s]ext", style = {} },
  BySymlinkIsDir = { format = "[s]dir", style = {} },
  BySymlinkIsFile = { format = "[s]file", style = {} },
  BySymlinkIsReadonly = { format = "[s]ro", style = {} },
  BySymlinkMimeEssence = { format = "[s]mime", style = {} },
  BySymlinkSize = { format = "[s]size", style = {} },
  BySymlinkCreated = { format = "[s]created", style = {} },
  BySymlinkLastModified = { format = "[s]modified", style = {} },
}
xplr.config.general.sort_and_filter_ui.filter_identifiers = {
  RelativePathDoesContain = { format = "rel=~", style = {} },
  RelativePathDoesEndWith = { format = "rel=$", style = {} },
  RelativePathDoesNotContain = { format = "rel!~", style = {} },
  RelativePathDoesNotEndWith = { format = "rel!$", style = {} },
  RelativePathDoesNotStartWith = { format = "rel!^", style = {} },
  RelativePathDoesStartWith = { format = "rel=^", style = {} },
  RelativePathIs = { format = "rel==", style = {} },
  RelativePathIsNot = { format = "rel!=", style = {} },
  RelativePathDoesMatchRegex = { format = "rel=/", style = {} },
  RelativePathDoesNotMatchRegex = { format = "rel!/", style = {} },
  IRelativePathDoesContain = { format = "[i]rel=~", style = {} },
  IRelativePathDoesEndWith = { format = "[i]rel=$", style = {} },
  IRelativePathDoesNotContain = { format = "[i]rel!~", style = {} },
  IRelativePathDoesNotEndWith = { format = "[i]rel!$", style = {} },
  IRelativePathDoesNotStartWith = { format = "[i]rel!^", style = {} },
  IRelativePathDoesStartWith = { format = "[i]rel=^", style = {} },
  IRelativePathIs = { format = "[i]rel==", style = {} },
  IRelativePathIsNot = { format = "[i]rel!=", style = {} },
  IRelativePathDoesMatchRegex = { format = "[i]rel=/", style = {} },
  IRelativePathDoesNotMatchRegex = { format = "[i]rel!/", style = {} },
  AbsolutePathDoesContain = { format = "abs=~", style = {} },
  AbsolutePathDoesEndWith = { format = "abs=$", style = {} },
  AbsolutePathDoesNotContain = { format = "abs!~", style = {} },
  AbsolutePathDoesNotEndWith = { format = "abs!$", style = {} },
  AbsolutePathDoesNotStartWith = { format = "abs!^", style = {} },
  AbsolutePathDoesStartWith = { format = "abs=^", style = {} },
  AbsolutePathIs = { format = "abs==", style = {} },
  AbsolutePathIsNot = { format = "abs!=", style = {} },
  AbsolutePathDoesMatchRegex = { format = "abs=/", style = {} },
  AbsolutePathDoesNotMatchRegex = { format = "abs!/", style = {} },
  IAbsolutePathDoesContain = { format = "[i]abs=~", style = {} },
  IAbsolutePathDoesEndWith = { format = "[i]abs=$", style = {} },
  IAbsolutePathDoesNotContain = { format = "[i]abs!~", style = {} },
  IAbsolutePathDoesNotEndWith = { format = "[i]abs!$", style = {} },
  IAbsolutePathDoesNotStartWith = { format = "[i]abs!^", style = {} },
  IAbsolutePathDoesStartWith = { format = "[i]abs=^", style = {} },
  IAbsolutePathIs = { format = "[i]abs==", style = {} },
  IAbsolutePathIsNot = { format = "[i]abs!=", style = {} },
  IAbsolutePathDoesMatchRegex = { format = "[i]abs=/", style = {} },
  IAbsolutePathDoesNotMatchRegex = { format = "[i]abs!/", style = {} },
}
xplr.config.general.sort_and_filter_ui.search_identifiers = {
  Fuzzy = { format = "fzy:", style = {} },
  Regex = { format = "reg:", style = {} },
}
xplr.config.general.sort_and_filter_ui.search_direction_identifiers.ordered.format =
  "↓"
xplr.config.general.sort_and_filter_ui.search_direction_identifiers.unordered.format = ""
xplr.config.general.panel_ui.default.title.format = nil
xplr.config.general.panel_ui.default.title.style = {
  fg = "Reset",
  add_modifiers = { "Bold" },
}
xplr.config.general.panel_ui.default.style = {}
xplr.config.general.panel_ui.default.borders = {
  "Top",
  "Right",
  "Bottom",
  "Left",
}
xplr.config.general.panel_ui.default.border_type = "Rounded"
xplr.config.general.panel_ui.default.border_style = { fg = "DarkGray" }
xplr.config.general.panel_ui.table.title.format = nil
xplr.config.general.panel_ui.table.title.style = {}
xplr.config.general.panel_ui.table.style = {}
xplr.config.general.panel_ui.table.borders = nil
xplr.config.general.panel_ui.table.border_type = nil
xplr.config.general.panel_ui.table.border_style = {}
xplr.config.general.panel_ui.help_menu.title.format = nil
xplr.config.general.panel_ui.help_menu.title.style = {}
xplr.config.general.panel_ui.help_menu.style = {}
xplr.config.general.panel_ui.help_menu.borders = nil
xplr.config.general.panel_ui.help_menu.border_type = nil
xplr.config.general.panel_ui.help_menu.border_style = {}
xplr.config.general.panel_ui.input_and_logs.title.format = nil
xplr.config.general.panel_ui.input_and_logs.title.style = {}
xplr.config.general.panel_ui.input_and_logs.style = {}
xplr.config.general.panel_ui.input_and_logs.borders = nil
xplr.config.general.panel_ui.input_and_logs.border_type = nil
xplr.config.general.panel_ui.input_and_logs.border_style = {}
xplr.config.general.panel_ui.selection.title.format = nil
xplr.config.general.panel_ui.selection.title.style = {}
xplr.config.general.panel_ui.selection.style = {}
xplr.config.general.panel_ui.selection.borders = nil
xplr.config.general.panel_ui.selection.border_type = nil
xplr.config.general.panel_ui.selection.border_style = {}
xplr.config.general.panel_ui.sort_and_filter.title.format = nil
xplr.config.general.panel_ui.sort_and_filter.title.style = {}
xplr.config.general.panel_ui.sort_and_filter.style = {}
xplr.config.general.panel_ui.sort_and_filter.borders = nil
xplr.config.general.panel_ui.sort_and_filter.border_type = nil
xplr.config.general.panel_ui.sort_and_filter.border_style = {}
xplr.config.general.initial_sorting = {
  { sorter = "ByCanonicalIsDir", reverse = true },
  { sorter = "ByIRelativePath", reverse = false },
}
xplr.config.general.initial_mode = "default"
xplr.config.general.initial_layout = "default"
xplr.config.general.start_fifo = nil
xplr.config.general.global_key_bindings = {
  on_key = {
    ["esc"] = {
      messages = {
        "PopMode",
      },
    },
    ["ctrl-c"] = {
      messages = {
        "Terminate",
      },
    },
  },
}
xplr.config.node_types.directory.style = {
  fg = "Blue",
}
xplr.config.node_types.directory.meta.icon = "ð"
xplr.config.node_types.file.style = {}
xplr.config.node_types.file.meta.icon = "ƒ"
xplr.config.node_types.symlink.style = {
  fg = "Magenta",
  add_modifiers = { "Italic" },
}
xplr.config.node_types.symlink.meta.icon = "§"
xplr.config.node_types.mime_essence = {}
xplr.config.node_types.extension = {}
xplr.config.node_types.special = {}
xplr.config.layouts.builtin.default = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 70 },
        { Percentage = 30 },
      },
    },
    splits = {
      {
        Vertical = {
          config = {
            constraints = {
              { Length = 3 },
              { Min = 1 },
              { Length = 3 },
            },
          },
          splits = {
            "SortAndFilter",
            "Table",
            "InputAndLogs",
          },
        },
      },
      {
        Vertical = {
          config = {
            constraints = {
              { Percentage = 30 },
              { Percentage = 70 },
            },
          },
          splits = {
            "Selection",
            "HelpMenu",
          },
        },
      },
    },
  },
}
xplr.config.layouts.builtin.no_help = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 70 },
        { Percentage = 30 },
      },
    },
    splits = {
      {
        Vertical = {
          config = {
            constraints = {
              { Length = 3 },
              { Min = 1 },
              { Length = 3 },
            },
          },
          splits = {
            "SortAndFilter",
            "Table",
            "InputAndLogs",
          },
        },
      },
      "Selection",
    },
  },
}
xplr.config.layouts.builtin.no_selection = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 70 },
        { Percentage = 30 },
      },
    },
    splits = {
      {
        Vertical = {
          config = {
            constraints = {
              { Length = 3 },
              { Min = 1 },
              { Length = 3 },
            },
          },
          splits = {
            "SortAndFilter",
            "Table",
            "InputAndLogs",
          },
        },
      },
      "HelpMenu",
    },
  },
}
xplr.config.layouts.builtin.no_help_no_selection = {
  Vertical = {
    config = {
      constraints = {
        { Length = 3 },
        { Min = 1 },
        { Length = 3 },
      },
    },
    splits = {
      "SortAndFilter",
      "Table",
      "InputAndLogs",
    },
  },
}
xplr.config.layouts.custom = {}
xplr.config.modes.builtin.default = {
  name = "default",
  key_bindings = {
    on_key = {
      ["#"] = {
        messages = {
          "PrintAppStateAndQuit",
        },
      },
      ["."] = {
        help = "show hidden",
        messages = {
          {
            ToggleNodeFilter = { filter = "RelativePathDoesNotStartWith", input = "." },
          },
          "ExplorePwdAsync",
        },
      },
      [":"] = {
        help = "action",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "action" },
        },
      },
      ["?"] = {
        help = "global help menu",
        messages = {
          {
            BashExec = [===[
              [ -z "$PAGER" ] && PAGER="less -+F"
              cat -- "${XPLR_PIPE_GLOBAL_HELP_MENU_OUT}" | ${PAGER:?}
            ]===],
          },
        },
      },
      ["G"] = {
        help = "go to bottom",
        messages = {
          "PopMode",
          "FocusLast",
        },
      },
      ["ctrl-a"] = {
        help = "select/unselect all",
        messages = {
          "ToggleSelectAll",
        },
      },
      ["ctrl-f"] = {
        help = "search",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "search" },
          { SetInputBuffer = "" },
        },
      },
      ["ctrl-i"] = {
        help = "next visited path",
        messages = {
          "NextVisitedPath",
        },
      },
      ["ctrl-o"] = {
        help = "last visited path",
        messages = {
          "LastVisitedPath",
        },
      },
      ["ctrl-r"] = {
        help = "refresh screen",
        messages = {
          "ClearScreen",
        },
      },
      ["ctrl-u"] = {
        help = "clear selection",
        messages = {
          "ClearSelection",
        },
      },
      ["ctrl-w"] = {
        help = "switch layout",
        messages = {
          { SwitchModeBuiltin = "switch_layout" },
        },
      },
      ["d"] = {
        help = "delete",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "delete" },
        },
      },
      ["down"] = {
        help = "down",
        messages = {
          "FocusNext",
        },
      },
      ["enter"] = {
        help = "quit with result",
        messages = {
          "PrintResultAndQuit",
        },
      },
      ["f"] = {
        help = "filter",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "filter" },
        },
      },
      ["g"] = {
        help = "go to",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "go_to" },
        },
      },
      ["left"] = {
        help = "back",
        messages = {
          "Back",
        },
      },
      ["q"] = {
        help = "quit",
        messages = {
          "Quit",
        },
      },
      ["r"] = {
        help = "rename",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "rename" },
          {
            BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
          },
        },
      },
      ["ctrl-d"] = {
        help = "duplicate as",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "duplicate_as" },
          {
            BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
          },
        },
      },
      ["right"] = {
        help = "enter",
        messages = {
          "Enter",
        },
      },
      ["s"] = {
        help = "sort",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "sort" },
        },
      },
      ["space"] = {
        help = "toggle selection",
        messages = {
          "ToggleSelection",
          "FocusNext",
        },
      },
      ["up"] = {
        help = "up",
        messages = {
          "FocusPrevious",
        },
      },
      ["~"] = {
        help = "go home",
        messages = {
          {
            BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${HOME:?}"
            ]===],
          },
        },
      },
      ["page-up"] = {
        help = "scroll up",
        messages = {
          "ScrollUp",
        },
      },
      ["page-down"] = {
        help = "scroll down",
        messages = {
          "ScrollDown",
        },
      },
      ["{"] = {
        help = "scroll up half",
        messages = {
          "ScrollUpHalf",
        },
      },
      ["}"] = {
        help = "scroll down half",
        messages = {
          "ScrollDownHalf",
        },
      },
      ["ctrl-n"] = {
        help = "next selection",
        messages = {
          "FocusNextSelection",
        },
      },
      ["ctrl-p"] = {
        help = "prev selection",
        messages = {
          "FocusPreviousSelection",
        },
      },
    },
    on_number = {
      help = "input",
      messages = {
        "PopMode",
        { SwitchModeBuiltin = "number" },
        "BufferInputFromKey",
      },
    },
  },
}
xplr.config.modes.builtin.default.key_bindings.on_key["v"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["space"]
xplr.config.modes.builtin.default.key_bindings.on_key["V"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-a"]
xplr.config.modes.builtin.default.key_bindings.on_key["/"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-f"]
xplr.config.modes.builtin.default.key_bindings.on_key["h"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["left"]
xplr.config.modes.builtin.default.key_bindings.on_key["j"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["down"]
xplr.config.modes.builtin.default.key_bindings.on_key["k"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["up"]
xplr.config.modes.builtin.default.key_bindings.on_key["l"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["right"]
xplr.config.modes.builtin.default.key_bindings.on_key["tab"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-i"] -- compatibility workaround
xplr.config.modes.builtin.debug_error = {
  name = "debug error",
  layout = {
    Vertical = {
      config = {
        constraints = {
          { Min = 14 },
          { MinLessThanScreenHeight = 14 },
        },
      },
      splits = {
        {
          Static = {
            CustomParagraph = {
              ui = { title = { format = "debug error" } },
              body = [[
  Some errors occurred during startup.
  If you think this is a bug, please report it at:
  https://github.com/sayanarijit/xplr/issues/new
  Press `enter` to open the logs in your $EDITOR.
  Press `escape` to ignore the errors and continue with the default config.
  To disable this mode, set `xplr.config.general.disable_debug_error_mode`
  to `true` in your config file.
              ]],
            },
          },
        },
        "InputAndLogs",
      },
    },
  },
  key_bindings = {
    on_key = {
      ["enter"] = {
        help = "open logs in editor",
        messages = {
          {
            BashExec = [===[
              cat "${XPLR_PIPE_LOGS_OUT:?}" | ${EDITOR:-vi} -
            ]===],
          },
        },
      },
      ["q"] = {
        help = "quit",
        messages = {
          "Quit",
        },
      },
    },
    default = {
      messages = {},
    },
  },
}
xplr.config.modes.builtin.recover = {
  name = "recover",
  layout = {
    Static = {
      CustomParagraph = {
        ui = { title = { format = "recover" } },
        body = [[
  You pressed an invalid key and went into "recover" mode.
  This mode saves you from performing unwanted actions.
  Let's calm down, press `escape`, and try again.
  To disable this mode, set `xplr.config.general.enable_recover_mode`
  to `false` in your config file.
        ]],
      },
    },
  },
  key_bindings = {
    default = {
      messages = {},
    },
  },
}
xplr.config.modes.builtin.go_to_path = {
  name = "go to path",
  key_bindings = {
    on_key = {
      ["enter"] = {
        help = "submit",
        messages = {
          {
            BashExecSilently0 = [===[
              PTH="$XPLR_INPUT_BUFFER"
              PTH_ESC=$(printf %q "$PTH")
              if [ -d "$PTH" ]; then
                "$XPLR" -m 'ChangeDirectory: %q' "$PTH"
              elif [ -e "$PTH" ]; then
                "$XPLR" -m 'FocusPath: %q' "$PTH"
              else
                "$XPLR" -m 'LogError: %q' "could not find $PTH_ESC"
              fi
            ]===],
          },
          "PopMode",
        },
      },
      ["tab"] = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}
xplr.config.modes.builtin.selection_ops = {
  name = "selection ops",
  layout = "HelpMenu",
  key_bindings = {
    on_key = {
      ["e"] = {
        help = "edit selection",
        messages = {
          {
            BashExec0 = [===[
              TMPFILE="$(mktemp)"
              (while IFS= read -r -d '' PTH; do
                echo $(printf %q "${PTH:?}") >> "${TMPFILE:?}"
              done < "${XPLR_PIPE_SELECTION_OUT:?}")
              ${EDITOR:-vi} "${TMPFILE:?}"
              [ ! -e "$TMPFILE" ] && exit
              "$XPLR" -m ClearSelection
              (while IFS= read -r PTH_ESC; do
                "$XPLR" -m 'SelectPath: %q' "$(eval printf %s ${PTH_ESC:?})"
              done < "${TMPFILE:?}")
              rm -- "${TMPFILE:?}"
            ]===],
          },
          "PopMode",
        },
      },
      ["l"] = {
        help = "list selection",
        messages = {
          {
            BashExec0 = [===[
              [ -z "$PAGER" ] && PAGER="less -+F"
              while IFS= read -r -d '' PTH; do
                echo $(printf %q "$PTH")
              done < "${XPLR_PIPE_SELECTION_OUT:?}" | ${PAGER:?}
            ]===],
          },
          "PopMode",
        },
      },
      ["c"] = {
        help = "copy here",
        messages = {
          {
            BashExec0 = [===[
              "$XPLR" -m ExplorePwd
              (while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                BASENAME=$(basename -- "$PTH")
                BASENAME_ESC=$(printf %q "$BASENAME")
                while [ -e "$BASENAME" ]; do
                  BASENAME="$BASENAME (copied)"
                  BASENAME_ESC=$(printf %q "$BASENAME")
                done
                if cp -vr -- "${PTH:?}" "./${BASENAME:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC copied to ./$BASENAME_ESC"
                  "$XPLR" -m 'FocusPath: %q' "$BASENAME"
                else
                  "$XPLR" -m 'LogError: %q' "could not copy $PTH_ESC to ./$BASENAME_ESC"
                fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}")
              read -p "[enter to continue]"
            ]===],
          },
          "PopMode",
        },
      },
      ["m"] = {
        help = "move here",
        messages = {
          {
            BashExec0 = [===[
              "$XPLR" -m ExplorePwd
              (while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                BASENAME=$(basename -- "$PTH")
                BASENAME_ESC=$(printf %q "$BASENAME")
                while [ -e "$BASENAME" ]; do
                  BASENAME="$BASENAME (moved)"
                  BASENAME_ESC=$(printf %q "$BASENAME")
                done
                if mv -v -- "${PTH:?}" "./${BASENAME:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC moved to ./$BASENAME_ESC"
                  "$XPLR" -m 'FocusPath: %q' "$BASENAME"
                else
                  "$XPLR" -m 'LogError: %q' "could not move $PTH_ESC to ./$BASENAME_ESC"
                fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}")
              read -p "[enter to continue]"
            ]===],
          },
          "PopMode",
        },
      },
      ["s"] = {
        help = "softlink here",
        messages = {
          {
            BashExec0 = [===[
              "$XPLR" -m ExplorePwd
              (while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                BASENAME=$(basename -- "$PTH")
                BASENAME_ESC=$(printf %q "$BASENAME")
                while [ -e "$BASENAME" ]; do
                  BASENAME="$BASENAME (softlinked)"
                  BASENAME_ESC=$(printf %q "$BASENAME")
                done
                if ln -sv -- "${PTH:?}" "./${BASENAME:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC softlinked as ./$BASENAME_ESC"
                  "$XPLR" -m 'FocusPath: %q' "$BASENAME"
                else
                  "$XPLR" -m 'LogError: %q' "could not softlink $PTH_ESC as ./$BASENAME_ESC"
                fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}")
              read -p "[enter to continue]"
            ]===],
          },
          "PopMode",
        },
      },
      ["h"] = {
        help = "hardlink here",
        messages = {
          {
            BashExec0 = [===[
              "$XPLR" -m ExplorePwd
              (while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                BASENAME=$(basename -- "$PTH")
                BASENAME_ESC=$(printf %q "$BASENAME")
                while [ -e "$BASENAME" ]; do
                  BASENAME="$BASENAME (hardlinked)"
                  BASENAME_ESC=$(printf %q "$BASENAME")
                done
                if ln -v -- "${PTH:?}" "./${BASENAME:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC hardlinked as ./$BASENAME_ESC"
                  "$XPLR" -m 'FocusPath: %q' "$BASENAME"
                else
                  "$XPLR" -m 'LogError: %q' "could not hardlink $PTH_ESC as ./$BASENAME_ESC"
                fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}")
              read -p "[enter to continue]"
            ]===],
          },
          "PopMode",
        },
      },
      ["u"] = {
        help = "clear selection",
        messages = {
          "ClearSelection",
          "PopMode",
        },
      },
    },
  },
}
xplr.config.modes.builtin.create = {
  name = "create",
  layout = "HelpMenu",
  key_bindings = {
    on_key = {
      ["d"] = {
        help = "create directory",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "create_directory" },
          { SetInputBuffer = "" },
        },
      },
      ["f"] = {
        help = "create file",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "create_file" },
          { SetInputBuffer = "" },
        },
      },
    },
  },
}
xplr.config.modes.builtin.create_directory = {
  name = "create directory",
  prompt = "ð ❯ ",
  key_bindings = {
    on_key = {
      ["tab"] = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
      ["enter"] = {
        help = "submit",
        messages = {
          {
            BashExecSilently0 = [===[
              PTH="$XPLR_INPUT_BUFFER"
              PTH_ESC=$(printf %q "$PTH")
              if [ "$PTH" ]; then
                mkdir -p -- "$PTH" \
                && "$XPLR" -m 'SetInputBuffer: ""' \
                && "$XPLR" -m ExplorePwd \
                && "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC created" \
                && "$XPLR" -m 'FocusPath: %q' "$PTH"
              else
                "$XPLR" -m PopMode
              fi
            ]===],
          },
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}
xplr.config.modes.builtin.create_file = {
  name = "create file",
  prompt = "ƒ ❯ ",
  key_bindings = {
    on_key = {
      ["tab"] = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
      ["enter"] = {
        help = "submit",
        messages = {
          {
            BashExecSilently0 = [===[
              PTH="$XPLR_INPUT_BUFFER"
              PTH_ESC=$(printf %q "$PTH")
              if [ "$PTH" ]; then
                mkdir -p -- "$(dirname $(realpath -m $PTH))"  # This may fail.
                touch -- "$PTH" \
                && "$XPLR" -m 'SetInputBuffer: ""' \
                && "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC created" \
                && "$XPLR" -m 'ExplorePwd' \
                && "$XPLR" -m 'FocusPath: %q' "$PTH"
              else
                "$XPLR" -m PopMode
              fi
            ]===],
          },
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}
xplr.config.modes.builtin.number = {
  name = "number",
  prompt = ":",
  key_bindings = {
    on_key = {
      ["down"] = {
        help = "to down",
        messages = {
          "FocusNextByRelativeIndexFromInput",
          "PopMode",
        },
      },
      ["enter"] = {
        help = "to index",
        messages = {
          "FocusByIndexFromInput",
          "PopMode",
        },
      },
      ["up"] = {
        help = "to up",
        messages = {
          "FocusPreviousByRelativeIndexFromInput",
          "PopMode",
        },
      },
    },
    on_navigation = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
    on_number = {
      help = "input",
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}
xplr.config.modes.builtin.number.key_bindings.on_key["j"] =
  xplr.config.modes.builtin.number.key_bindings.on_key["down"]
xplr.config.modes.builtin.number.key_bindings.on_key["k"] =
  xplr.config.modes.builtin.number.key_bindings.on_key["up"]
xplr.config.modes.builtin.go_to = {
  name = "go to",
  layout = "HelpMenu",
  key_bindings = {
    on_key = {
      ["f"] = {
        help = "follow symlink",
        messages = {
          "FollowSymlink",
          "PopMode",
        },
      },
      ["g"] = {
        help = "top",
        messages = {
          "FocusFirst",
          "PopMode",
        },
      },
      ["p"] = {
        help = "path",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "go_to_path" },
          { SetInputBuffer = "" },
        },
      },
      ["i"] = {
        help = "initial $PWD",
        messages = {
          "PopMode",
          {
            BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${XPLR_INITIAL_PWD:?}"
            ]===],
          },
        },
      },
      ["x"] = {
        help = "open in gui",
        messages = {
          {
            BashExecSilently0 = [===[
              if [ -z "$OPENER" ]; then
                if command -v xdg-open; then
                  OPENER=xdg-open
                elif command -v open; then
                  OPENER=open
                else
                  "$XPLR" -m 'LogError: %q' "$OPENER not found"
                  exit 1
                fi
              fi
              (while IFS= read -r -d '' PTH; do
                $OPENER "${PTH:?}" > /dev/null 2>&1
              done < "${XPLR_PIPE_RESULT_OUT:?}")
            ]===],
          },
          "ClearScreen",
          "PopMode",
        },
      },
    },
  },
}
xplr.config.modes.builtin.rename = {
  name = "rename",
  key_bindings = {
    on_key = {
      ["tab"] = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
      ["enter"] = {
        help = "submit",
        messages = {
          {
            BashExecSilently0 = [===[
              SRC="${XPLR_FOCUS_PATH:?}"
              SRC_ESC=$(printf %q "$SRC")
              TARGET="${XPLR_INPUT_BUFFER:?}"
              TARGET_ESC=$(printf %q "$TARGET")
              if [ -e "${TARGET:?}" ]; then
                "$XPLR" -m 'LogError: %q' "$TARGET_ESC already exists"
              else
                mv -- "${SRC:?}" "${TARGET:?}" \
                  && "$XPLR" -m ExplorePwd \
                  && "$XPLR" -m 'FocusPath: %q' "$TARGET" \
                  && "$XPLR" -m 'LogSuccess: %q' "$SRC_ESC renamed to $TARGET_ESC"
              fi
            ]===],
          },
          "PopMode",
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}
xplr.config.modes.builtin.duplicate_as = {
  name = "duplicate as",
  key_bindings = {
    on_key = {
      ["tab"] = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
      ["enter"] = {
        help = "submit",
        messages = {
          {
            BashExecSilently0 = [===[
              SRC="${XPLR_FOCUS_PATH:?}"
              SRC_ESC=$(printf %q "$SRC")
              TARGET="${XPLR_INPUT_BUFFER:?}"
              TARGET_ESC=$(printf %q "$TARGET")
              if [ -e "${TARGET:?}" ]; then
                "$XPLR" -m 'LogError: %q' "$TARGET_ESC already exists"
              else
                cp -r -- "${SRC:?}" "${TARGET:?}" \
                  && "$XPLR" -m ExplorePwd \
                  && "$XPLR" -m 'FocusPath: %q' "$TARGET_ESC" \
                  && "$XPLR" -m 'LogSuccess: %q' "$SRC_ESC duplicated as $TARGET_ESC"
              fi
            ]===],
          },
          "PopMode",
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}
xplr.config.modes.builtin.delete = {
  name = "delete",
  layout = "HelpMenu",
  key_bindings = {
    on_key = {
      ["D"] = {
        help = "force delete",
        messages = {
          {
            BashExec0 = [===[
              "$XPLR" -m ExplorePwd
              (while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                if rm -rfv -- "${PTH:?}"; then
                  "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC deleted"
                else
                  "$XPLR" -m 'LogError: %q' "could not delete $PTH_ESC"
                  "$XPLR" -m 'FocusPath: %q' "$PTH"
                fi
              done < "${XPLR_PIPE_RESULT_OUT:?}")
              read -p "[enter to continue]"
            ]===],
          },
          "PopMode",
        },
      },
      ["d"] = {
        help = "delete",
        messages = {
          {
            BashExec0 = [===[
              "$XPLR" -m ExplorePwd
              (while IFS= read -r -d '' PTH; do
                PTH_ESC=$(printf %q "$PTH")
                if [ -d "$PTH" ] && [ ! -L "$PTH" ]; then
                  if rmdir -v -- "${PTH:?}"; then
                    "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC deleted"
                  else
                    "$XPLR" -m 'LogError: %q' "could not delete $PTH_ESC"
                    "$XPLR" -m 'FocusPath: %q' "$PTH"
                  fi
                else
                  if rm -v -- "${PTH:?}"; then
                    "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC deleted"
                  else
                    "$XPLR" -m 'LogError: %q' "could not delete $PTH_ESC"
                    "$XPLR" -m 'FocusPath: %q' "$PTH"
                  fi
                fi
              done < "${XPLR_PIPE_RESULT_OUT:?}")
              read -p "[enter to continue]"
            ]===],
          },
          "PopMode",
        },
      },
    },
  },
}
xplr.config.modes.builtin.action = {
  name = "action to",
  layout = "HelpMenu",
  key_bindings = {
    on_key = {
      ["!"] = {
        help = "shell",
        messages = {
          "PopMode",
          -- { Call0 = { command = os.getenv("SHELL") or "bash", args = { "-i" } } },
          { Call0 = { command = "nu", args = { "-i" } } },
          "ExplorePwdAsync",
        },
      },
      ["c"] = {
        help = "create",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "create" },
        },
      },
      ["e"] = {
        help = "open in editor",
        messages = {
          {
            BashExec0 = [===[
              ${EDITOR:-vi} "${XPLR_FOCUS_PATH:?}"
            ]===],
          },
          "PopMode",
        },
      },
      ["l"] = {
        help = "logs",
        messages = {
          {
            BashExec = [===[
              [ -z "$PAGER" ] && PAGER="less -+F"
              cat -- "${XPLR_PIPE_LOGS_OUT}" | ${PAGER:?}
            ]===],
          },
          "PopMode",
        },
      },
      ["s"] = {
        help = "selection operations",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "selection_ops" },
        },
      },
      ["m"] = {
        help = "toggle mouse",
        messages = {
          "PopMode",
          "ToggleMouse",
        },
      },
      ["p"] = {
        help = "edit permissions",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "edit_permissions" },
          {
            BashExecSilently0 = [===[
              PERM=$(stat -c '%a' -- "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${PERM:?}"
            ]===],
          },
        },
      },
      ["v"] = {
        help = "vroot",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "vroot" },
        },
      },
      ["q"] = {
        help = "quit options",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "quit" },
        },
      },
    },
    on_number = {
      help = "go to index",
      messages = {
        "PopMode",
        { SwitchModeBuiltin = "number" },
        "BufferInputFromKey",
      },
    },
  },
}
xplr.config.modes.builtin.quit = {
  name = "quit",
  layout = "HelpMenu",
  key_bindings = {
    on_key = {
      ["enter"] = {
        help = "just quit",
        messages = {
          "Quit",
        },
      },
      ["p"] = {
        help = "quit printing pwd",
        messages = {
          "PrintPwdAndQuit",
        },
      },
      ["f"] = {
        help = "quit printing focus",
        messages = {
          "PrintFocusPathAndQuit",
        },
      },
      ["s"] = {
        help = "quit printing selection",
        messages = {
          "PrintSelectionAndQuit",
        },
      },
      ["r"] = {
        help = "quit printing result",
        messages = {
          "PrintResultAndQuit",
        },
      },
    },
  },
}
xplr.config.modes.builtin.search = {
  name = "search",
  prompt = "/",
  key_bindings = {
    on_key = {
      ["up"] = {
        help = "up",
        messages = {
          "FocusPrevious",
        },
      },
      ["down"] = {
        help = "down",
        messages = {
          "FocusNext",
        },
      },
      ["ctrl-z"] = {
        help = "toggle ordering",
        messages = {
          "ToggleSearchOrder",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-a"] = {
        help = "toggle search algorithm",
        messages = {
          "ToggleSearchAlgorithm",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-r"] = {
        help = "regex search",
        messages = {
          "SearchRegexFromInput",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-f"] = {
        help = "fuzzy search",
        messages = {
          "SearchFuzzyFromInput",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-s"] = {
        help = "sort (no search order)",
        messages = {
          "DisableSearchOrder",
          "ExplorePwdAsync",
          { SwitchModeBuiltinKeepingInputBuffer = "sort" },
        },
      },
      ["right"] = {
        help = "enter",
        messages = {
          "Enter",
          { SetInputBuffer = "" },
        },
      },
      ["left"] = {
        help = "back",
        messages = {
          "Back",
          { SetInputBuffer = "" },
        },
      },
      ["tab"] = {
        help = "toggle selection",
        messages = {
          "ToggleSelection",
          "FocusNext",
        },
      },
      ["enter"] = {
        help = "submit",
        messages = {
          "AcceptSearch",
          "PopMode",
        },
      },
      ["esc"] = {
        help = "cancel",
        messages = {
          "CancelSearch",
          "PopMode",
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
        "SearchFromInput",
        "ExplorePwdAsync",
      },
    },
  },
}
xplr.config.modes.builtin.search.key_bindings.on_key["ctrl-n"] =
  xplr.config.modes.builtin.search.key_bindings.on_key["down"]
xplr.config.modes.builtin.search.key_bindings.on_key["ctrl-p"] =
  xplr.config.modes.builtin.search.key_bindings.on_key["up"]
xplr.config.modes.builtin.filter = {
  name = "filter",
  key_bindings = {
    on_key = {
      ["r"] = {
        help = "relative path does match regex",
        messages = {
          { SwitchModeBuiltin = "relative_path_does_match_regex" },
          { SetInputBuffer = "" },
          { AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
          "ExplorePwdAsync",
        },
      },
      ["R"] = {
        help = "relative path does not match regex",
        messages = {
          { SwitchModeBuiltin = "relative_path_does_not_match_regex" },
          { SetInputBuffer = "" },
          { AddNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
          "ExplorePwdAsync",
        },
      },
      ["backspace"] = {
        help = "remove last filter",
        messages = {
          "RemoveLastNodeFilter",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-r"] = {
        help = "reset filters",
        messages = {
          "ResetNodeFilters",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-u"] = {
        help = "clear filters",
        messages = {
          "ClearNodeFilters",
          "ExplorePwdAsync",
        },
      },
    },
  },
}
xplr.config.modes.builtin.relative_path_does_match_regex = {
  name = "relative path does match regex",
  prompt = xplr.config.general.sort_and_filter_ui.filter_identifiers.RelativePathDoesMatchRegex.format,
  key_bindings = {
    on_key = {
      ["enter"] = {
        help = "submit",
        messages = {
          "PopMode",
        },
      },
      ["esc"] = {
        messages = {
          { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
          "PopMode",
          "ExplorePwdAsync",
        },
      },
    },
    default = {
      messages = {
        { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
        "UpdateInputBufferFromKey",
        { AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
        "ExplorePwdAsync",
      },
    },
  },
}
xplr.config.modes.builtin.relative_path_does_not_match_regex = {
  name = "relative path does not match regex",
  prompt = xplr.config.general.sort_and_filter_ui.filter_identifiers.RelativePathDoesNotMatchRegex.format,
  key_bindings = {
    on_key = {
      ["enter"] = {
        help = "submit",
        messages = {
          "PopMode",
        },
      },
      ["esc"] = {
        messages = {
          { RemoveNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
          "PopMode",
          "ExplorePwdAsync",
        },
      },
    },
    default = {
      messages = {
        { RemoveNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
        "UpdateInputBufferFromKey",
        { AddNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
        "ExplorePwdAsync",
      },
    },
  },
}
xplr.config.modes.builtin.sort = {
  name = "sort",
  key_bindings = {
    on_key = {
      ["!"] = {
        help = "reverse sorters",
        messages = {
          "ReverseNodeSorters",
          "ExplorePwdAsync",
        },
      },
      ["E"] = {
        help = "by canonical extension reverse",
        messages = {
          { AddNodeSorter = { sorter = "ByCanonicalExtension", reverse = true } },
          "ExplorePwdAsync",
        },
      },
      ["M"] = {
        help = "by canonical mime essence reverse",
        messages = {
          { AddNodeSorter = { sorter = "ByCanonicalMimeEssence", reverse = true } },
          "ExplorePwdAsync",
        },
      },
      ["N"] = {
        help = "by node type reverse",
        messages = {
          { AddNodeSorter = { sorter = "ByCanonicalIsDir", reverse = true } },
          { AddNodeSorter = { sorter = "ByCanonicalIsFile", reverse = true } },
          { AddNodeSorter = { sorter = "ByIsSymlink", reverse = true } },
          "ExplorePwdAsync",
        },
      },
      ["R"] = {
        help = "by relative path reverse",
        messages = {
          { AddNodeSorter = { sorter = "ByIRelativePath", reverse = true } },
          "ExplorePwdAsync",
        },
      },
      ["S"] = {
        help = "by size reverse",
        messages = {
          { AddNodeSorter = { sorter = "BySize", reverse = true } },
          "ExplorePwdAsync",
        },
      },
      ["backspace"] = {
        help = "remove last sorter",
        messages = {
          "RemoveLastNodeSorter",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-r"] = {
        help = "reset sorters",
        messages = {
          "ResetNodeSorters",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-u"] = {
        help = "clear sorters",
        messages = {
          "ClearNodeSorters",
          "ExplorePwdAsync",
        },
      },
      ["e"] = {
        help = "by canonical extension",
        messages = {
          { AddNodeSorter = { sorter = "ByCanonicalExtension", reverse = false } },
          "ExplorePwdAsync",
        },
      },
      ["enter"] = {
        help = "submit",
        messages = {
          "PopModeKeepingInputBuffer",
        },
      },
      ["esc"] = {
        messages = {
          "PopModeKeepingInputBuffer",
        },
      },
      ["m"] = {
        help = "by canonical mime essence",
        messages = {
          { AddNodeSorter = { sorter = "ByCanonicalMimeEssence", reverse = false } },
          "ExplorePwdAsync",
        },
      },
      ["n"] = {
        help = "by node type",
        messages = {
          { AddNodeSorter = { sorter = "ByCanonicalIsDir", reverse = false } },
          { AddNodeSorter = { sorter = "ByCanonicalIsFile", reverse = false } },
          { AddNodeSorter = { sorter = "ByIsSymlink", reverse = false } },
          "ExplorePwdAsync",
        },
      },
      ["r"] = {
        help = "by relative path",
        messages = {
          { AddNodeSorter = { sorter = "ByIRelativePath", reverse = false } },
          "ExplorePwdAsync",
        },
      },
      ["s"] = {
        help = "by size",
        messages = {
          { AddNodeSorter = { sorter = "BySize", reverse = false } },
          "ExplorePwdAsync",
        },
      },
      ["c"] = {
        help = "by created",
        messages = {
          { AddNodeSorter = { sorter = "ByCreated", reverse = false } },
          "ExplorePwdAsync",
        },
      },
      ["C"] = {
        help = "by created reverse",
        messages = {
          { AddNodeSorter = { sorter = "ByCreated", reverse = true } },
          "ExplorePwdAsync",
        },
      },
      ["l"] = {
        help = "by last modified",
        messages = {
          { AddNodeSorter = { sorter = "ByLastModified", reverse = false } },
          "ExplorePwdAsync",
        },
      },
      ["L"] = {
        help = "by last modified reverse",
        messages = {
          { AddNodeSorter = { sorter = "ByLastModified", reverse = true } },
          "ExplorePwdAsync",
        },
      },
    },
  },
}
xplr.config.modes.builtin.switch_layout = {
  name = "switch layout",
  layout = "HelpMenu",
  key_bindings = {
    on_key = {
      ["1"] = {
        help = "default",
        messages = {
          { SwitchLayoutBuiltin = "default" },
          "PopMode",
        },
      },
      ["2"] = {
        help = "no help menu",
        messages = {
          { SwitchLayoutBuiltin = "no_help" },
          "PopMode",
        },
      },
      ["3"] = {
        help = "no selection panel",
        messages = {
          { SwitchLayoutBuiltin = "no_selection" },
          "PopMode",
        },
      },
      ["4"] = {
        help = "no help or selection",
        messages = {
          { SwitchLayoutBuiltin = "no_help_no_selection" },
          "PopMode",
        },
      },
    },
  },
}
xplr.config.modes.builtin.vroot = {
  name = "vroot",
  layout = "HelpMenu",
  key_bindings = {
    on_key = {
      ["v"] = {
        help = "toggle vroot",
        messages = {
          "PopMode",
          "ToggleVroot",
        },
      },
      ["."] = {
        help = "vroot $PWD",
        messages = {
          "PopMode",
          {
            BashExecSilently0 = [===[
              "$XPLR" -m 'SetVroot: %q' "${PWD:?}"
            ]===],
          },
        },
      },
      ["/"] = {
        help = "vroot /",
        messages = {
          "PopMode",
          { SetVroot = "/" },
        },
      },
      ["~"] = {
        help = "vroot $HOME",
        messages = {
          "PopMode",
          {
            BashExecSilently0 = [===[
              "$XPLR" -m 'SetVroot: %q' "${HOME:?}"
            ]===],
          },
        },
      },
      ["ctrl-r"] = {
        help = "reset vroot",
        messages = {
          "PopMode",
          "ResetVroot",
        },
      },
      ["ctrl-u"] = {
        help = "unset vroot",
        messages = {
          "PopMode",
          "UnsetVroot",
        },
      },
    },
  },
}
xplr.config.modes.builtin.edit_permissions = {
  name = "edit permissions",
  key_bindings = {
    on_key = {
      ["u"] = {
        help = "+user",
        messages = {
          {
            BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"
              U="$(( (${U:-0} + 1) % 8 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
          },
        },
      },
      ["U"] = {
        help = "-user",
        messages = {
          {
            BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"
              U="$(( ${U:-0}-1 < 0 ? 7 : ${U:-0}-1 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
          },
        },
      },
      ["g"] = {
        help = "+group",
        messages = {
          {
            BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"
              G="$(( (${G:-0} + 1) % 8 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
          },
        },
      },
      ["G"] = {
        help = "-group",
        messages = {
          {
            BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"
              G="$(( ${G:-0}-1 < 0 ? 7 : ${G:-0}-1 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
          },
        },
      },
      ["o"] = {
        help = "+other",
        messages = {
          {
            BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"
              O="$(( (${O:-0} + 1) % 8 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
          },
        },
      },
      ["O"] = {
        help = "-other",
        messages = {
          {
            BashExecSilently0 = [===[
              PERM="${XPLR_INPUT_BUFFER:-000}"
              U="${PERM: -3:-2}"
              G="${PERM: -2:-1}"
              O="${PERM: -1}"
              O="$(( ${O:-0}-1 < 0 ? 7 : ${O:-0}-1 ))"
              "$XPLR" -m 'SetInputBuffer: %q' "${U:-0}${G:-0}${O:-0}"
            ]===],
          },
        },
      },
      ["m"] = {
        help = "max",
        messages = {
          {
            BashExecSilently0 = [===[
              "$XPLR" -m 'SetInputBuffer: %q' "777"
            ]===],
          },
        },
      },
      ["M"] = {
        help = "min",
        messages = {
          {
            BashExecSilently0 = [===[
              "$XPLR" -m 'SetInputBuffer: %q' "000"
            ]===],
          },
        },
      },
      ["ctrl-r"] = {
        help = "reset",
        messages = {
          {
            BashExecSilently0 = [===[
              PERM=$(stat -c '%a' -- "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${PERM:?}"
            ]===],
          },
        },
      },
      ["enter"] = {
        help = "submit",
        messages = {
          {
            BashExecSilently0 = [===[
              chmod "${XPLR_INPUT_BUFFER:?}" -- "${XPLR_FOCUS_PATH:?}"
            ]===],
          },
          "PopMode",
          "ExplorePwdAsync",
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}
xplr.config.modes.custom = {}
xplr.fn.builtin.try_complete_path = function(m)
  if not m.input_buffer then
    return
  end
  local function matches_all(str, paths)
    for _, path in ipairs(paths) do
      if string.sub(path, 1, #str) ~= str then
        return false
      end
    end
    return true
  end
  local path = m.input_buffer
  local explorer_config = {
    filters = {
      { filter = "RelativePathDoesStartWith", input = xplr.util.basename(path) },
    },
  }
  local parent = xplr.util.dirname(path)
  if not parent or parent == "" then
    parent = "./"
  elseif parent ~= "/" then
    parent = parent .. "/"
  end
  local nodes = xplr.util.explore(parent, explorer_config)
  local found = {}
  for _, node in ipairs(nodes) do
    table.insert(found, parent .. node.relative_path)
  end
  local count = #found
  if count == 0 then
    return
  elseif count == 1 then
    return {
      { SetInputBuffer = found[1] },
    }
  else
    local first = found[1]
    while #first > #path and matches_all(path, found) do
      path = string.sub(first, 1, #path + 1)
    end
    if matches_all(path, found) then
      return {
        { SetInputBuffer = path },
      }
    end
    return {
      { SetInputBuffer = string.sub(path, 1, #path - 1) },
    }
  end
end
xplr.fn.builtin.fmt_general_selection_item = function(n)
  local nl = xplr.util.paint("\\n", { add_modifiers = { "Italic", "Dim" } })
  local sh_config = { with_prefix_dots = true, without_suffix_dots = true }
  local shortened = xplr.util.shorten(n.absolute_path, sh_config)
  if n.is_dir then
    shortened = shortened .. "/"
  end
  local ls_style = xplr.util.lscolor(n.absolute_path)
  local meta_style = xplr.util.node_type(n).style
  local style = xplr.util.style_mix({ meta_style, ls_style })
  return xplr.util.paint(shortened:gsub("\n", nl), style)
end
xplr.fn.builtin.fmt_general_table_row_cols_0 = function(m)
  local r = ""
  if m.is_before_focus then
    r = r .. " -"
  else
    r = r .. "  "
  end
  r = r .. m.relative_index .. "│" .. m.index
  return r
end
xplr.fn.builtin.fmt_general_table_row_cols_1 = function(m)
  local nl = xplr.util.paint("\\n", { add_modifiers = { "Italic", "Dim" } })
  local r = m.tree .. m.prefix
  local style = xplr.util.lscolor(m.absolute_path)
  style = xplr.util.style_mix({ m.style, style })
  if m.meta.icon == nil then
    r = r .. ""
  else
    r = r .. m.meta.icon .. " "
  end
  local rel = m.relative_path
  if m.is_dir then
    rel = rel .. "/"
  end
  r = r .. xplr.util.paint(xplr.util.shell_escape(rel), style)
  r = r .. m.suffix .. " "
  if m.is_symlink then
    r = r .. "-> "
    if m.is_broken then
      r = r .. "×"
    else
      local symlink_path = xplr.util.shorten(m.symlink.absolute_path)
      if m.symlink.is_dir then
        symlink_path = symlink_path .. "/"
      end
      r = r .. symlink_path:gsub("\n", nl)
    end
  end
  return r
end
xplr.fn.builtin.fmt_general_table_row_cols_2 = function(m)
  local r = xplr.util.paint("r", { fg = "Green" })
  local w = xplr.util.paint("w", { fg = "Yellow" })
  local x = xplr.util.paint("x", { fg = "Red" })
  local s = xplr.util.paint("s", { fg = "Red" })
  local S = xplr.util.paint("S", { fg = "Red" })
  local t = xplr.util.paint("t", { fg = "Red" })
  local T = xplr.util.paint("T", { fg = "Red" })
  return xplr.util
    .permissions_rwx(m.permissions)
    :gsub("r", r)
    :gsub("w", w)
    :gsub("x", x)
    :gsub("s", s)
    :gsub("S", S)
    :gsub("t", t)
    :gsub("T", T)
end
xplr.fn.builtin.fmt_general_table_row_cols_3 = function(m)
  if not m.is_dir then
    return m.human_size
  else
    return ""
  end
end
xplr.fn.builtin.fmt_general_table_row_cols_4 = function(m)
  return tostring(os.date("%a %b %d %H:%M:%S %Y", m.last_modified / 1000000000))
end

xplr.fn.custom = {}
--  ╭──────────────────────────────────────────────────────────╮
--  │                          hacks                           │
--  ╰──────────────────────────────────────────────────────────╯
-- 
-- https://xplr.dev/en/awesome-hacks

-- Bookmark files using m and fuzzy search bookmarks using backtick
xplr.config.modes.builtin.default.key_bindings.on_key.m = {
  help = "bookmark",
  messages = {
    {
      BashExecSilently0 = [===[
        PTH="${XPLR_FOCUS_PATH:?}"
        PTH_ESC=$(printf %q "$PTH")
        if echo "${PTH:?}" >> "${XPLR_SESSION_PATH:?}/bookmarks"; then
          "$XPLR" -m 'LogSuccess: %q' "$PTH_ESC added to bookmarks"
        else
          "$XPLR" -m 'LogError: %q' "Failed to bookmark $PTH_ESC"
        fi
      ]===],
    },
  },
}

xplr.config.modes.builtin.default.key_bindings.on_key["`"] = {
  help = "go to bookmark",
  messages = {
    {
      BashExec0 = [===[
        PTH=$(cat "${XPLR_SESSION_PATH:?}/bookmarks" | fzf --no-sort)
        PTH_ESC=$(printf %q "$PTH")
        if [ "$PTH" ]; then
          "$XPLR" -m 'FocusPath: %q' "$PTH"
        fi
      ]===],
    },
  },
}

-- Fuzzy search history
xplr.config.modes.builtin.go_to.key_bindings.on_key.h = {
  help = "history",
  messages = {
    "PopMode",
    {
      BashExec0 = [===[
        PTH=$(cat "${XPLR_PIPE_HISTORY_OUT:?}" | sort -z -u | fzf --read0)
        if [ "$PTH" ]; then
          "$XPLR" -m 'ChangeDirectory: %q' "$PTH"
        fi
      ]===],
    },
  },
}

-- Batch rename
-- paru -Sy --needed --noconfirm pipe-rename
xplr.config.modes.builtin.default.key_bindings.on_key.R = {
  help = "batch rename",
  messages = {
    {
      BashExec = [===[
       SELECTION=$(cat "${XPLR_PIPE_SELECTION_OUT:?}")
       NODES=${SELECTION:-$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}")}
       if [ "$NODES" ]; then
         echo -e "$NODES" | renamer
         "$XPLR" -m ExplorePwdAsync
       fi
     ]===],
    },
  },
}
-- Text preview pane
local function stat(node)
  return node.mime_essence
end

local function read(path, height)
  local p = io.open(path)

  if p == nil then
    return nil
  end

  local i = 0
  local res = ""
  for line in p:lines() do
    if line:match("[^ -~\n\t]") then
      p:close()
      return
    end

    res = res .. line .. "\n"
    if i == height then
      break
    end
    i = i + 1
  end
  p:close()

  return res
end


xplr.config.layouts.builtin.default = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 60 },
        { Percentage = 40 },
      },
    },
    splits = {
      "Table",
      {
        CustomContent = {
          title = "preview",
          body = { DynamicParagraph = { render = "custom.preview_pane.render" } },
        },
      },
    },
  },
}

xplr.fn.custom.preview_pane = {}
xplr.fn.custom.preview_pane.render = function(ctx)
  local n = ctx.app.focused_node

  if n and n.canonical then
    n = n.canonical
  end

  if n then
    if n.is_file then
      return read(n.absolute_path, ctx.layout_size.height)
    else
      return stat(n)
    end
  else
    return ""
  end
end
--  ╭──────────────────────────────────────────────────────────╮
--  │                         plugins                          │
--  ╰──────────────────────────────────────────────────────────╯
os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)
require("xpm").setup({
  plugins = {
    { name = "dtomvan/xpm.xplr"              } ,
    { name = "dtomvan/paste-rs.xplr"         },
    -- CGO_ENABLED=1 CGO_LDFLAGS="-g -O2" paru -Sy --removemake --cleanafter --noconfirm pistol-git
    { name = "sayanarijit/fzf.xplr"          },
    { name = "sayanarijit/xclip.xplr"        },
    { name = "sayanarijit/offline-docs.xplr" },
    { name = "sayanarijit/registers.xplr"    },
    { name = "sayanarijit/regex-search.xplr" },
    { name = "sayanarijit/dual-pane.xplr"    },
    { name = "sayanarijit/alacritty.xplr"    },
    { name = "sayanarijit/find.xplr"         },
    { name = "sayanarijit/map.xplr"          },
    { name = "sayanarijit/trash-cli.xplr"    },
    { name = "sayanarijit/zoxide.xplr"       },
    { name = "sayanarijit/tree-view.xplr"    },
    { name = "Junker/nuke.xplr"              },
    -- paru -Sy --removemake --cleanafter --noconfirm dragon-dro
    { name = "sayanarijit/dragon.xplr"       },
    -- paru -Sy --noconfirm dua-cli
    { name = "sayanarijit/dua-cli.xplr"      },
    -- paru -Sy --noconfirm ouch
    { name = "dtomvan/ouch.xplr"             },
  },
  auto_install = true,
  auto_cleanup = true,
})
xplr.config.modes.builtin.default.key_bindings.on_key.x = {
  help = "xpm",
  messages = {
    "PopMode",
    { SwitchModeCustom = "xpm" },
  },
}
--  ──────────────────────────────────────────────────────────
require("nuke").setup{
  pager = "bat", -- default: less -R
  open = {
    run_executables = true, -- default: false
    custom = {
      {mime_regex = "^video/.*", command = "vlc {}"},
      {mime_regex = ".*",        command = "xdg-open {}"},
    },
  },
  smart_view = {
    custom = {
      {extension = "so", command = "ldd -r {} | less"},
    }
  }
}
xplr.config.modes.builtin.default.key_bindings.on_key.v = {
  help     = "nuke",
  messages = {"PopMode", {SwitchModeCustom = "nuke"}}
}
xplr.config.modes.builtin.default.key_bindings.on_key["f3"]    = xplr.config.modes.custom.nuke.key_bindings.on_key.v
xplr.config.modes.builtin.default.key_bindings.on_key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o

--  ──────────────────────────────────────────────────────────
-- Type `M` to switch to single map mode.
-- Then press `tab` to switch between single and multi map modes.
-- Press `ctrl-o` to edit the command using your editor.
local map = require("map")
map.setup{
  mode = "default",  -- or `xplr.config.modes.builtin.default`
  key = "M",
  editor = os.getenv("EDITOR") or "vim",
  editor_key = "alt-e",
  prefer_multi_map = false,
  placeholder = "{}",
  spacer = "{_}",
  custom_placeholders = {
    ["{ext}"] = function(node)
      -- See https://xplr.dev/en/lua-function-calls#node
      return xplr.util.shell_quote(node.extension)
    end,

    ["{name}"] = map.placeholders["{name}"],
  },
}
--  ──────────────────────────────────────────────────────────
-- Press `alt-t` to spawn a new alacritty window with the current selection
require("alacritty").setup{
  mode = "default",
  key = "alt-t",
  send_focus = true,
  send_selection = true,
  send_vroot = true,
  alacritty_bin = "alacritty",
  extra_alacritty_args = "",
  xplr_bin = "xplr",
  extra_xplr_args = "",
}
--  ──────────────────────────────────────────────────────────
-- Press `ctrl-f` to spawn fzf in $PWD
require("fzf").setup{
  mode = "default",
  key = "ctrl-f",
  bin = "fzf",
  args = "--preview 'pistol {}'",
  recursive = false,  -- If true, search all files under $PWD
  enter_dir = false,  -- Enter if the result is directory
}
--  ──────────────────────────────────────────────────────────
-- Type `dd` to trash, `dr` to restore.
require("trash-cli").setup{
  trash_bin = "trash-put",
  trash_mode = "delete",
  trash_key = "d",
  restore_bin = "trash-restore",
  restore_mode = "delete",
  restore_key = "r",
  trash_list_bin = "trash-list",
  trash_list_selector = "fzf -m | cut -d' ' -f3-",
}
--  ──────────────────────────────────────────────────────────
-- Type `yy` to copy and `p` to paste whole files.
-- Type `yp` to copy the paths of focused or selected files.
-- Type `yP` to copy the parent directory path.
require("xclip").setup{
  copy_command = "xclip-copyfile",
  copy_paths_command = "xclip -sel clip",
  paste_command = "xclip-pastefile",
  keep_selection = false,
}
--  ──────────────────────────────────────────────────────────
-- Type `Z` to spawn zoxide prompt.
require("zoxide").setup{
  bin = "zoxide",
  mode = "default",
  key = "Z",
}
--  ──────────────────────────────────────────────────────────
require("offline-docs").setup{
  mode = "action",
  key = "?",
  local_path = os.getenv("HOME") .. "/.local/share/xplr/doc/" .. version
}
--  ──────────────────────────────────────────────────────────
-- Type `"` and then another character to swap the selection with a register.
require("registers").setup{
  mode = "default",
  key = '"',
}
--  ──────────────────────────────────────────────────────────
-- Type `/` and then the pattern to match
require("regex-search").setup{
  mode = "default",  -- or xplr.config.modes.builtin.default
  key = "/",  -- or xplr.config.modes.builtin.default.key_bindings.on_key["/"]
  prompt = "/",
  initial_input = "(?i)^",
}
require("dual-pane").setup{
  active_pane_width = { Percentage = 70 },
  inactive_pane_width = { Percentage = 30 },
}
--  ──────────────────────────────────────────────────────────
require("ouch").setup{
  mode = "action",
  key = "o",
}
--  ──────────────────────────────────────────────────────────
-- Type `Pp` to paste files.
-- Type `Pl` to list pasted files.
-- Type `Po` to fuzzy search and open the link to file in browser.
-- Type `Pd` to fuzzy search and delete the file from paste.rs.
require("paste-rs").setup{
  mode = "default",
  key = "P",
  db_path = "$HOME/paste.rs.list"
}
--  ──────────────────────────────────────────────────────────
-- Select files and type `:sD` to drag
-- Type `:sD` without selecting anything to drop
require("dragon").setup{
  mode           = "selection_ops",
  key            = "D",
  drag_args      = "",
  drop_args      = "",
  keep_selection = false,
  bin            = "dragon",
}
--  ──────────────────────────────────────────────────────────
-- Type `:D` to spawn dua-cli in $PWD
require("dua-cli").setup{
  mode = "action",
  key = "D",
}
--  ──────────────────────────────────────────────────────────
-- Press `F` to find files interactively using the `find_command`.
--
-- local handle = io.popen('go env GOPATH')
-- local output = handle:read('*a')
-- local gopath = output:gsub('[\n\r]', ' ')
-- handle:close()
-- string.format(" --exclude '%s'", gopath  ) ..
-- " --exclude '.npm'" ..
-- " --exclude '.cache'" ..
-- " --exclude '.rustup'" ..
-- " --exclude '.cargo'" ..
-- " --exclude 'Trash'" ..
-- " --exclude 'snap'" ..
-- " --exclude 'site-packages'" ..
require("find").setup{
  mode = "default",
  key = "F",
  templates = {
    ["find all"] = {
      key = "a",
      find_command = "fd",
      find_args = "" ..
      " --hidden" ..
      " --no-ignore" ..
      " --exclude 'node_modules'" ..
      " --exclude '.git'" ..
      " --exclude '.terraform'" ..
      " --exclude '.vagrant'" ..
      " --exclude '*.log'" ..
      " --exclude '*.tfstate'" ..
      " --full-path ." ..
      " .",
      cursor_position = 8,
    },
    ["find files"] = {
      key = "f",
      find_command = "fd",
      find_args = "" ..
      " --hidden" ..
      " --no-ignore" ..
      " --type f" ..
      " --exclude 'node_modules'" ..
      " --exclude '.git'" ..
      " --exclude '.terraform'" ..
      " --exclude '.vagrant'" ..
      " --exclude '*.log'" ..
      " --exclude '*.tfstate'" ..
      " --full-path ." ..
      " .",
      cursor_position = 0,
    },
    ["find directories"] = {
      key = "d",
      find_command = "fd",
      find_args = "" ..
      " --hidden" ..
      " --no-ignore" ..
      " --type d" ..
      " --exclude 'node_modules'" ..
      " --exclude '.git'" ..
      " --exclude '.terraform'" ..
      " --exclude '.vagrant'" ..
      " --exclude '*.log'" ..
      " --exclude '*.tfstate'" ..
      " --full-path ." ..
      " .",
      cursor_position = 0,
    },
  },
  refresh_screen_key = "ctrl-r",
}
--  ──────────────────────────────────────────────────────────
-- git clone https://github.com/sayanarijit/dual-pane.xplr ~/.config/xplr/plugins/dual-pane
--  ──────────────────────────────────────────────────────────
-- use ctrl-w
-- reference
-- https://blog.xplr.dev/post/27231/How-to-manage-files-using-xplr
require("dual-pane").setup{
  active_pane_width = { Percentage = 70 },
  inactive_pane_width = { Percentage = 30 },
}
--  ──────────────────────────────────────────────────────────
-- git clone https://github.com/sayanarijit/tree-view.xplr ~/.config/xplr/plugins/tree-view
--  ──────────────────────────────────────────────────────────
require("tree-view").setup({
    mode = "switch_layout",
    key = "T",

    -- If you feel slowness, you might want to toggle back to the default view.
    toggle_layout_mode = "default",
    toggle_layout_key = "esc",

    -- Press backspace to close all and back and close
    close_all_and_back_mode = "default",
    close_all_and_back_key = "backspace",

    -- Toggle expansion without entering
    toggle_expansion_mode = "default",
    toggle_expansion_key = "o",

    -- Toggle expansion of all the nodes under pwd
    toggle_expansion_all_mode = "default",
    toggle_expansion_all_key = "O",

    -- Focus on the next visible line, not compatible with up/down action
    focus_next_mode = "default",
    focus_next_key = "]",

    -- Focus on the previous visible line, not compatible with up/down action
    focus_prev_mode = "default",
    focus_prev_key = "[",

    -- Go to the next deep level directory that's open
    goto_next_open_mode = "default",
    goto_next_open_key = ")",

    -- Go to the previous deep level directory that's open
    goto_prev_open_mode = "default",
    goto_prev_open_key = "(",

    -- Whether to display the tree in full screen
    fullscreen = false,

    -- Indent for the branches of the tree
    indent = "  ",

    -- Start xplr with tree view layout
    as_initial_layout = false,

    -- Disables toggling layout.
    as_default_layout = false,

    -- Automatically fallback to this layout for better performance if the
    -- branch contains # of nodes more than the threshold value
    fallback_layout = "Table",
    fallback_threshold = 500,  -- default: nil (disabled)
})
return {
  on_load             = {},
  on_directory_change = {},
  on_focus_change     = {},
  on_mode_switch      = {},
  on_layout_switch    = {},
}

