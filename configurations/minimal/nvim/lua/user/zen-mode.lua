local status_ok, zen = pcall(require, "zen-mode")
if not status_ok then
  return
end

zen.setup{
  window = {
    backdrop = 1,
    width = 100,
    height = .85,
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
    twilight = { enabled = false },
    gitsigns = { enabled = true },
    tmux = { enabled = true },
    kitty = {
      enabled = false,
      font = "+4",
    },
  },
}
