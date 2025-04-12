{
  theme = "amberwood";
  editor = {
    cursorline = true;
    bufferline = "multiple";
    true-color = true;

    soft-wrap.enable = true;

    #end-of-line-diagnostics = "hint";

    #inline-diagnostics = { cursor-line = "error"; };
    lsp = {
      display-messages = true;
      display-inlay-hints = true;
    };

    cursor-shape = { insert = "bar"; };

    indent-guides = {
      render = true;
      character = "▏";
    };
  };

  keys = {
    normal = {
      C-k = "goto_previous_buffer";
      C-h = "goto_next_buffer";
      C-w = ":buffer-close";
    };
  };
}
