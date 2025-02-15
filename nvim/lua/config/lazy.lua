return {
  root = vim.fn.stdpath("data") .. "/lazy",
  defaults = {
    lazy = false,
    version = nil,
    cond = nil,
  },
  spec = require("config.plugins"),
  local_spec = false,
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
  concurrency = jit.os:find("Windows") and (vim.uv.available_parallelism() * 2) or nil,
  git = {
    log = { "-8" },
    timeout = 120,
    url_format = "https://github.com/%s.git",
    filter = true,
    throttle = {
      enabled = false,
      rate = 2,
      duration = 5 * 1000,
    },
    cooldown = 0,
  },
  pkg = {
    enabled = true,
    cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
    sources = {},
  },
  rocks = {
    enabled = true,
    root = vim.fn.stdpath("data") .. "/lazy-rocks",
    server = "https://nvim-neorocks.github.io/rocks-binaries/",
    hererocks = nil,
  },
  dev = {
    path = "",
    pattern = {},
    fallback = true,
  },
  install = {
    missing = true,
    colorscheme = { "catppuccin" },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "none",
    backdrop = 60,
    title = nil,
    title_pos = "center",
    pills = true,
  },
  browser = nil,
  throttle = 1000 / 30,
  custom_keys = {},
  headless = {
    process = true,
    log = true,
    task = true,
    colors = true,
  },
  diff = {
    cmd = "git",
  },
  checker = {
    enabled = true,
    concurrency = nil,
    notify = true,
    frequency = 3600,
    check_pinned = false,
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      paths = {},
      disabled_plugins = {},
    },
  },
  readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    skip_if_doc_exists = true,
  },
  state = vim.fn.stdpath("state") .. "/lazy/state.json",
  profiling = {
    loader = false,
    require = false,
  },
}
