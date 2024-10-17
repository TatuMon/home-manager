{
  RA = {
    desc = "[R]eplace [A]ll in buffer";
    nargs = "*";
    range = false;
    command = {
      __raw = ''
        function(opts)
          local args = opts.fargs
          if not args then
            print("Usage: RA <search_term> <replace_term>")
            return
          end
          
          local search_term, replace_term = unpack(args)
          
          if not search_term or not replace_term then
            print("Error: Both search term and replace term are required.")
            return
          end
          
          local cmd = string.format("%%s/%s/%s/gc", vim.fn.escape(search_term, "/"), vim.fn.escape(replace_term, "/"))
          vim.cmd(cmd)
        end
      '';
    };
  };
  R = {
    desc = "[R]eplace in range";
    nargs = "*";
    range = true;
    command = {
      __raw = ''
        function(opts)
          local args = opts.fargs
          if not args then
            print("Usage: R <search_term> <replace_term>")
            return
          end

          local start_line = opts.line1
          local end_line = opts.line2

          if not start_line or not end_line then
            print("Error: No range selected.")
            return
          end

          local search_term, replace_term = unpack(args)
          
          if not search_term or not replace_term then
            print("Error: Both search term and replace term are required.")
            return
          end

          local search_term, replace_term = unpack(args)
          vim.cmd(string.format("%s,%ss/%s/%s/gc", start_line, end_line, search_term, replace_term))
        end
      '';
    };
  };
}
