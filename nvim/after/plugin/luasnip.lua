local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- C++
-- stylua: ignore
ls.add_snippets("cpp", {
  s("cp", fmt(
    [[
    #include <bits/stdc++.h>
    using namespace std;

    int main() {{
      ios::sync_with_stdio(false);
      cin.tie(nullptr);

      {}
      return 0;
    }}
    ]], {
      i(1),
    })
  ),
})

-- stylua: ignore
ls.add_snippets("cpp", {
  s("ln", fmt(
  [[
  cout << {} << '\n';
  ]], {
    i(1),
  })
  ),
})
