local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

local fmt = require("luasnip.extras.fmt").fmt
local i = luasnip.insert_node
local rep = require("luasnip.extras").rep

luasnip.add_snippets("rust", {
    -- Full test module with rstest
    luasnip.snippet("rstestmod", fmt(
        [[
#[cfg(test)]
mod tests {{
    use rstest::rstest;
    use super::*;

    {}
}}
]],
        { i(1, "todo!()") }
    )),

    -- Individual rstest test function
    luasnip.snippet("rstest", fmt(
        [[
    #[rstest]
    fn {}() {{
        // arrange
        {}

        // act

        // assert
    }}
]],
        { i(1, "test_name"), i(2, "todo!()") }
    )),

    -- Individual rstest test async function
    luasnip.snippet("rstesta", fmt(
        [[
    #[rstest]
    #[tokio::test]
    async fn {}() {{
        // arrange
        {}

        // act

        // assert
    }}
]],
        { i(1, "test_name"), i(2, "todo!()") }
    )),

    -- Yew Component
    luasnip.snippet("yewc", fmt(
        [[
    #[component]
    pub fn {}() -> Html {{
        html! {{
            <h1>{{"{} Works!"}}</h1>
        }}
    }}
]],
        { i(1, "ComponentName"), rep(1) }
    )),

    -- Yew Component with Props
    luasnip.snippet("yewcp", fmt(
        [[
    #[derive(Properties, PartialEq)]
    pub struct {}Props {{
        {}
    }}

    #[component]
    pub fn {}(props: &{}Props) -> Html {{
        html! {{
            <h1>{{"{} Works!"}}</h1>
        }}
    }}
]],
        { i(1, "ComponentName"), i(2, "todo!()"), rep(1), rep(1), rep(1) }
    )),

    -- Yew Function Component
    luasnip.snippet("yewfc", fmt(
        [[
    #[component({})]
    pub fn {}() -> Html {{
        html! {{
            <h1>{{"{} Works!"}}</h1>
        }}
    }}
]],
        { i(1, "ComponentName"), i(2, "function_name"), rep(1) }
    )),

    -- Yew Function Component with Props
    luasnip.snippet("yewfcp", fmt(
        [[
    #[derive(Properties, PartialEq)]
    pub struct {}Props {{
        {}
    }}

    #[component({})]
    pub fn {}(props: &{}Props) -> Html {{
        html! {{
            <h1>{{"{} Works!"}}</h1>
        }}
    }}
]],
        { i(1, "ComponentName"), i(2, "todo!()"), rep(1), i(3, "function_name"), rep(1), rep(1) }
    )),

    -- Style Module
    luasnip.snippet("yewstm", fmt(
        [[
    mod styles {{
        use crate::utils::style::get_class;
        use stylist::style;

        {}
    }}
]],
        { i(1, "todo!()") }
    )),

    -- Style Module
    luasnip.snippet("yewst", fmt(
        [[
    pub fn {}() -> String {{
        get_class(style!(
            r#"
                {}
            "#
        ))
    }}
]],
        { i(1, "style_name"), i(2) }
    )),
})
