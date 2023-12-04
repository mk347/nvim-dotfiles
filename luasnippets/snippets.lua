local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
  s("tbl center", {
    t({
      '<table align="center" cellpadding="0" cellspacing="0" border="0" width="100%">',
      '   <tr valign="top">',
      '       <td valign="top">',
      "       </td>",
      "   </tr>",
      "</table>",
    }),
  }),

  s("tbl left", {
    t({
      '<table align="left" cellpadding="0" cellspacing="0" border="0" width="100%">',
      '   <tr valign="top">',
      '       <td valign="top">',
      "       </td>",
      "   </tr>",
      "</table>",
    }),
  }),

  s("tbl lr", {

    t({
      '<table align="center" cellpadding="0" cellspacing="0" border="0" width="100%">',
      '   <tr valign="top">',

      '       <td width="50%" valign="top" style="padding-top: 0px">',

      '           <table align="center" cellpadding="0" cellspacing="0" border="0" width="100%">',
      '               <tr valign="top">',
      '                   <td valign="top" width="100%">',
      "                       <!-- Content Here -->",
      "                   </td>",
      "               </tr>",
      "           </table>",

      "       </td>",

      '       <td width="50%" valign="top" style="padding-top: 0px">',

      '           <table align="center" cellpadding="0" cellspacing="0" border="0" width="100%">',
      '               <tr valign="top">',
      '                   <td valign="top" width="100%">',
      "                       <!-- Content Here -->",
      "                   </td>",
      "               </tr>",
      "           </table>",

      "       </td>",

      "   </tr>",
      "</table>",
    }),
  }),
})
