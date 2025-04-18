(* r1の目的：二次方程式 ax²+bx+c=0 → 判別式(b²-4ac)の値を返す *)
let hanbetsushiki a b c = (b * b) - (4 * a * c)

(* r2の目的：habbetsushikiを利用し、二次方程式 ax²+bx+c=0の解の個数を整数で返す *)
let kai_no_kosuu a b c =
  if hanbetsushiki a b c = 0 then 1
  else if hanbetsushiki a b c > 0 then 2
  else 0

(* r3の目的：report1.mlのbmiを利用し、体型を文字列で返す *)
let bmi m kg = kg /. (m ** 2.0)

let taikei m kg =
  if bmi m kg >= 18.5 && bmi m kg < 25.0 then "普通"
  else if bmi m kg < 18.5 then "低体重"
  else "肥満"

let taikei_test1 = taikei 1.6 55.0 = "普通"
let taikei_test2 = taikei 1.5 80.0 = "肥満"
let taikei_test3 = taikei 1.8 40.0 = "低体重"
let shohizei price = price + (price / 10)
let shohizei_test1 = shohizei 98 = 107

let choco zeinuki num = if shohizei (zeinuki * num) < 500 then "買える" else "買えない"

let choco_test1 = choco 75 5 = "買える"
let choco_test2 = choco 76 6 = "買えない"
