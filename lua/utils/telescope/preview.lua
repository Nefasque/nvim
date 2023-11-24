local is_image = require("utils.functions").is_image

return {
  mime_hook = function(filepath, bufnr, _)
    if is_image(filepath) then
      local term = vim.api.nvim_open_term(bufnr, {})
      local function send_output(_, data, _)
        for _, d in ipairs(data) do
          vim.api.nvim_chan_send(term, d .. '\r\n')
        end
      end
      -- Terminal image viewer command
      vim.fn.jobstart({ 'catimg', "-w 90", filepath },
        { on_stdout = send_output, stdout_buffered = true, pty = true })
    end
  end,
  hide_on_startup = true,
}
