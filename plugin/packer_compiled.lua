-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/aarnphm/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/aarnphm/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/aarnphm/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/aarnphm/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/aarnphm/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    after = { "cmp_luasnip" },
    config = { "\27LJ\2\n�\2\0\0\3\0\t\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\4\0B\0\2\0016\0\0\0'\2\5\0B\0\2\0029\0\6\0B\0\1\0016\0\0\0'\2\a\0B\0\2\0029\0\6\0B\0\1\0016\0\0\0'\2\b\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\"luasnip.loaders.from_snipmate luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\fluasnip\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "git@github.com:L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    cond = { "\27LJ\2\nM\0\0\2\0\3\0\f6\0\0\0009\0\1\0009\0\2\0B\0\1\2\21\0\0\0)\1\0\0\0\1\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\18nvim_list_uis\bapi\bvim\0" },
    config = { "\27LJ\2\n�\1\0\0\6\1\6\0\0186\0\0\0009\0\1\0009\0\2\0-\2\0\0'\3\3\0&\2\3\2+\3\2\0+\4\1\0+\5\2\0B\0\5\0026\1\0\0009\1\1\0019\1\4\1\18\3\0\0'\4\5\0+\5\1\0B\1\4\1K\0\1\0\5�\6t\18nvim_feedkeys\r<Ignore>\27nvim_replace_termcodes\bapi\bvim�\2\1\5\f\0\17\0\"\18\a\0\0009\5\0\0'\b\1\0'\t\2\0B\5\4\2\18\a\5\0009\5\0\5\18\b\2\0'\t\3\0B\5\4\0023\6\4\0005\a\5\0=\0\6\a\v\3\0\0X\b\1�\18\3\5\0006\b\a\0009\b\b\b9\b\t\b\18\n\4\0005\v\n\0B\b\3\2\18\4\b\0005\b\f\0>\5\2\b>\3\3\b>\4\4\b=\b\v\a5\b\r\0=\1\14\b=\6\15\b=\a\16\b2\0\0�L\b\2\0\topts\ron_press\bval\1\0\1\ttype\vbutton\1\2\0\0\6n\vkeymap\1\0\3\fnoremap\2\vnowait\2\vsilent\2\vif_nil\6F\bvim\rshortcut\1\0\5\rposition\vcenter\16hl_shortcut\fKeyword\19align_shortcut\nright\nwidth\0032\vcursor\3\5\0\r<leader>\5\a%s\tgsub�\1\0\0\v\0\f\0\0266\0\0\0009\0\1\0006\2\2\0B\0\2\2\21\0\0\0'\1\3\0'\2\4\0006\3\0\0009\3\5\3B\3\1\0029\3\6\3'\4\a\0006\5\0\0009\5\5\5B\5\1\0029\5\b\5'\6\a\0006\a\0\0009\a\5\aB\a\1\0029\a\t\a'\b\n\0\18\t\0\0'\n\v\0&\1\n\1L\1\2\0\r plugins\v   \npatch\nminor\6.\nmajor\fversion\f   v\28🍱 github.com/aarnphm\19packer_plugins\rtbl_keys\bvim�_\1\0\17\0007\3�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\2+\2\0\0006\3\3\0009\3\4\3\a\3\5\0X\3\2�5\2\6\0X\3\1�5\2\a\0003\3\b\0009\4\t\0019\4\n\4=\2\v\4'\4\f\0'\5\r\0009\6\t\0019\6\14\0064\a\b\0\18\b\3\0'\n\15\0'\v\16\0\18\f\4\0'\r\17\0B\b\5\2>\b\1\a\18\b\3\0'\n\18\0'\v\19\0\18\f\4\0'\r\20\0B\b\5\2>\b\2\a\18\b\3\0'\n\21\0'\v\22\0\18\f\4\0'\r\23\0B\b\5\2>\b\3\a\18\b\3\0'\n\24\0'\v\25\0\18\f\4\0'\r\26\0B\b\5\2>\b\4\a\18\b\3\0'\n\27\0'\v\28\0\18\f\5\0'\r\29\0B\b\5\2>\b\5\a\18\b\3\0'\n\30\0'\v\31\0\18\f\5\0'\r \0B\b\5\2>\b\6\a\18\b\3\0'\n!\0'\v\"\0\18\f\5\0'\r#\0B\b\5\0?\b\0\0=\a\v\0069\6\t\0019\6\14\0069\6$\6'\a&\0=\a%\0063\6'\0009\a\t\0019\a(\a\18\b\6\0B\b\1\2=\b\v\a9\a\t\0019\a(\a9\a$\a'\b)\0=\b%\a)\a\2\0009\b\t\0019\b\n\b9\b\v\b\21\b\b\0009\t\t\0019\t\14\t9\t\v\t\21\t\t\0\29\t\1\t \b\t\b \b\a\b6\t*\0009\t+\t)\v\0\0006\f*\0009\f,\f6\14-\0009\14.\0149\14/\14'\0160\0B\14\2\2!\14\b\14\24\14\2\14B\f\2\0A\t\1\2)\n\1\0009\v1\0014\f\a\0005\r3\0=\t\v\r>\r\1\f9\r\t\0019\r\n\r>\r\2\f5\r4\0=\a\v\r>\r\3\f9\r\t\0019\r\14\r>\r\4\f5\r5\0=\n\v\r>\r\5\f9\r\t\0019\r(\r>\r\6\f=\f2\v9\v6\0009\r$\1B\v\2\1K\0\1\0\nsetup\1\0\1\ttype\fpadding\1\0\1\ttype\fpadding\1\0\1\ttype\fpadding\vlayout\vconfig\6$\14winheight\afn\bvim\tceil\bmax\tmath\rFunction\vfooter\0\vString\ahl\toptsC<cmd>Telescope find_files {cwd = vim.fn.stdpath('config')}<cr>\21  NVIM access\14kplus e r!:e $MYVIMRC | :cd %:p:h <CR>\18  Settings\14kplus e s\29<cmd>e ~/.editor.lua<cr>\16  Editor\14kplus e c\"<cmd>Telescope find_files<cr>\19  File find\14comma f f!<cmd>Telescope live_grep<cr>\19  Word find\14comma f w <cmd>Telescope oldfiles<cr>\22  File history\14comma f e <cmd>Telescope frecency<cr>\23  File frecency\14comma f r\fbuttons\nkplus\ncomma\bval\vheader\fsection\0\1\31\0\0�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣶⣿⣿⣶⣤⣄⡀⢀⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠏⠙⠻⠷⠤⠀⠉⠙⠿⠿⠛⢁⣠⣤⣄⠀⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⠀⠀⠚⠴⠶⠛⠛⠂⠀⠀⢠⠈⣁⣤⣶⡤⣼⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⠐⠜⠠⠶⣶⣶⣒⡶⢤⡤⠾⣞⠿⠟⠀⠀⢸⡀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⣯⡛⣷⠒⠠⠶⡏⠙⠋⠀⠀⢸⠀⠀⢻⡤⠤⠒⠚⠋⣇⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣼⠀⡽⢺⠀⠂⠀⠣⠤⠴⠒⠒⠋⠀⠀⢀⡇⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠓⢌⢣⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠈⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⢔⣋⠼⡇⠀⠀⠀⠀⠀⠀⠀⣠⠤⠤⠒⠀⠀⠀⡸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠉⠓⠶⢤⣄⣀⠀⠀⢀⣀⡠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⣾⠁⠀⠀⠀⠀⠀⠉⠉⠉⠉⢹⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣎⠀⠈⠑⠦⣀⠀⠀⠀⠀⠀⠀⠀⣼⠋⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣷⣄⠀⠀⠀⠉⠒⣤⣀⠀⣠⣎⠀⢀⣿⣷⣦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣀⣰⣿⣾⣿⣿⣿⣷⣼⣿⣿⣿⣿⣿⣿⣷⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀�\1⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀\1\31\0\0�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⠉⠀⠀⠉⠛⠻⢿⡿⢟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡄⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣰⣦⣄⣈⣛⣿⣶⣦⣀⣀⣤⡾⠟⠛⠻⣿⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⣿⣿⣥⣋⣉⣤⣤⣽⣿⣿⡟⣷⠾⠛⠉⢛⠃⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⣯⣣⣟⣉⠉⠉⠭⢉⡛⢛⣁⠡⣀⣠⣿⣿⡇⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢫⠐⢤⠈⣭⣟⣉⢰⣦⣴⣿⣿⡇⣿⣿⡄⢛⣛⣭⣥⣴⠸⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠃⣿⢂⡅⣿⣽⣿⣜⣛⣛⣭⣭⣴⣿⣿⡿⢸⣿⣿⣿⣿⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢻⣿⣬⡻⡜⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣷⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣝⡫⠴⣃⢸⣿⣿⣿⣿⣿⣿⣿⠟⣛⣛⣭⣿⣿⣿⢇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣶⣬⣉⡛⠻⠿⣿⣿⡿⠿⢟⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⠁⣾⣿⣿⣿⣿⣿⣶⣶⣶⣶⡆⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠱⣿⣷⣮⣙⠿⣿⣿⣿⣿⣿⣿⣿⠃⣴⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⠈⠻⣿⣿⣿⣶⣭⠛⠿⣿⠟⠱⣿⡿⠀⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⠏⠀⠁⠀⠀⠀⠈⠃⠀⠀⠀⠀⠀⠀⠈⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿�\1⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿\tdark\15background\20__editor_config\27alpha.themes.dashboard\nalpha\frequire\15����\4\4\1����\3\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/alpha-nvim",
    url = "git@github.com:goolord/alpha-nvim"
  },
  ["auto-session"] = {
    commands = { "SaveSession", "RestoreSession", "DeleteSession" },
    config = { "\27LJ\2\n�\2\0\0\5\0\n\0\0166\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2'\1\4\0&\0\1\0005\1\5\0=\0\6\0016\2\a\0'\4\b\0B\2\2\0029\2\t\2\18\4\1\0B\2\2\1K\0\1\0\nsetup\17auto-session\frequire\26auto_session_root_dir\1\0\5\25auto_restore_enabled\2%auto_session_enable_last_session\2\25auto_session_enabled\2\14log_level\tinfo\22auto_save_enabled\2\15/sessions/\tdata\fstdpath\afn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/auto-session",
    url = "git@github.com:rmagatti/auto-session"
  },
  catppuccin = {
    config = { "\27LJ\2\n�\24\0\1\4\0�\1\0�\0025\1\3\0005\2\1\0009\3\0\0=\3\2\2=\2\4\0015\2\6\0009\3\5\0=\3\a\0029\3\b\0=\3\2\0025\3\t\0=\3\n\2=\2\v\0015\2\f\0009\3\b\0=\3\a\0029\3\5\0=\3\2\2=\2\r\0015\2\15\0009\3\14\0=\3\a\2=\2\16\0015\2\17\0009\3\14\0=\3\a\2=\2\18\0015\2\19\0009\3\14\0=\3\a\2=\2\20\0015\2\22\0009\3\21\0=\3\2\0029\3\14\0=\3\a\2=\2\23\0015\2\24\0009\3\21\0=\3\2\2=\2\25\0015\2\26\0009\3\21\0=\3\2\2=\2\27\0015\2\28\0009\3\21\0=\3\2\2=\2\29\0015\2\30\0009\3\21\0=\3\2\2=\2\31\0015\2 \0009\3\21\0=\3!\2=\2\"\0015\2#\0009\3\14\0=\3\a\0029\3$\0=\3\2\2=\2%\0015\2'\0009\3&\0=\3\2\0025\3(\0=\3\n\2=\2)\0015\2*\0009\3\21\0=\3\2\2=\2+\0015\2-\0009\3,\0=\3\2\2=\2.\0015\0020\0009\3/\0=\3\2\2=\0021\0015\0023\0009\0032\0=\3\2\2=\0024\0015\0025\0009\0032\0=\3\2\2=\0026\0015\0028\0009\0037\0=\3\2\2=\0029\0015\2;\0009\3:\0=\3\2\2=\2<\0015\2=\0009\3:\0=\3\2\2=\2>\0015\2?\0009\3:\0=\3\2\2=\2@\0015\2B\0009\3A\0=\3\2\2=\2C\0015\2D\0009\3:\0=\3\2\2=\2E\0015\2G\0009\3F\0=\3\2\2=\2H\0015\2I\0009\3F\0=\3\2\2=\2J\0015\2K\0009\3:\0=\3\2\2=\2L\0015\2M\0009\3A\0=\3\2\2=\2N\0015\2O\0009\3:\0=\3\2\0025\3P\0=\3\n\2=\2Q\0015\2R\0009\3,\0=\3\2\0025\3S\0=\3\n\2=\2T\0015\2V\0009\3U\0=\3\2\0025\3W\0=\3\n\2=\2X\0015\2Y\0009\3&\0=\3\2\2=\2Z\0015\2[\0009\3U\0=\3\2\0024\3\0\0=\3\n\2=\2\\\0015\2]\0009\3\21\0=\3\2\2=\2^\0015\2_\0009\0037\0=\3\2\2=\2`\0015\2a\0009\3U\0=\3\2\2=\2b\0015\2c\0009\3\b\0=\3\2\0024\3\0\0=\3\n\2=\2d\0015\2f\0009\3e\0=\3\2\0029\3&\0=\3\a\2=\2g\0015\2h\0009\3e\0=\3\2\0029\3,\0=\3\a\2=\2i\0015\2j\0009\3e\0=\3\2\0029\3U\0=\3\a\2=\2k\0015\2l\0009\3F\0=\3\2\2=\2m\0015\2n\0009\3&\0=\3\2\2=\2o\0015\2q\0005\3p\0=\3\n\2=\2r\0015\2s\0009\3\21\0=\3\2\0024\3\0\0=\3\n\2=\2t\0015\2u\0009\3/\0=\3\2\2=\2v\0015\2x\0009\3w\0=\3\2\2=\2y\0015\2z\0009\3\0\0=\3\2\2=\2{\0015\2|\0009\3:\0=\3\2\2=\2}\0015\2~\0009\3,\0=\3\2\2=\2\127\0015\2�\0009\3�\0=\3\2\2=\2�\0015\2�\0009\3F\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3:\0=\3\2\2=\2�\0015\2�\0009\0037\0=\3\2\2=\2�\0015\2�\0009\3�\0=\3\2\2=\2�\0015\2�\0009\3\21\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3/\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3A\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3&\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\0037\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\0037\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3\b\0=\3\2\2=\2�\0015\2�\0009\3&\0=\3\2\2=\2�\0015\2�\0009\3&\0=\3\2\2=\2�\0015\2�\0009\3&\0=\3\2\2=\2�\0015\2�\0009\3U\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3,\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3A\0=\3\2\2=\2�\0015\2�\0009\3�\0=\3\2\2=\2�\0015\2�\0009\3/\0=\3\2\2=\2�\0015\2�\0009\3A\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3A\0=\3\2\2=\2�\0015\2�\0009\3A\0=\3\2\2=\2�\0015\2�\0009\3F\0=\3\2\2=\2�\0015\2�\0009\3A\0=\3\2\2=\2�\0015\2�\0009\3,\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3�\0=\3\2\2=\2�\0015\2�\0009\3�\0=\3\2\2=\2�\1L\1\2\0\f@symbol\1\0\0\18@property.cpp\1\0\0\18@property.css\1\2\0\0\vitalic\1\0\0\14@type.css\1\0\0\23@tag.attribute.tsx\1\0\0\21@constructor.tsx\1\0\0\28@constructor.typescript\1\0\0\25@property.typescript\1\2\0\0\vitalic\1\0\0\19@constant.java\1\0\0\21@constructor.lua\1\0\0\rflamingo\15@field.lua\1\0\0\20@parameter.bash\1\2\0\0\vitalic\1\0\0\27@function.builtin.bash\1\2\0\0\vitalic\1\0\0\16@label.json\1\0\0\16@field.yaml\1\0\0\19@property.toml\1\0\0\19@string.escape\1\0\0\17@text.strong\1\2\0\0\tbold\1\0\0\19@text.emphasis\1\2\0\0\vitalic\1\0\0\16@text.title\1\2\0\0\tbold\1\0\0\20@text.reference\1\2\0\0\tbold\1\0\0\18@text.literal\1\2\0\0\vitalic\1\0\0\14@text.uri\1\3\0\0\vitalic\14underline\1\0\0\n@text\1\0\0\19@tag.delimiter\1\0\0\t@tag\1\0\0\19@tag.attribute\1\2\0\0\vitalic\1\0\0\14@variable\1\0\0\ttext\n@type\1\0\0\18@string.regex\1\0\0\f@string\1\0\0\25@punctuation.bracket\1\0\0\roverlay2\27@punctuation.delimiter\1\0\0\15@namespace\1\0\0\f@method\1\0\0\1\2\0\0\vitalic\v@label\1\0\0\20@constant.macro\1\0\0\17@text.danger\1\0\0\18@text.warning\1\0\0\15@text.note\1\0\0\tbase\20@keyword.return\1\0\0\r@keyword\1\0\0\22@keyword.function\1\0\0\15@parameter\1\0\0\20@function.macro\1\0\0\14@function\1\0\0\22@variable.builtin\1\2\0\0\vitalic\1\0\0\bred\18@type.builtin\1\2\0\0\vitalic\1\0\0\22@function.builtin\1\2\0\0\vitalic\1\0\0\22@constant.builtin\1\0\0\15@exception\1\0\0\f@repeat\1\0\0\17@conditional\1\0\0\nmauve\14@constant\1\0\0\17@constructor\1\0\0\rlavender\r@boolean\1\0\0\f@number\1\0\0\v@float\1\0\0\npeach\25@punctuation.special\1\0\0\vmaroon\22@keyword.operator\1\0\0\14@operator\1\0\0\bsky\r@include\1\0\0\tteal\14@property\1\0\0\vyellow\v@field\1\0\0\16FidgetTitle\1\2\0\0\tbold\1\0\0\tblue\15FidgetTask\rsurface2\1\0\0 LspDiagnosticsUnderlineHint\asp\1\0\0\"LspDiagnosticsVirtualTextHint\1\0\0\23LspDiagnosticsHint\1\0\0\30LspDiagnosticsDefaultHint\1\0\0\19DiagnosticHint\1\0\0\30DiagnosticVirtualTextHint\1\0\0\14rosewater\30DiagnosticVirtualTextInfo\1\0\0\30DiagnosticVirtualTextWarn\1\0\0\31DiagnosticVirtualTextError\1\0\0\tnone\14IncSearch\1\0\0\vSearch\nstyle\1\2\0\0\tbold\tpink\abg\1\0\0\rsurface1\17CursorLineNr\1\0\0\afg\1\0\0\ngreen�\14\1\0\a\0E\0S6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0026\3\b\0009\3\t\0039\3\n\3'\5\v\0B\3\2\2'\4\f\0&\3\4\3=\3\r\0025\3\15\0005\4\14\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0034\4\0\0=\4\31\0034\4\0\0=\4 \0034\4\0\0=\4!\0034\4\0\0=\4\"\3=\3#\0025\3$\0005\4%\0005\5'\0005\6&\0=\6(\0055\6)\0=\6*\0055\6+\0=\6,\0055\6-\0=\6.\5=\5/\0045\0051\0005\0060\0=\6(\0055\0062\0=\6*\0055\0063\0=\6,\0055\0064\0=\6.\5=\0055\4=\0046\0035\0047\0=\0048\0035\0049\0=\4:\0035\4;\0=\4<\3=\3=\0025\3?\0005\4>\0=\4@\3=\3A\0025\3C\0003\4B\0=\4@\3=\3D\2B\0\2\1K\0\1\0\24highlight_overrides\1\0\0\0\20color_overrides\nmocha\1\0\0\1\0\25\ngreen\f#ABE9B3\rsurface1\f#575268\tpink\f#F5C2E7\14rosewater\f#F5E0DC\rsurface2\f#6E6C7E\vyellow\f#FAE3B0\tteal\f#B5E8E0\bsky\f#89DCEB\vmaroon\f#E8A2AF\npeach\f#F8BD96\rlavender\f#C9CBFF\nmauve\f#DDB6F2\bred\f#F28FAD\roverlay2\f#C3BAC6\ttext\f#D9E0EE\rflamingo\f#F2CDCD\tbase\f#1E1E2E\roverlay1\f#988BA2\tblue\f#96CDFB\rsubtext0\f#A6ADC8\rsubtext1\f#BAC2DE\rsurface0\f#302D41\roverlay0\f#6E6C7E\ncrust\f#161320\vmantle\f#1A1826\17integrations\fneotree\1\0\1\fenabled\1\bdap\1\0\2\fenabled\2\14enable_ui\2\21indent_blankline\1\0\2\fenabled\2\26colored_indent_levels\1\15native_lsp\15underlines\1\2\0\0\14underline\1\2\0\0\14underline\1\2\0\0\14underline\1\0\0\1\2\0\0\14underline\17virtual_text\16information\1\2\0\0\vitalic\rwarnings\1\2\0\0\vitalic\nhints\1\2\0\0\vitalic\verrors\1\0\0\1\2\0\0\vitalic\1\0\1\fenabled\2\1\0 \vfidget\2\14vim_sneak\1\roverseer\1\14which_key\2\15ts_rainbow\2\20symbols_outline\1\16lsp_trouble\2\14gitgutter\1\rlsp_saga\2\15treesitter\2\rmarkdown\2\vbeacon\1\fvimwiki\2\vaerial\1\tmini\1\15telekasten\1\tleap\1\15lightspeed\1\vbarbar\1\vneogit\1\rcoc_nvim\1\nnavic\1\14telescope\2\tfern\1\vnotify\1\bhop\2\14dashboard\2\rnvimtree\2\15illuminate\2\bcmp\2\rgitsigns\2\nmason\2\vstyles\14variables\fstrings\ntypes\fnumbers\rbooleans\1\3\0\0\tbold\vitalic\nloops\1\2\0\0\tbold\17conditionals\1\2\0\0\tbold\14operators\1\2\0\0\tbold\rkeywords\1\2\0\0\vitalic\14functions\1\3\0\0\vitalic\tbold\15properties\1\2\0\0\vitalic\rcomments\1\0\0\1\2\0\0\vitalic\17compile_path\16/catppuccin\ncache\fstdpath\afn\bvim\17dim_inactive\1\0\3\nshade\tdark\15percentage\4��̙\3���\3\fenabled\1\15background\1\0\2\nlight\nlatte\tdark\nmocha\1\0\3\27transparent_background\1\16term_colors\2\fflavour\nmocha\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "git@github.com:catppuccin/nvim"
  },
  ["cheatsheet.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\a\0\15\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\6\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\a\0036\4\0\0'\6\4\0B\4\2\0029\4\b\4=\4\t\0036\4\0\0'\6\4\0B\4\2\0029\4\n\4=\4\v\0036\4\0\0'\6\4\0B\4\2\0029\4\f\4=\4\r\3=\3\14\2B\0\2\1K\0\1\0\23telescope_mappings\n<C-E>\25edit_user_cheatsheet\n<C-Y>\21copy_cheat_value\v<A-CR>\22select_or_execute\t<CR>\1\0\0\31select_or_fill_commandline!cheatsheet.telescope.actions\1\0\3#include_only_installed_plugins\2\31bundled_plugin_cheatsheets\2\24bundled_cheatsheets\2\nsetup\15cheatsheet\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cheatsheet.nvim",
    url = "git@github.com:sudormrfbin/cheatsheet.nvim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-latex-symbols", "cmp-emoji" },
    after_files = { "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["cmp-path"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "git@github.com:hrsh7th/cmp-buffer"
  },
  ["cmp-emoji"] = {
    after_files = { "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-emoji",
    url = "git@github.com:hrsh7th/cmp-emoji"
  },
  ["cmp-latex-symbols"] = {
    after = { "cmp-spell" },
    after_files = { "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols/after/plugin/cmp_latex.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-latex-symbols",
    url = "git@github.com:kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-nvim-lua" },
    after_files = { "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "git@github.com:hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-path" },
    after_files = { "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "git@github.com:hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after = { "cmp-buffer" },
    after_files = { "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["cmp-nvim-lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "git@github.com:hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    after_files = { "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {
      ["cmp-latex-symbols"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp-spell",
    url = "git@github.com:f3fora/cmp-spell"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "git@github.com:lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "git@github.com:saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    commands = { "Copilot" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/copilot.vim",
    url = "git@github.com:github/copilot.vim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen", "DiffviewFileHistory" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/diffview.nvim",
    url = "git@github.com:sindrets/diffview.nvim"
  },
  ["dressing.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/dressing.nvim",
    url = "git@github.com:stevearc/dressing.nvim"
  },
  ["efmls-configs-nvim"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/efmls-configs-nvim",
    url = "git@github.com:creativenull/efmls-configs-nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\nr\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\1\nblend\3\0\ttext\1\0\0\1\0\1\fspinner\tdots\nsetup\vfidget\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "git@github.com:j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\nm\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\fshebang\1\0\0\1\0\1\tdash\ash\nsetup\rfiletype\frequire\0" },
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "git@github.com:nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "git@github.com:rafamadriz/friendly-snippets"
  },
  ["fzy-lua-native"] = {
    load_after = {
      ["wilder.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/fzy-lua-native",
    url = "git@github.com:romgrk/fzy-lua-native"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\b\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\14diff_opts\1\0\1\rinternal\2\28current_line_blame_opts\1\0\2\ndelay\3�\a\21virtual_text_pos\beol\fkeymaps\1\0\3\14word_diff\2\23current_line_blame\2\nnumhl\2\22n <LocalLeader>[g\1\2\1\0@&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\22n <LocalLeader>]g\1\2\1\0@&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\f\22n <LocalLeader>hR4<cmd>lua require(\"gitsigns\").reset_buffer()<CR>\22v <LocalLeader>hsV<cmd>lua require(\"gitsigns\").stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\22n <LocalLeader>hb?<cmd>lua require(\"gitsigns\").blame_line({full = true})<CR>\tx ih4:<C-U>lua require(\"gitsigns\").text_object()<CR>\fnoremap\2\22v <LocalLeader>hrV<cmd>lua require(\"gitsigns\").reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\to ih4:<C-U>lua require(\"gitsigns\").text_object()<CR>\22n <LocalLeader>hs2<cmd>lua require(\"gitsigns\").stage_hunk()<CR>\22n <LocalLeader>hp4<cmd>lua require(\"gitsigns\").preview_hunk()<CR>\22n <LocalLeader>hu7<cmd>lua require(\"gitsigns\").undo_stage_hunk()<CR>\22n <LocalLeader>hr2<cmd>lua require(\"gitsigns\").reset_hunk()<CR>\vbuffer\2\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "git@github.com:lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "git@github.com:phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "git@github.com:lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\21context_patterns\1\15\0\0\nclass\rfunction\vmethod\nblock\17list_literal\rselector\b^if\v^table\17if_statement\nwhile\bfor\ttype\bvar\vimport\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\22\0\0\rstartify\14dashboard\nalpha\blog\rfugitive\14gitcommit\vpacker\fvimwiki\rmarkdown\tjson\btxt\nvista\thelp\ftodoist\rNvimTree\rpeekaboo\bgit\20TelescopePrompt\rundotree\24flutterToolsOutline\5\1\0\5#show_trailing_blankline_indent\1\28show_first_indent_level\2\25space_char_blankline\6 \tchar\b│\25show_current_context\2\nsetup\21indent_blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "git@github.com:lukas-reineke/indent-blankline.nvim"
  },
  ["jupyter_ascending.vim"] = {
    commands = { "JupyterExecute", "JupyterExecuteAll" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/jupyter_ascending.vim",
    url = "git@github.com:untitled-ai/jupyter_ascending.vim"
  },
  ["lsp_signature.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "git@github.com:ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "git@github.com:onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\v\1\18\0#5\0\2\0-\1\0\0009\1\0\0019\1\1\1=\1\3\0-\1\0\0009\1\0\0019\1\4\1=\1\5\0-\1\0\0009\1\0\0019\1\6\1=\1\a\0-\1\0\0009\1\0\0019\1\b\1=\1\t\0006\1\n\0\18\3\0\0B\1\2\4H\4\v�'\6\v\0\18\a\4\0&\6\a\0066\a\f\0009\a\r\a9\a\14\a\18\t\6\0005\n\15\0=\5\16\n=\6\17\nB\a\3\1F\4\3\3R\4�\127K\0\1\0\0�\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\tHint\rHint_alt\tInfo\20Information_alt\tWarn\16Warning_alt\nError\1\0\0\14Error_alt\16diagnostics�\2\0\0\3\0\19\0\0296\0\0\0009\0\1\0009\0\2\0\a\0\3\0X\0\6�6\0\4\0'\2\5\0B\0\2\0029\0\6\0D\0\1\0X\0\17�6\0\4\0'\2\a\0B\0\2\0029\0\b\0009\1\n\0=\1\t\0009\1\n\0=\1\v\0009\1\r\0=\1\f\0009\1\15\0=\1\14\0009\1\17\0=\1\16\0009\1\n\0=\1\18\0L\0\2\0K\0\1\0\vmaroon\tblue\rsapphire\vviolet\nmauve\vyellow\14rosewater\rflamingo\vorange\npeach\vcolors\20lspsaga.lspkind\16get_palette\24catppuccin.palettes\frequire\15catppuccin\16colors_name\6g\bvim�\f\1\0\n\0A\0�\0025\0\4\0006\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\3\0+\4\2\0B\1\3\2=\1\3\0006\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\5\0+\4\2\0B\1\3\2=\1\5\0006\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\6\0+\4\2\0B\1\3\2=\1\6\0006\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\a\0+\4\2\0B\1\3\2=\1\a\0003\1\b\0003\2\t\0\18\3\1\0B\3\1\1\18\3\2\0B\3\1\0026\4\0\0'\6\n\0B\4\2\0029\4\v\0045\6\16\0004\a\5\0009\b\3\0009\b\f\b>\b\1\a9\b\3\0009\b\r\b>\b\2\a9\b\3\0009\b\14\b>\b\3\a9\b\3\0009\b\15\b>\b\4\a=\a\17\0065\a\20\0004\b\3\0009\t\5\0009\t\18\t>\t\1\b9\t\19\3>\t\2\b=\b\18\a4\b\3\0009\t\5\0009\t\21\t>\t\1\b9\t\22\3>\t\2\b=\b\21\a4\b\3\0009\t\5\0009\t\23\t>\t\1\b9\t\24\3>\t\2\b=\b\23\a4\b\3\0009\t\5\0009\t\25\t>\t\1\b9\t\19\3>\t\2\b=\b\25\a4\b\3\0009\t\5\0009\t\26\t>\t\1\b9\t\27\3>\t\2\b=\b\26\a4\b\3\0009\t\5\0009\t\28\t>\t\1\b9\t\19\3>\t\2\b=\b\28\a4\b\3\0009\t\5\0009\t\29\t>\t\1\b9\t\27\3>\t\2\b=\b\29\a4\b\3\0009\t\5\0009\t\30\t>\t\1\b9\t\31\3>\t\2\b=\b\30\a4\b\3\0009\t\5\0009\t \t>\t\1\b9\t!\3>\t\2\b=\b \a4\b\3\0009\t\5\0009\t\"\t>\t\1\b9\t\19\3>\t\2\b=\b\"\a4\b\3\0009\t\5\0009\t#\t>\t\1\b9\t$\3>\t\2\b=\b%\a4\b\3\0009\t\5\0009\t&\t>\t\1\b9\t!\3>\t\2\b=\b&\a4\b\3\0009\t\5\0009\t'\t>\t\1\b9\t!\3>\t\2\b=\b'\a4\b\3\0009\t\5\0009\t(\t>\t\1\b9\t!\3>\t\2\b=\b(\a4\b\3\0009\t\5\0009\t)\t>\t\1\b9\t\22\3>\t\2\b=\b)\a4\b\3\0009\t\5\0009\t*\t>\t\1\b9\t+\3>\t\2\b=\b*\a4\b\3\0009\t\5\0009\t,\t>\t\1\b9\t!\3>\t\2\b=\b,\a4\b\3\0009\t\5\0009\t-\t>\t\1\b9\t\27\3>\t\2\b=\b-\a4\b\3\0009\t\5\0009\t.\t>\t\1\b9\t\19\3>\t\2\b=\b.\a4\b\3\0009\t\5\0009\t/\t>\t\1\b9\t0\3>\t\2\b=\b/\a4\b\3\0009\t\5\0009\t1\t>\t\1\b9\t\22\3>\t\2\b=\b1\a4\b\3\0009\t\6\0009\t2\t>\t\1\b9\t\22\3>\t\2\b=\b2\a4\b\3\0009\t\6\0009\t3\t>\t\1\b9\t\22\3>\t\2\b=\b3\a4\b\3\0009\t\6\0009\t4\t>\t\1\b9\t\19\3>\t\2\b=\b4\a4\b\3\0009\t\6\0009\t5\t>\t\1\b9\t\19\3>\t\2\b=\b5\a4\b\3\0009\t\6\0009\t6\t>\t\1\b9\t7\3>\t\2\b=\b6\a4\b\3\0009\t\5\0009\t8\t>\t\1\b9\t7\3>\t\2\b=\b8\a4\b\3\0009\t\5\0009\t9\t>\t\1\b9\t!\3>\t\2\b=\b9\a4\b\3\0009\t\5\0009\t:\t>\t\1\b9\t\22\3>\t\2\b=\b:\a=\a;\0065\a<\0'\b=\0009\t\a\0009\t>\t&\b\t\b=\b?\a=\a@\6B\4\2\0012\0\0�K\0\1\0\21symbol_in_winbar\14separator\14Separator\6 \1\0\4\14show_file\1\venable\2\14in_custom\2\19file_formatter\5\16custom_kind\17StaticMethod\14Parameter\14TypeAlias\ngreen\vString\vObject\tNull\fBoolean\nArray\rVariable\vmaroon\18TypeParameter\vStruct\rProperty\fPackage\bsky\rOperator\vNumber\14Namespace\vModule\vMethod\bKey\bred\fKeyword\14Interface\tblue\rFunction\14rosewater\tFile\nField\nEvent\tteal\15EnumMember\tEnum\rsapphire\16Constructor\npeach\rConstant\1\0\0\vyellow\nClass\22diagnostic_header\1\0\0\rHint_alt\20Information_alt\16Warning_alt\14Error_alt\18init_lsp_saga\flspsaga\0\0\aui\ttype\tkind\1\0\0\16diagnostics\bget\21modules.ui.icons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "git@github.com:glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\ne\0\0\4\0\6\0\r6\0\0\0006\2\1\0'\3\2\0B\0\3\3\15\0\0\0X\2\5�9\2\3\1\15\0\2\0X\3\2�'\2\4\0X\3\1�'\2\5\0L\2\2\0\5\t✺ \fwaiting\18better_escape\frequire\npcall|\0\0\3\0\b\0\0146\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\b�5\1\4\0009\2\3\0=\2\3\0019\2\5\0=\2\6\0019\2\a\0=\2\a\1L\1\2\0K\0\1\0\fremoved\rmodified\fchanged\1\0\0\nadded\25gitsigns_status_dict\6b\bviml\0\1\t\0\5\0\0186\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\2\15\0\1\0X\2\n�\18\1\0\0\18\4\0\0009\2\3\0'\5\4\0B\2\3\4X\5\1�\18\1\5\0E\5\3\2R\5�\127\18\0\1\0L\0\2\0\f([^/]+)\vgmatch\6/\tfind\vstring�\1\1\0\b\0\r\0&3\0\0\0006\1\1\0009\1\2\0019\1\3\1\a\1\4\0X\1\29�6\1\5\0009\1\6\1'\3\a\0B\1\2\2\15\0\1\0X\2\b�6\2\b\0009\2\t\2'\4\n\0\18\5\0\0\18\a\1\0B\5\2\0002\0\0�C\2\1\0006\2\5\0009\2\6\2'\4\v\0B\2\2\2\18\1\2\0\15\0\1\0X\2\b�6\2\b\0009\2\t\2'\4\n\0\18\5\0\0\18\a\1\0B\5\2\0002\0\0�C\2\1\0'\1\f\0002\0\0�L\1\2\0\5\16VIRTUAL_ENV\a%s\vformat\vstring\22CONDA_DEFAULT_ENV\vgetenv\aos\vpython\rfiletype\abo\bvim\0�\t\1\0\14\0009\0u5\0\4\0006\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\3\0+\4\2\0B\1\3\2=\1\3\0006\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\5\0+\4\2\0B\1\3\2=\1\5\0003\1\6\0003\2\a\0005\3\t\0005\4\b\0=\4\n\0034\4\0\0=\4\v\0034\4\0\0=\4\f\0034\4\0\0=\4\r\0034\4\0\0=\4\14\0034\4\0\0=\4\15\0035\4\16\0=\3\17\0045\5\18\0=\5\19\0043\5\20\0006\6\0\0'\b\21\0B\6\2\0029\6\22\0065\b\27\0005\t\23\0004\n\0\0=\n\24\t5\n\25\0=\n\26\t=\t\28\b5\t\30\0005\n\29\0=\n\n\t4\n\3\0005\v\31\0>\v\1\n5\v \0=\2!\v>\v\2\n=\n\v\t4\n\0\0=\n\f\t4\n\3\0004\v\3\0>\1\1\v>\v\1\n5\v\"\0005\f#\0=\f$\v5\f&\0009\r\3\0009\r%\r=\r'\f9\r\3\0009\r(\r=\r)\f9\r\3\0009\r*\r=\r+\f=\f,\v>\v\2\n=\n\r\t4\n\5\0005\v-\0>\v\1\n4\v\3\0>\5\1\v>\v\2\n5\v.\0>\v\3\n5\v/\0005\f0\0=\f,\v>\v\4\n=\n\14\t5\n1\0=\n\15\t=\t\17\b5\t2\0004\n\0\0=\n\n\t4\n\0\0=\n\v\t5\n3\0=\n\f\t5\n4\0=\n\r\t4\n\0\0=\n\14\t4\n\0\0=\n\15\t=\t5\b4\t\0\0=\t6\b5\t7\0>\4\5\t=\t8\bB\6\2\1K\0\1\0\15extensions\1\5\0\0\rquickfix\14nvim-tree\15toggleterm\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\1\3\0\0\rprogress\rlocation\1\0\3\bmac\aCR\tunix\aLF\bdos\tCRLF\1\2\1\0\15fileformat\18icons_enabled\2\1\2\0\0\rencoding\1\2\2\0\rfiletype\14icon_only\2\fcolored\2\fsymbols\tinfo\16Information\twarn\fWarning\nerror\1\0\0\nError\fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\vsource\1\2\0\0\tdiff\1\2\0\0\vbranch\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23section_separators\1\0\2\nright\6 \tleft\6 \23disabled_filetypes\1\0\3\18icons_enabled\2\ntheme\15catppuccin\25component_separators\6|\nsetup\flualine\0\14filetypes\1\2\0\0\19lspsagaoutline\rsections\1\0\0\14lualine_z\14lualine_y\14lualine_x\14lualine_c\14lualine_b\14lualine_a\1\0\0\1\2\0\0\rfiletype\0\0\tmisc\1\0\0\16diagnostics\bget\21modules.ui.icons\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "git@github.com:nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "git@github.com:iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "git@github.com:williamboman/mason-lspconfig.nvim"
  },
  ["mason-tool-installer.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\2\17run_on_start\2\16auto_update\2\1\31\0\0\18rust-analyzer\vclangd\31typescript-language-server\15eslint-lsp\befm\31dockerfile-language-server\ngopls\rrnix-lsp\fpyright\njdtls\25bash-language-server\29grammarly-languageserver\24lua-language-server\vstylua\vselene\nblack\nisort\ryamllint\17clang-format\bbuf\vpylint\rprettier\15shellcheck\nshfmt\tvint\15buildifier\24vim-language-server\vtflint\ajq\fyamlfmt\nsetup\25mason-tool-installer\frequire\0" },
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/mason-tool-installer.nvim",
    url = "git@github.com:WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "git@github.com:williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\3\0\0\15\0\23\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0026\2\0\0'\4\5\0B\2\2\0029\3\6\1\18\5\3\0009\3\a\3'\6\b\0009\a\t\0005\t\21\0005\n\20\0005\v\18\0005\f\14\0004\r\3\0009\14\n\0019\14\v\0149\14\f\14>\14\1\r9\14\n\0019\14\v\0149\14\r\14>\14\2\r=\r\15\f9\r\16\2=\r\17\f=\f\19\v=\v\16\n=\n\22\tB\a\2\0A\3\2\1K\0\1\0\14filetypes\1\0\0\1\0\1\btex\1\6(\1\0\0\fhandler\6*\tkind\1\0\0\vMethod\rFunction\23CompletionItemKind\blsp\20on_confirm_done\17confirm_done\aon\nevent'nvim-autopairs.completion.handlers\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "git@github.com:windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "git@github.com:kevinhwang91/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n\31\0\1\4\0\2\0\5'\1\0\0\18\2\0\0'\3\1\0&\1\3\1L\1\2\0\6)\6(�\t\1\0\v\0009\0a5\0\4\0006\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\3\0B\1\2\2=\1\3\0005\1\19\0005\2\5\0009\3\3\0009\3\6\3=\3\a\0029\3\3\0009\3\b\3=\3\t\0029\3\3\0009\3\n\3=\3\v\0029\3\3\0009\3\f\3=\3\r\0024\3\3\0005\4\14\0>\4\1\0035\4\15\0>\4\2\3=\3\16\0023\3\17\0=\3\18\2=\2\20\0014\2\0\0=\2\21\0016\2\22\0009\2\23\0029\2\24\2\a\2\25\0X\0024�6\2\0\0'\4\26\0B\2\2\0029\2\27\2B\2\1\2'\3\29\0=\3\28\0025\0034\0006\4\0\0'\6\30\0B\4\2\0029\4\2\0045\6 \0005\a\31\0=\a!\0065\a1\0005\b%\0005\t#\0009\n\"\2=\n$\t=\t&\b5\t'\0009\n\"\2=\n$\t=\t(\b5\t)\0009\n\"\2=\n$\t=\t*\b5\t+\0009\n\"\2=\n$\t=\t,\b5\t-\0009\n\"\2=\n$\t=\t.\b5\t/\0009\n\"\2=\n$\t=\t0\b=\b2\a=\a3\6B\4\2\2=\4\21\0036\4\22\0009\0045\4'\0066\0\18\a\1\0\18\b\3\0B\4\4\2\18\1\4\0006\2\0\0'\0047\0B\2\2\0029\0028\2\18\4\1\0B\2\2\1K\0\1\0\nsetup\15bufferline\nforce\20tbl_deep_extend\1\0\0\vcustom\nmocha\1\0\0\29hint_diagnostic_selected\1\0\0\28hint_diagnostic_visible\1\0\0\20hint_diagnostic\1\0\0\18hint_selected\1\0\0\17hint_visible\1\0\0\thint\1\0\0\afg\1\0\0\14rosewater\vstyles\1\0\0\1\3\0\0\vitalic\tbold.catppuccin.groups.integrations.bufferline\tNONE\tnone\16get_palette\24catppuccin.palettes\15catppuccin\16colors_name\6g\bvim\15highlights\foptions\1\0\0\26diagnostics_indicator\0\foffsets\1\0\5\rfiletype\rundotree\14highlight\14Directory\14separator\2\15text_align\vcenter\ttext\14Undo Tree\1\0\4\rfiletype\rNvimTree\15text_align\vcenter\fpadding\3\1\ttext\18File Explorer\23right_trunc_marker\nRight\22left_trunc_marker\tLeft\22buffer_close_icon\nClose\18modified_icon\rModified\1\0\t\20separator_style\tthin\20max_name_length\3\14\rtab_size\3\20\28show_buffer_close_icons\2\22show_buffer_icons\2\24show_tab_indicators\2\27always_show_bufferline\2\22max_prefix_length\3\r\16diagnostics\rnvim_lsp\1\0\0\aui\bget\21modules.ui.icons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua",
    url = "git@github.com:akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "copilot.vim", "LuaSnip" },
    config = { "\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2�\1\0\1\3\0\b\0\0264\1\t\0005\2\0\0>\0\2\2>\2\1\0015\2\1\0>\0\2\2>\2\2\0015\2\2\0>\0\2\2>\2\3\0015\2\3\0>\0\2\2>\2\4\0015\2\4\0>\0\2\2>\2\5\0015\2\5\0>\0\2\2>\2\6\0015\2\6\0>\0\2\2>\2\a\0015\2\a\0>\0\2\2>\2\b\1L\1\2\0\1\2\0\0\b│\1\2\0\0\b└\1\2\0\0\b─\1\2\0\0\b┘\1\2\0\0\b│\1\2\0\0\b┐\1\2\0\0\b─\1\2\0\0\b┌0\0\1\4\0\2\0\6\18\3\0\0009\1\0\0B\1\2\2+\2\1\0=\2\1\1L\1\2\0\15scrollable\ninfo_�\2\0\1\a\3\15\00026\1\0\0009\1\1\0019\1\2\1B\1\1\2\6\1\3\0X\2\b�6\2\0\0009\2\4\0029\2\5\2\18\4\1\0'\5\6\0+\6\2\0B\2\4\1X\2#�-\2\0\0009\2\a\2B\2\1\2\15\0\2\0X\3\4�-\2\0\0009\2\b\2B\2\1\1X\2\26�6\2\t\0'\4\n\0B\2\2\0029\2\v\2B\2\1\2\15\0\2\0X\3\t�6\2\0\0009\2\1\0029\2\f\2-\4\1\0'\6\r\0B\4\2\2'\5\3\0B\2\3\1X\2\n�-\2\2\0B\2\1\2\15\0\2\0X\3\4�-\2\0\0009\2\14\2B\2\1\1X\2\2�\18\2\0\0B\2\1\1K\0\1\0\a�\1�\2�\rcomplete!<Plug>luasnip-expand-or-jump\rfeedkeys\23expand_or_jumpable\fluasnip\frequire\21select_next_item\fvisible\6i\18nvim_feedkeys\bapi\5\19copilot#Accept\afn\bvim�\1\0\1\6\2\n\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\19�6\1\2\0'\3\3\0B\1\2\0029\1\4\1)\3��B\1\2\2\15\0\1\0X\2\t�6\1\5\0009\1\6\0019\1\a\1-\3\1\0'\5\b\0B\3\2\2'\4\t\0B\1\3\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\a�\1�\5\28<Plug>luasnip-jump-prev\rfeedkeys\afn\bvim\rjumpable\fluasnip\frequire\21select_prev_item\fvisible�\2\0\2\v\2\16\0#-\2\0\0009\2\0\0025\4\1\0006\5\2\0009\5\3\5'\a\4\0-\b\1\0009\b\5\b-\t\1\0009\t\6\t-\n\1\0009\n\a\nB\5\5\2=\5\b\4B\2\2\2\18\4\0\0\18\5\1\0B\2\3\0026\3\2\0009\3\t\0039\5\5\2'\6\n\0005\a\v\0B\3\4\2'\4\f\0:\5\1\3'\6\f\0&\4\6\4=\4\5\2'\4\14\0:\5\2\3'\6\15\0&\4\6\4=\4\r\2L\2\2\0\6�\0�\6)\n    (\tmenu\6 \1\0\1\14trimempty\2\a%s\nsplit\15symbol_map\bcmp\ttype\tkind\nforce\20tbl_deep_extend\bvim\1\0\2\rmaxwidth\0032\tmode\16symbol_text\15cmp_formatC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\n\1\0\20\0O\0�\0015\0\4\0006\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\3\0+\4\1\0B\1\3\2=\1\3\0006\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\5\0+\4\1\0B\1\3\2=\1\5\0006\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\6\0+\4\1\0B\1\3\2=\1\6\0003\1\a\0003\2\b\0003\3\t\0006\4\0\0'\6\n\0B\4\2\0029\5\f\4=\5\v\0043\5\r\0=\5\f\0046\5\0\0'\a\14\0B\5\2\0026\6\0\0'\b\15\0B\6\2\0026\a\0\0'\t\6\0B\a\2\0023\b\16\0003\t\17\0009\n\18\a5\f\26\0005\r\20\0005\14\19\0=\14\21\r5\14\23\0\18\15\3\0'\17\22\0B\15\2\2=\15\24\14=\14\25\r=\r\27\f5\r$\0004\14\t\0009\15\28\5>\15\1\0149\15\29\5>\15\2\0149\15\30\5>\15\3\0146\15\0\0'\17\31\0B\15\2\0029\15 \15>\15\4\0149\15\3\5>\15\5\0149\15!\5>\15\6\0149\15\"\5>\15\a\0149\15#\5>\15\b\14=\14%\r=\r&\f5\r(\0005\14'\0=\14)\r3\14*\0=\14+\r=\r,\f9\r-\a9\r.\r9\r/\r5\0152\0009\16-\a9\0160\0165\0181\0B\16\2\2=\0163\0159\16-\a9\0164\16B\16\1\2=\0165\0159\16-\a9\0166\16B\16\1\2=\0167\0159\16-\a9\0168\16)\18��B\16\2\2=\0169\0159\16-\a9\0168\16)\18\4\0B\16\2\2=\16:\0159\16-\a9\16;\16B\16\1\2=\16<\0159\16-\a\18\18\b\0005\19=\0B\16\3\2=\16>\0159\16-\a\18\18\t\0005\19?\0B\16\3\2=\16@\15B\r\2\2=\r-\f5\rB\0003\14A\0=\14C\r=\rD\f4\r\n\0005\14E\0>\14\1\r5\14F\0>\14\2\r5\14G\0>\14\3\r5\14H\0>\14\4\r5\14I\0>\14\5\r5\14J\0>\14\6\r5\14K\0>\14\a\r5\14L\0>\14\b\r5\14M\0>\14\t\r=\rN\fB\n\2\0012\0\0�K\0\1\0\fsources\1\0\1\tname\nemoji\1\0\1\tname\nspell\1\0\1\tname\18latex_symbols\1\0\1\tname\vbuffer\1\0\1\tname\ttmux\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\fsnippet\vexpand\1\0\0\0\f<S-Tab>\1\3\0\0\6i\6s\n<Tab>\1\3\0\0\6i\6s\n<C-e>\nclose\n<C-f>\n<C-d>\16scroll_docs\n<C-j>\21select_next_item\n<C-k>\21select_prev_item\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\vinsert\vpreset\fmapping\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\fsorting\16comparators\1\0\0\norder\vlength\14sort_text\nunder\25cmp-under-comparator\nscore\nexact\voffset\vwindow\1\0\0\18documentation\vborder\1\0\0\17CmpDocBorder\15completion\1\0\0\1\0\3\17winhighlight/Normal:Pmenu,FloatBorder:Pmenu,Search:None\17side_padding\3\0\15col_offset\3����\15\nsetup\0\0\flspkind\23cmp.config.compare\0\tinfo\ninfo_\21cmp.utils.window\0\0\0\bcmp\ttype\1\0\0\tkind\bget\21modules.ui.icons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "git@github.com:hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "git@github.com:NvChad/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n^\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireO\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\thook\1\0\0\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "git@github.com:terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    after = { "lualine.nvim", "lsp_signature.nvim" },
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27modules.completion.lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "git@github.com:neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\n�\15\0\0\a\0009\0C6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\0025\3#\0005\4\26\0005\5\27\0=\5\28\0045\5\30\0005\6\29\0=\6\31\0055\6 \0=\6!\5=\5\"\4=\4$\0035\4%\0005\5&\0=\5\28\0045\5(\0005\6'\0=\6\31\0055\6)\0=\6!\5=\5\"\4=\4*\3=\3+\0025\3-\0005\4,\0=\4.\0035\0040\0005\5/\0=\5\31\4=\4\"\3=\0031\0025\0034\0005\0042\0005\0053\0=\5\"\4=\0045\0035\0046\0=\0047\3=\0038\2B\0\2\1K\0\1\0\fdefault\freplace\1\0\1\bcmd\bsed\tfind\1\0\0\1\2\0\0\16ignore-case\1\0\1\bcmd\arg\19replace_engine\1\0\0\1\0\3\ticon\b[I]\nvalue\18--ignore-case\tdesc\16ignore case\bsed\1\0\0\1\0\1\bcmd\bsed\16find_engine\aag\1\0\3\ticon\b[H]\nvalue\r--hidden\tdesc\16hidden file\1\0\0\1\0\3\ticon\b[I]\nvalue\a-i\tdesc\16ignore case\1\3\0\0\14--vimgrep\a-s\1\0\1\bcmd\aag\arg\1\0\0\foptions\vhidden\1\0\3\ticon\b[H]\nvalue\r--hidden\tdesc\16hidden file\16ignore-case\1\0\0\1\0\3\ticon\b[I]\nvalue\18--ignore-case\tdesc\16ignore case\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\1\bcmd\arg\fmapping\25toggle_ignore_hidden\1\0\3\bcmd=<cmd>lua require('spectre').change_options('hidden')<CR>\tdesc\25toggle search hidden\bmap\ath\23toggle_ignore_case\1\0\3\bcmdB<cmd>lua require('spectre').change_options('ignore-case')<CR>\tdesc\23toggle ignore case\bmap\ati\23toggle_live_update\1\0\3\bcmd9<cmd>lua require('spectre').toggle_live_update()<CR>\tdesc'update change when vim write file.\bmap\atu\21change_view_mode\1\0\3\bcmd2<cmd>lua require('spectre').change_view()<CR>\tdesc\28change result view mode\bmap\14<leader>v\16run_replace\1\0\3\bcmd:<cmd>lua require('spectre.actions').run_replace()<CR>\tdesc\16replace all\bmap\14<leader>R\21show_option_menu\1\0\3\bcmd3<cmd>lua require('spectre').show_options()<CR>\tdesc\16show option\bmap\14<leader>o\16replace_cmd\1\0\3\bcmd:<cmd>lua require('spectre.actions').replace_cmd()<CR>\tdesc\30input replace vim command\bmap\14<leader>c\15send_to_qf\1\0\3\bcmd9<cmd>lua require('spectre.actions').send_to_qf()<CR>\tdesc\30send all item to quickfix\bmap\14<leader>q\15enter_file\1\0\3\bcmd;<cmd>lua require('spectre.actions').select_entry()<CR>\tdesc\22goto current file\bmap\t<cr>\16toggle_line\1\0\0\1\0\3\bcmd2<cmd>lua require('spectre').toggle_line()<CR>\tdesc\24toggle current item\bmap\add\1\0\6\19color_devicons\2\16live_update\2\20replace_vim_cmd\bcdo\23is_open_target_win\2\19is_insert_mode\1\ropen_cmd\tvnew\nsetup\fspectre\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-spectre",
    url = "git@github.com:windwp/nvim-spectre"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "git@github.com:kylechui/nvim-surround"
  },
  ["nvim-tmux-navigation"] = {
    cond = { "\27LJ\2\nV\0\0\3\0\4\1\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\t\0\0\0X\0\2�+\0\1\0X\1\1�+\0\2\0L\0\2\0\20exists(\"$TMUX\")\14nvim_eval\bapi\bvim\0\0" },
    config = { "\27LJ\2\n^\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\24disable_when_zoomed\2\nsetup\25nvim-tmux-navigation\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-tmux-navigation",
    url = "git@github.com:alexghergh/nvim-tmux-navigation"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\ny\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3�)\1\15\0L\1\2\0X\1\b�9\1\0\0\a\1\2\0X\1\5�6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14direction��̙\19����\3�\2\1\0\4\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\0\0=\3\6\0026\3\a\0009\3\b\0039\3\t\3=\3\t\2B\0\2\1K\0\1\0\nshell\6o\bvim\20shade_filetypes\tsize\1\0\t\14direction\rvertical\17open_mapping\n<C-t>\18close_on_exit\2\17persist_size\2\20insert_mappings\2\20start_in_insert\2\19shading_factor\0061\20shade_terminals\1\17hide_numbers\2\0\nsetup\15toggleterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua",
    url = "git@github.com:akinsho/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n�\n\0\0\b\0000\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0005\5\b\0005\6\t\0=\6\n\0055\6\v\0=\6\f\5=\5\r\4=\4\14\0035\4\15\0005\5\16\0=\5\14\4=\4\17\3=\3\18\0025\3\19\0=\3\20\0025\3\21\0004\4\0\0=\4\22\3=\3\23\0025\3\24\0004\4\0\0=\4\25\3=\3\26\0025\3\27\0005\4\28\0=\4\29\3=\3\30\0025\3\31\0=\3\n\0025\3 \0=\3!\0025\3\"\0=\3#\0025\3-\0005\4$\0005\5%\0005\6'\0005\a&\0=\a(\0065\a)\0=\a*\6=\6+\5=\5,\4=\4.\3=\3/\2B\0\2\1K\0\1\0\factions\14open_file\1\0\0\18window_picker\fexclude\fbuftype\1\4\0\0\vnofile\rterminal\thelp\rfiletype\1\0\0\1\a\0\0\vnotify\vpacker\aqf\tdiff\rfugitive\18fugitiveblame\1\0\2\nchars)ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\venable\2\1\0\1\18resize_window\1\24filesystem_watchers\1\0\2\19debounce_delay\0032\venable\2\ntrash\1\0\2\bcmd\brip\20require_confirm\2\1\0\2\ftimeout\3�\3\vignore\1\ffilters\vcustom\1\5\0\0\v^.git$\14.DS_Store\16__pycache__\26*/packer_compiled.lua\1\0\1\rdotfiles\1\16system_open\targs\1\0\1\bcmd\topen\24update_focused_file\16ignore_list\1\0\2\16update_root\2\venable\2\23hijack_directories\1\0\2\venable\2\14auto_open\2\rrenderer\19indent_markers\1\0\3\vcorner\t└ \tedge\t│ \tnone\a  \1\0\1\venable\2\nicons\vglyphs\vfolder\1\0\b\15empty_open\b\15arrow_open\5\fsymlink\b\topen\b\fdefault\b\17symlink_open\b\17arrow_closed\5\nempty\b\bgit\1\0\a\fignored\b\frenamed\b\runmerged\bשׂ\runstaged\b\vstaged\b\fdeleted\b\14untracked\bﲉ\1\0\2\fdefault\b\fsymlink\b\1\0\2\fpadding\6 \18symlink_arrow\n  \1\0\1\25root_folder_modifier\a:e\tview\1\0\3\nwidth\3\16\tside\nright\18adaptive_size\1\1\0\6\18hijack_cursor\2\fsort_by\15extensions\23reload_on_bufenter\2\24prefer_startup_root\2\20respect_buf_cwd\2\18disable_netrw\2\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "git@github.com:kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-hint-textobject", "nvim-treesitter-context", "refactoring.nvim", "vim-matchup", "nvim-treesitter-textobjects", "zen-mode.nvim", "nvim-ts-context-commentstring" },
    config = { "\27LJ\2\n�\n\0\0\r\0008\0Q6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0004\4\0\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0'\3\6\0004\4\0\0B\0\4\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0005\3\v\0=\3\f\0025\3\r\0005\4\14\0=\4\15\3=\3\16\0025\3\17\0=\3\18\0025\3\19\0=\3\20\0025\3\21\0005\4\22\0=\4\23\3=\3\24\0025\3\28\0005\4\25\0005\5\26\0=\5\27\4=\4\29\0035\4\30\0005\5\31\0=\5 \0045\5!\0=\5\"\0045\5#\0=\5$\0045\5%\0=\5&\4=\4'\3=\3(\0025\3)\0=\3*\2B\0\2\0016\0\a\0'\2+\0B\0\2\2+\1\2\0=\1,\0006\0\a\0'\2-\0B\0\2\0029\1.\0B\1\1\0026\2/\0\18\4\1\0B\2\2\4H\5\t�9\a0\0069\b0\0069\b1\b\18\n\b\0009\b2\b'\v3\0'\f4\0B\b\4\2=\b1\aF\5\3\3R\5�\1279\0025\0'\0037\0=\0036\2K\0\1\0\rmarkdown\tocto\27filetype_to_parsername\20git@github.com:\24https://github.com/\tgsub\burl\17install_info\npairs\23get_parser_configs\28nvim-treesitter.parsers\15prefer_git\28nvim-treesitter.install\frainbow\1\0\3\venable\2\19max_file_lines\3�\a\18extended_mode\2\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\17@class.outer\a[]\20@function.outer\24goto_previous_start\1\0\2\a[m\17@class.outer\a[[\20@function.outer\18goto_next_end\1\0\2\a]M\17@class.outer\a]]\20@function.outer\20goto_next_start\1\0\2\a]m\17@class.outer\a][\20@function.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aac\17@class.outer\aic\17@class.inner\aaf\20@function.outer\aif\20@function.inner\1\0\1\venable\2\16lsp_interop\25peek_definition_code\1\0\2\15<leader>sd\20@function.outer\15<leader>sD\17@class.outer\1\0\2\venable\2\vborder\tnone\fmatchup\1\0\1\venable\2\26context_commentstring\1\0\2\venable\2\19enable_autocmd\1\14highlight\fdisable\1\3\0\0\bvim\thelp\1\0\2\venable\2&additional_vim_regex_highlighting\1\19ignore_install\1\2\0\0\vphpdoc\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\26nvim_set_option_value\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "git@github.com:nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "git@github.com:romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "git@github.com:nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "git@github.com:JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-hint-textobject"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/nvim-ts-hint-textobject",
    url = "git@github.com:mfussenegger/nvim-ts-hint-textobject"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "git@github.com:kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    commands = { "Octo" },
    config = { "\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\19default_remote\1\0\0\1\3\0\0\rupstream\vorigin\nsetup\tocto\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/octo.nvim",
    url = "git@github.com:pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "git@github.com:wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "git@github.com:nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/popfix",
    url = "git@github.com:RishabhRD/popfix"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/popup.nvim",
    url = "git@github.com:nvim-lua/popup.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\27prompt_func_param_type\1\0\4\6c\2\ago\2\tjava\2\bcpp\2\28prompt_func_return_type\1\0\0\1\0\4\6c\2\ago\2\tjava\2\bcpp\2\nsetup\16refactoring\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/refactoring.nvim",
    url = "git@github.com:ThePrimeagen/refactoring.nvim"
  },
  ["rose-pine"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\6\29disable_float_background\1\23disable_background\2\22dim_nc_background\1\20bold_vert_split\2\17dark_variant\tmoon\20disable_italics\1\nsetup\14rose-pine\frequire\0" },
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "git@github.com:rose-pine/neovim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\n�\1\0\1\5\0\6\0\t6\1\0\0'\3\1\0B\1\2\0029\1\2\0015\3\3\0005\4\4\0=\4\5\3B\1\2\1K\0\1\0\17handler_opts\1\2\0\0\vdouble\1\0\6\16hint_enable\2\ffix_pos\2\17hi_parameter\vSearch\16use_lspsaga\1\20floating_window\2\tbind\2\14on_attach\18lsp_signature\frequire�\t\1\0\5\0'\0;6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\4\0B\0\2\0015\0\29\0005\1\b\0006\2\5\0'\4\6\0B\2\2\0029\2\a\2=\2\t\0013\2\n\0=\2\v\0015\2\f\0=\2\r\0015\2\22\0004\3\t\0005\4\14\0>\4\1\0035\4\15\0>\4\2\0035\4\16\0>\4\3\0035\4\17\0>\4\4\0035\4\18\0>\4\5\0035\4\19\0>\4\6\0035\4\20\0>\4\a\0035\4\21\0>\4\b\3=\3\23\2=\2\24\0015\2\25\0005\3\26\0=\3\27\2=\2\28\1=\1\30\0005\1\31\0=\1 \0005\1\"\0005\2!\0=\2#\1=\1$\0006\1\5\0'\3%\0B\1\2\0029\1&\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\15rust-tools\bdap\fadapter\1\0\0\1\0\3\tname\frt_lldb\fcommand\16lldb-vscode\ttype\15executable\vserver\1\0\1\15standalone\2\ntools\1\0\0\16crate_graph\30enabled_graphviz_backends\0017\0\0\bbmp\fcgimage\ncanon\bdot\agv\txdot\fxdot1.2\fxdot1.4\beps\bexr\bfig\agd\bgd2\bgif\bgtk\bico\tcmap\nismap\timap\ncmapx\fimap_np\rcmapx_np\bjpg\tjpeg\bjpe\bjp2\tjson\njson0\rdot_json\14xdot_json\bpdf\bpic\bpct\tpict\nplain\14plain-ext\bpng\bpov\aps\bps2\bpsd\bsgi\bsvg\tsvgz\btga\ttiff\btif\atk\bvml\tvmlz\twbmp\twebp\txlib\bx11\1\0\2\tfull\2\fbackend\bx11\18hover_actions\vborder\1\0\1\15auto_focus\1\1\3\0\0\b│\16FloatBorder\1\3\0\0\b╰\16FloatBorder\1\3\0\0\b─\16FloatBorder\1\3\0\0\b╯\16FloatBorder\1\3\0\0\b│\16FloatBorder\1\3\0\0\b╮\16FloatBorder\1\3\0\0\b─\16FloatBorder\1\3\0\0\b╭\16FloatBorder\16inlay_hints\1\0\n\18max_len_align\1\26max_len_align_padding\3\1\25show_parameter_hints\2\16right_align\1\tauto\2\24right_align_padding\3\a\22only_current_line\1\14highlight\fComment\27parameter_hints_prefix\b<- \23other_hints_prefix\b=> \19on_initialized\0\rexecutor\1\0\1%reload_workspace_from_cargo_toml\2\rtermopen\25rust-tools/executors\frequire\31packadd lsp_signature.nvim\27packadd nvim-lspconfig\17nvim_command\bapi\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "git@github.com:simrat39/rust-tools.nvim"
  },
  ["sqlite.lua"] = {
    load_after = {
      ["telescope-frecency.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "git@github.com:kkharji/sqlite.lua"
  },
  ["stabilize.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/stabilize.nvim",
    url = "git@github.com:luukvbaal/stabilize.nvim"
  },
  tablify = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/tablify",
    url = "git@github.com:Stormherz/tablify"
  },
  ["telescope-emoji.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/telescope-emoji.nvim",
    url = "git@github.com:xiyaowong/telescope-emoji.nvim"
  },
  ["telescope-frecency.nvim"] = {
    after = { "sqlite.lua", "telescope-zoxide" },
    load_after = {
      ["telescope-fzf-native.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "git@github.com:nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    after = { "telescope-frecency.nvim" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "git@github.com:nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-zoxide"] = {
    load_after = {
      ["telescope-frecency.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/telescope-zoxide",
    url = "git@github.com:jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    after = { "octo.nvim", "telescope-fzf-native.nvim", "cheatsheet.nvim", "telescope-emoji.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\2\nA\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\17:normal! zx\"\17nvim_command\bapi\bvimM\1\1\6\1\5\0\v-\1\0\0009\1\0\1\18\3\1\0009\1\1\0015\4\3\0003\5\2\0=\5\4\4B\1\3\1+\1\2\0002\0\0�L\1\2\0\0�\tpost\1\0\0\0\fenhance\vselect�\1\0\1\t\0\14\0\0266\1\0\0'\3\1\0B\1\2\0029\1\2\1B\1\1\0026\2\3\0009\2\4\0029\2\5\0029\4\6\1'\5\a\0B\2\3\0026\3\0\0'\5\b\0B\3\2\0029\3\t\3\18\5\0\0B\3\2\0016\3\3\0009\3\n\0036\5\v\0009\5\f\5'\a\r\0\18\b\2\0B\5\3\0A\3\0\1K\0\1\0\18silent lcd %s\vformat\vstring\bcmd\nclose\22telescope.actions\t:p:h\tpath\16fnamemodify\afn\bvim\23get_selected_entry\28telescope.actions.state\frequire<\0\1\a\0\5\0\b5\1\3\0\18\4\0\0009\2\0\0'\5\1\0'\6\2\0B\2\4\2=\2\4\1L\1\2\0\vprompt\1\0\0\a.*\a%s\tgsub/\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\16:normal! zx\bcmd\bvimM\1\1\6\1\5\0\v-\1\0\0009\1\0\1\18\3\1\0009\1\1\0015\4\3\0003\5\2\0=\5\4\4B\1\3\1+\1\2\0002\0\0�L\1\2\0\0�\tpost\1\0\0\0\fenhance\vselect�\19\1\0\v\0^\0�\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0B\0\2\0016\0\b\0'\2\t\0B\0\2\0025\1\n\0003\2\v\0=\2\f\0016\2\b\0'\4\r\0B\2\2\0029\2\14\0025\0049\0005\5\15\0005\6\16\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\0055\6\28\0005\a\23\0005\b\22\0=\b\24\a6\b\b\0'\n\25\0B\b\2\0029\b\26\b=\b\27\a=\a\29\0065\a\30\0006\b\b\0'\n\25\0B\b\2\0029\b\26\b=\b\31\a=\a \6=\6!\0055\6#\0005\a\"\0=\a$\0065\a%\0=\a&\6=\6'\0055\6(\0=\6)\0056\6\b\0'\b*\0B\6\2\0029\6+\6=\6,\0056\6\b\0'\b-\0B\6\2\0029\6.\0069\6/\6=\0060\0056\6\b\0'\b-\0B\6\2\0029\0061\0069\6/\6=\0062\0056\6\b\0'\b-\0B\6\2\0029\0063\0069\6/\6=\0064\0056\6\b\0'\b*\0B\6\2\0029\0065\6=\0066\0056\6\b\0'\b-\0B\6\2\0029\0067\6=\0067\0054\6\0\0=\0068\5=\5:\0045\5<\0005\6;\0=\6=\0055\6>\0005\a?\0=\a@\6=\6A\5=\5B\0045\5C\0=\1D\0055\6I\0005\aH\0005\bF\0003\tE\0=\tG\b=\b \a=\a!\6=\6J\5=\1K\5=\1L\0055\6N\0003\aM\0=\aO\0063\aP\0=\a\f\6=\6Q\5=\1R\0055\6S\0=\6T\0055\6U\0005\aV\0=\a'\6=\6W\0055\6X\0=\6Y\5=\5Z\4B\2\2\0016\2\b\0'\4\r\0B\2\2\0029\2[\2'\4=\0B\2\2\0016\2\b\0'\4\r\0B\2\2\0029\2[\2'\4\\\0B\2\2\0016\2\b\0'\4\r\0B\2\2\0029\2[\2'\4A\0B\2\2\0016\2\b\0'\4\r\0B\2\2\0029\2[\2'\4]\0B\2\2\0012\0\0�K\0\1\0\nemoji\vzoxide\19load_extension\fpickers\21lsp_code_actions\1\0\2\ntheme\vcursor\17initial_mode\vnormal\19lsp_references\1\0\2\nwidth\4����\t����\3\vheight\4����\t����\3\1\0\2\ntheme\vcursor\17initial_mode\vnormal\16diagnostics\1\0\1\17initial_mode\vnormal\roldfiles\14live_grep\0\23on_input_filter_cb\1\0\0\0\16grep_string\14git_files\15find_files\1\0\0\1\0\0\acd\1\0\0\0\fbuffers\1\0\0\15extensions\rfrecency\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\1\0\2\16show_scores\2\19show_unindexed\2\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\nfuzzy\2\28override_generic_sorter\2\25override_file_sorter\2\rdefaults\1\0\0\vborder\27buffer_previewer_maker\19generic_sorter\29get_generic_fuzzy_sorter\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\16file_sorter\19get_fuzzy_file\22telescope.sorters\25file_ignore_patterns\1\v\0\0\24packer_compiled.lua\19static_content\17node_modules\n.git/\v.cache\f%.class\n%.pdf\n%.mkv\n%.mp4\n%.zip\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\3\nwidth\4����\3����\3\19preview_cutoff\3x\vheight\4����\t����\3\1\0\3\20prompt_position\btop\18results_width\4����\t����\3\18preview_width\4����\t����\3\rmappings\6n\6q\1\0\0\6i\1\0\0\n<Esc>\nclose\22telescope.actions\n<C-a>\1\0\0\1\2\1\0\f<esc>0i\ttype\fcommand\22vimgrep_arguments\1\t\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\r--hidden\17path_display\1\2\0\0\rabsolute\16borderchars\1\t\0\0\b─\b│\b─\b│\b┌\b┐\b┘\b└\1\0\v\20scroll_strategy\nlimit\17entry_prefix\6 \17initial_mode\vinsert\18prompt_prefix\n  \19color_devicons\2\21sorting_strategy\14ascending\23selection_strategy\nreset\20selection_caret\b» \rwinblend\3\0\18results_title\1\20layout_strategy\15horizontal\nsetup\14telescope\20attach_mappings\0\1\0\1\vhidden\2\26telescope.actions.set\frequire\29packadd telescope-zoxide!packadd telescope-emoji.nvim$packadd telescope-frecency.nvim&packadd telescope-fzf-native.nvim\23packadd sqlite.lua\17nvim_command\bapi\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "git@github.com:nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    config = { "\27LJ\2\n�\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\nsigns\1\0\5\nother\b﫠\thint\b\nerror\b\fwarning\b\16information\b\14auto_jump\1\2\0\0\20lsp_definitions\1\0\b\16fold_closed\b\14auto_fold\1\14fold_open\b\17indent_lines\1\tmode\25document_diagnostics\15auto_close\2\29use_lsp_diagnostic_signs\1\17auto_preview\2\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "git@github.com:folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\3>\3\1\2B\0\2\1K\0\1\0\fexclude\1\2\0\0\n.git*\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\0032\15treesitter\2\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\rinactive\2\nalpha\4\0����\3\nsetup\rtwilight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "git@github.com:folke/twilight.nvim"
  },
  ["vim-bazel"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-bazel",
    url = "git@github.com:bazelbuild/vim-bazel"
  },
  ["vim-cool"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-cool",
    url = "git@github.com:romainl/vim-cool"
  },
  ["vim-easy-align"] = {
    commands = { "EasyAlign" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "git@github.com:junegunn/vim-easy-align"
  },
  ["vim-eft"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-eft",
    url = "git@github.com:hrsh7th/vim-eft"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "G", "Ggrep", "GBrowse" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "git@github.com:tpope/vim-fugitive"
  },
  ["vim-go"] = {
    config = { "\27LJ\2\n�\1\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0K\0\1\0\31go_code_completion_enabled\27go_def_mapping_enabled\30go_doc_keywordprg_enabled\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "git@github.com:fatih/vim-go"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\23filetypes_denylist\1\v\0\0\nalpha\14dashboard\rDoomInfo\rfugitive\thelp\tnorg\rNvimTree\fOutline\vpacker\15toggleterm\14providers\1\0\2\17under_cursor\1\ndelay\3d\1\4\0\0\blsp\15treesitter\nregex\14configure\15illuminate\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "git@github.com:RRethy/vim-illuminate"
  },
  ["vim-maktaba"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/vim-maktaba",
    url = "git@github.com:google/vim-maktaba"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "git@github.com:andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "git@github.com:tpope/vim-repeat"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "git@github.com:tpope/vim-sleuth"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "git@github.com:dstein64/vim-startuptime"
  },
  vimtex = {
    config = { "\27LJ\2\n�\5\0\0\3\0\r\0\0226\0\0\0009\0\1\0\15\0\0\0X\1\f�6\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0'\1\a\0=\1\6\0006\0\2\0009\0\3\0'\1\t\0=\1\b\0006\0\2\0009\0\n\0009\0\v\0'\2\f\0B\0\2\1K\0\1\0�\3augroup vimtex_mac\n    autocmd!\n    autocmd User VimtexEventCompileSuccess call UpdateSkim()\naugroup END\n\nfunction! UpdateSkim() abort\n    let l:out = b:vimtex.out()\n    let l:src_file_path = expand('%:p')\n    let l:cmd = [g:vimtex_view_general_viewer, '-r']\n\n    if !empty(system('pgrep Skim'))\n    call extend(l:cmd, ['-g'])\n    endif\n\n    call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])\nendfunction\n  \17nvim_command\bapi\23-r @line @pdf @tex vimtex_view_general_options>/Applications/Skim.app/Contents/SharedSupport/displayline\31vimtex_view_general_viewer\tskim\23vimtex_view_method\6g\bvim\vis_mac\20__editor_global\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "git@github.com:lervag/vimtex"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "git@github.com:folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    after = { "fzy-lua-native" },
    config = { "\27LJ\2\n \0\2\3\0\1\0\6\6\1\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\5\28\0\2\4\0\1\0\4'\2\0\0\18\3\1\0&\2\3\2L\2\2\0\t �\a\1\0\15\0/\3V6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0019\1\6\0'\3\a\0)\4\0\0B\1\3\0019\1\6\0'\3\b\0004\4\3\0009\5\t\0009\a\n\0005\t\v\0009\n\f\0B\n\1\2=\n\r\tB\a\2\0029\b\14\0B\b\1\0024\t\4\0009\n\15\0003\f\16\0B\n\2\2>\n\1\t9\n\17\0B\n\1\2>\n\2\t9\n\18\0005\f\20\0004\r\3\0003\14\19\0>\14\1\r=\r\21\fB\n\2\0?\n\0\0B\5\4\0?\5\1\0B\1\3\0019\1\22\0009\3\23\0005\5\24\0009\6\25\0B\6\1\2=\6\26\0059\6\27\0B\6\1\2=\6\28\0055\6\29\0009\a\30\0B\a\1\2>\a\2\0069\a\31\0005\t \0005\n!\0=\n\"\tB\a\2\0?\a\0\0=\6#\0055\6$\0009\a%\0B\a\1\0?\a\2\0=\6&\5B\3\2\0A\1\0\0029\2'\0005\4(\0009\5\27\0B\5\1\2=\5\28\4B\2\2\0029\3\6\0'\5)\0009\6*\0005\b+\0=\1,\b=\2-\b=\2.\bB\6\2\0A\3\1\1K\0\1\0\15substitute\6/\6:\1\0\0\17renderer_mux\rrenderer\1\0\1\24apply_incsearch_fix\2\22wildmenu_renderer\nright\24popupmenu_scrollbar\1\2\0\0\6 \tleft\nicons\1\0\3\6+\b\6h\b\6a\b\1\0\1\nflags\n a + \27popupmenu_buffer_flags\23popupmenu_devicons\1\2\0\0\6 \16highlighter\24lua_fzy_highlighter\18empty_message)popupmenu_empty_message_with_spinner\1\0\1\vborder\frounded\27popupmenu_border_theme\23popupmenu_renderer\tdraw\1\0\0\0\vresult\fhistory\0\ncheck\24vim_search_pipeline\17fuzzy_filter\19lua_fzy_filter\1\0\2\15use_python\3\0\nfuzzy\3\1\21cmdline_pipeline\vbranch\rpipeline\29use_python_remote_plugin\15set_option\nmodes\1\0\0\1\4\0\0\6:\6/\6?\nsetup\vwilder\frequire\a����\4\3����\4\5����\4\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/wilder.nvim",
    url = "git@github.com:gelguy/wilder.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/aarnphm/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "git@github.com:folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^octo"] = "octo.nvim",
  ["^refactoring"] = "refactoring.nvim",
  ["^spectre"] = "nvim-spectre"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: copilot.vim
time([[Setup for copilot.vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\5\25copilot_tab_fallback\26copilot_assume_mapped\23copilot_no_tab_map\6g\bvim\0", "setup", "copilot.vim")
time([[Setup for copilot.vim]], false)
-- Config for: mason-tool-installer.nvim
time([[Config for mason-tool-installer.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\2\17run_on_start\2\16auto_update\2\1\31\0\0\18rust-analyzer\vclangd\31typescript-language-server\15eslint-lsp\befm\31dockerfile-language-server\ngopls\rrnix-lsp\fpyright\njdtls\25bash-language-server\29grammarly-languageserver\24lua-language-server\vstylua\vselene\nblack\nisort\ryamllint\17clang-format\bbuf\vpylint\rprettier\15shellcheck\nshfmt\tvint\15buildifier\24vim-language-server\vtflint\ajq\fyamlfmt\nsetup\25mason-tool-installer\frequire\0", "config", "mason-tool-installer.nvim")
time([[Config for mason-tool-installer.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\nm\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\fshebang\1\0\0\1\0\1\tdash\ash\nsetup\rfiletype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\6\29disable_float_background\1\23disable_background\2\22dim_nc_background\1\20bold_vert_split\2\17dark_variant\tmoon\20disable_italics\1\nsetup\14rose-pine\frequire\0", "config", "rose-pine")
time([[Config for rose-pine]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n�\24\0\1\4\0�\1\0�\0025\1\3\0005\2\1\0009\3\0\0=\3\2\2=\2\4\0015\2\6\0009\3\5\0=\3\a\0029\3\b\0=\3\2\0025\3\t\0=\3\n\2=\2\v\0015\2\f\0009\3\b\0=\3\a\0029\3\5\0=\3\2\2=\2\r\0015\2\15\0009\3\14\0=\3\a\2=\2\16\0015\2\17\0009\3\14\0=\3\a\2=\2\18\0015\2\19\0009\3\14\0=\3\a\2=\2\20\0015\2\22\0009\3\21\0=\3\2\0029\3\14\0=\3\a\2=\2\23\0015\2\24\0009\3\21\0=\3\2\2=\2\25\0015\2\26\0009\3\21\0=\3\2\2=\2\27\0015\2\28\0009\3\21\0=\3\2\2=\2\29\0015\2\30\0009\3\21\0=\3\2\2=\2\31\0015\2 \0009\3\21\0=\3!\2=\2\"\0015\2#\0009\3\14\0=\3\a\0029\3$\0=\3\2\2=\2%\0015\2'\0009\3&\0=\3\2\0025\3(\0=\3\n\2=\2)\0015\2*\0009\3\21\0=\3\2\2=\2+\0015\2-\0009\3,\0=\3\2\2=\2.\0015\0020\0009\3/\0=\3\2\2=\0021\0015\0023\0009\0032\0=\3\2\2=\0024\0015\0025\0009\0032\0=\3\2\2=\0026\0015\0028\0009\0037\0=\3\2\2=\0029\0015\2;\0009\3:\0=\3\2\2=\2<\0015\2=\0009\3:\0=\3\2\2=\2>\0015\2?\0009\3:\0=\3\2\2=\2@\0015\2B\0009\3A\0=\3\2\2=\2C\0015\2D\0009\3:\0=\3\2\2=\2E\0015\2G\0009\3F\0=\3\2\2=\2H\0015\2I\0009\3F\0=\3\2\2=\2J\0015\2K\0009\3:\0=\3\2\2=\2L\0015\2M\0009\3A\0=\3\2\2=\2N\0015\2O\0009\3:\0=\3\2\0025\3P\0=\3\n\2=\2Q\0015\2R\0009\3,\0=\3\2\0025\3S\0=\3\n\2=\2T\0015\2V\0009\3U\0=\3\2\0025\3W\0=\3\n\2=\2X\0015\2Y\0009\3&\0=\3\2\2=\2Z\0015\2[\0009\3U\0=\3\2\0024\3\0\0=\3\n\2=\2\\\0015\2]\0009\3\21\0=\3\2\2=\2^\0015\2_\0009\0037\0=\3\2\2=\2`\0015\2a\0009\3U\0=\3\2\2=\2b\0015\2c\0009\3\b\0=\3\2\0024\3\0\0=\3\n\2=\2d\0015\2f\0009\3e\0=\3\2\0029\3&\0=\3\a\2=\2g\0015\2h\0009\3e\0=\3\2\0029\3,\0=\3\a\2=\2i\0015\2j\0009\3e\0=\3\2\0029\3U\0=\3\a\2=\2k\0015\2l\0009\3F\0=\3\2\2=\2m\0015\2n\0009\3&\0=\3\2\2=\2o\0015\2q\0005\3p\0=\3\n\2=\2r\0015\2s\0009\3\21\0=\3\2\0024\3\0\0=\3\n\2=\2t\0015\2u\0009\3/\0=\3\2\2=\2v\0015\2x\0009\3w\0=\3\2\2=\2y\0015\2z\0009\3\0\0=\3\2\2=\2{\0015\2|\0009\3:\0=\3\2\2=\2}\0015\2~\0009\3,\0=\3\2\2=\2\127\0015\2�\0009\3�\0=\3\2\2=\2�\0015\2�\0009\3F\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3:\0=\3\2\2=\2�\0015\2�\0009\0037\0=\3\2\2=\2�\0015\2�\0009\3�\0=\3\2\2=\2�\0015\2�\0009\3\21\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3/\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3A\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3&\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\0037\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\0037\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3\b\0=\3\2\2=\2�\0015\2�\0009\3&\0=\3\2\2=\2�\0015\2�\0009\3&\0=\3\2\2=\2�\0015\2�\0009\3&\0=\3\2\2=\2�\0015\2�\0009\3U\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3,\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3A\0=\3\2\2=\2�\0015\2�\0009\3�\0=\3\2\2=\2�\0015\2�\0009\3/\0=\3\2\2=\2�\0015\2�\0009\3A\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3A\0=\3\2\2=\2�\0015\2�\0009\3A\0=\3\2\2=\2�\0015\2�\0009\3F\0=\3\2\2=\2�\0015\2�\0009\3A\0=\3\2\2=\2�\0015\2�\0009\3,\0=\3\2\0025\3�\0=\3\n\2=\2�\0015\2�\0009\3�\0=\3\2\2=\2�\0015\2�\0009\3�\0=\3\2\2=\2�\1L\1\2\0\f@symbol\1\0\0\18@property.cpp\1\0\0\18@property.css\1\2\0\0\vitalic\1\0\0\14@type.css\1\0\0\23@tag.attribute.tsx\1\0\0\21@constructor.tsx\1\0\0\28@constructor.typescript\1\0\0\25@property.typescript\1\2\0\0\vitalic\1\0\0\19@constant.java\1\0\0\21@constructor.lua\1\0\0\rflamingo\15@field.lua\1\0\0\20@parameter.bash\1\2\0\0\vitalic\1\0\0\27@function.builtin.bash\1\2\0\0\vitalic\1\0\0\16@label.json\1\0\0\16@field.yaml\1\0\0\19@property.toml\1\0\0\19@string.escape\1\0\0\17@text.strong\1\2\0\0\tbold\1\0\0\19@text.emphasis\1\2\0\0\vitalic\1\0\0\16@text.title\1\2\0\0\tbold\1\0\0\20@text.reference\1\2\0\0\tbold\1\0\0\18@text.literal\1\2\0\0\vitalic\1\0\0\14@text.uri\1\3\0\0\vitalic\14underline\1\0\0\n@text\1\0\0\19@tag.delimiter\1\0\0\t@tag\1\0\0\19@tag.attribute\1\2\0\0\vitalic\1\0\0\14@variable\1\0\0\ttext\n@type\1\0\0\18@string.regex\1\0\0\f@string\1\0\0\25@punctuation.bracket\1\0\0\roverlay2\27@punctuation.delimiter\1\0\0\15@namespace\1\0\0\f@method\1\0\0\1\2\0\0\vitalic\v@label\1\0\0\20@constant.macro\1\0\0\17@text.danger\1\0\0\18@text.warning\1\0\0\15@text.note\1\0\0\tbase\20@keyword.return\1\0\0\r@keyword\1\0\0\22@keyword.function\1\0\0\15@parameter\1\0\0\20@function.macro\1\0\0\14@function\1\0\0\22@variable.builtin\1\2\0\0\vitalic\1\0\0\bred\18@type.builtin\1\2\0\0\vitalic\1\0\0\22@function.builtin\1\2\0\0\vitalic\1\0\0\22@constant.builtin\1\0\0\15@exception\1\0\0\f@repeat\1\0\0\17@conditional\1\0\0\nmauve\14@constant\1\0\0\17@constructor\1\0\0\rlavender\r@boolean\1\0\0\f@number\1\0\0\v@float\1\0\0\npeach\25@punctuation.special\1\0\0\vmaroon\22@keyword.operator\1\0\0\14@operator\1\0\0\bsky\r@include\1\0\0\tteal\14@property\1\0\0\vyellow\v@field\1\0\0\16FidgetTitle\1\2\0\0\tbold\1\0\0\tblue\15FidgetTask\rsurface2\1\0\0 LspDiagnosticsUnderlineHint\asp\1\0\0\"LspDiagnosticsVirtualTextHint\1\0\0\23LspDiagnosticsHint\1\0\0\30LspDiagnosticsDefaultHint\1\0\0\19DiagnosticHint\1\0\0\30DiagnosticVirtualTextHint\1\0\0\14rosewater\30DiagnosticVirtualTextInfo\1\0\0\30DiagnosticVirtualTextWarn\1\0\0\31DiagnosticVirtualTextError\1\0\0\tnone\14IncSearch\1\0\0\vSearch\nstyle\1\2\0\0\tbold\tpink\abg\1\0\0\rsurface1\17CursorLineNr\1\0\0\afg\1\0\0\ngreen�\14\1\0\a\0E\0S6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0026\3\b\0009\3\t\0039\3\n\3'\5\v\0B\3\2\2'\4\f\0&\3\4\3=\3\r\0025\3\15\0005\4\14\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0034\4\0\0=\4\31\0034\4\0\0=\4 \0034\4\0\0=\4!\0034\4\0\0=\4\"\3=\3#\0025\3$\0005\4%\0005\5'\0005\6&\0=\6(\0055\6)\0=\6*\0055\6+\0=\6,\0055\6-\0=\6.\5=\5/\0045\0051\0005\0060\0=\6(\0055\0062\0=\6*\0055\0063\0=\6,\0055\0064\0=\6.\5=\0055\4=\0046\0035\0047\0=\0048\0035\0049\0=\4:\0035\4;\0=\4<\3=\3=\0025\3?\0005\4>\0=\4@\3=\3A\0025\3C\0003\4B\0=\4@\3=\3D\2B\0\2\1K\0\1\0\24highlight_overrides\1\0\0\0\20color_overrides\nmocha\1\0\0\1\0\25\ngreen\f#ABE9B3\rsurface1\f#575268\tpink\f#F5C2E7\14rosewater\f#F5E0DC\rsurface2\f#6E6C7E\vyellow\f#FAE3B0\tteal\f#B5E8E0\bsky\f#89DCEB\vmaroon\f#E8A2AF\npeach\f#F8BD96\rlavender\f#C9CBFF\nmauve\f#DDB6F2\bred\f#F28FAD\roverlay2\f#C3BAC6\ttext\f#D9E0EE\rflamingo\f#F2CDCD\tbase\f#1E1E2E\roverlay1\f#988BA2\tblue\f#96CDFB\rsubtext0\f#A6ADC8\rsubtext1\f#BAC2DE\rsurface0\f#302D41\roverlay0\f#6E6C7E\ncrust\f#161320\vmantle\f#1A1826\17integrations\fneotree\1\0\1\fenabled\1\bdap\1\0\2\fenabled\2\14enable_ui\2\21indent_blankline\1\0\2\fenabled\2\26colored_indent_levels\1\15native_lsp\15underlines\1\2\0\0\14underline\1\2\0\0\14underline\1\2\0\0\14underline\1\0\0\1\2\0\0\14underline\17virtual_text\16information\1\2\0\0\vitalic\rwarnings\1\2\0\0\vitalic\nhints\1\2\0\0\vitalic\verrors\1\0\0\1\2\0\0\vitalic\1\0\1\fenabled\2\1\0 \vfidget\2\14vim_sneak\1\roverseer\1\14which_key\2\15ts_rainbow\2\20symbols_outline\1\16lsp_trouble\2\14gitgutter\1\rlsp_saga\2\15treesitter\2\rmarkdown\2\vbeacon\1\fvimwiki\2\vaerial\1\tmini\1\15telekasten\1\tleap\1\15lightspeed\1\vbarbar\1\vneogit\1\rcoc_nvim\1\nnavic\1\14telescope\2\tfern\1\vnotify\1\bhop\2\14dashboard\2\rnvimtree\2\15illuminate\2\bcmp\2\rgitsigns\2\nmason\2\vstyles\14variables\fstrings\ntypes\fnumbers\rbooleans\1\3\0\0\tbold\vitalic\nloops\1\2\0\0\tbold\17conditionals\1\2\0\0\tbold\14operators\1\2\0\0\tbold\rkeywords\1\2\0\0\vitalic\14functions\1\3\0\0\vitalic\tbold\15properties\1\2\0\0\vitalic\rcomments\1\0\0\1\2\0\0\vitalic\17compile_path\16/catppuccin\ncache\fstdpath\afn\bvim\17dim_inactive\1\0\3\nshade\tdark\15percentage\4��̙\3���\3\fenabled\1\15background\1\0\2\nlight\nlatte\tdark\nmocha\1\0\3\27transparent_background\1\16term_colors\2\fflavour\nmocha\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n^\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25update_commentstring&ts_context_commentstring.internal\frequireO\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\thook\1\0\0\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Conditional loads
time([[Conditional loading of nvim-tmux-navigation]], true)
  require("packer.load")({"nvim-tmux-navigation"}, {}, _G.packer_plugins)
time([[Conditional loading of nvim-tmux-navigation]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd dressing.nvim ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SaveSession lua require("packer.load")({'auto-session'}, { cmd = "SaveSession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RestoreSession lua require("packer.load")({'auto-session'}, { cmd = "RestoreSession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DeleteSession lua require("packer.load")({'auto-session'}, { cmd = "DeleteSession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file JupyterExecute lua require("packer.load")({'jupyter_ascending.vim'}, { cmd = "JupyterExecute", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file JupyterExecuteAll lua require("packer.load")({'jupyter_ascending.vim'}, { cmd = "JupyterExecuteAll", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Octo lua require("packer.load")({'octo.nvim'}, { cmd = "Octo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Copilot lua require("packer.load")({'copilot.vim'}, { cmd = "Copilot", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file EasyAlign lua require("packer.load")({'vim-easy-align'}, { cmd = "EasyAlign", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleRefresh lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewFileHistory lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewFileHistory", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ggrep lua require("packer.load")({'vim-fugitive'}, { cmd = "Ggrep", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'vim-fugitive'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType bzl ++once lua require("packer.load")({'vim-bazel'}, { ft = "bzl" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType rst ++once lua require("packer.load")({'tablify'}, { ft = "rst" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
vim.cmd [[au FileType ipynb ++once lua require("packer.load")({'jupyter_ascending.vim'}, { ft = "ipynb" }, _G.packer_plugins)]]
vim.cmd [[au FileType latex ++once lua require("packer.load")({'cmp-latex-symbols'}, { ft = "latex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'which-key.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-cool'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'vim-cool', 'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'stabilize.nvim', 'nvim-bufferline.lua', 'vim-illuminate', 'vim-eft', 'nvim-colorizer.lua', 'nvim-treesitter'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-toggleterm.lua', 'indent-blankline.nvim', 'hop.nvim', 'gitsigns.nvim', 'fidget.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'wilder.nvim'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au LspAttach * ++once lua require("packer.load")({'lspsaga.nvim'}, { event = "LspAttach *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'alpha-nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
time([[Sourcing ftdetect script at: /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /Users/aarnphm/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
