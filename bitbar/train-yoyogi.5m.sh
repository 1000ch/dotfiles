# curl して HTML 取得
curl -s http://transit.yahoo.co.jp/station/time/23043/?gid=7171 | \
# HTML から必要な情報取り出して JSON 化
pup 'table.tblDiaDetail [id*="hh_"] json{}' | \
# JSON を良い感じに整形
jq '[.[] | { hour: .children[0].text, minutes: [.children[1].children[].children[].children[].children[].children | map(.text) | join(" ") ] }]'
