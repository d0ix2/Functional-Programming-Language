(* r1の目的：二次方程式 ax²+bx+c=0 → 判別式(b²-4ac)の値を返す *)
(* hanbetsushiki : int -> int -> int -> int *)
let hanbetsushiki a b c = (b * b) - (4 * a * c)

(* r1のテスト*)
let test1 = hanbetsushiki 1 4 3 = 4
let test2 = hanbetsushiki 2 4 2 = 0
let test3 = hanbetsushiki 1 2 5 = -16

(* r2の目的：hanbetsushikiを利用し、二次方程式 ax²+bx+c=0の解の個数を整数で返す *)
(* kai_no_kosuu : int -> int -> int -> int *)
let kai_no_kosuu a b c =
  if hanbetsushiki a b c = 0 then 1
  else if hanbetsushiki a b c > 0 then 2
  else 0

(* r2のテスト*)
let test1 = kai_no_kosuu 1 4 3 = 2
let test2 = kai_no_kosuu 2 4 2 = 1
let test3 = kai_no_kosuu 1 2 5 = 0

(* r3の目的：report1.mlのbmiを利用し、体型を文字列で返す *)
(* taikei : float -> float -> float *)
let bmi m kg = kg /. (m ** 2.0)

let taikei m kg =
  if bmi m kg >= 18.5 && bmi m kg < 25.0 then "普通"
  else if bmi m kg < 18.5 then "低体重"
  else "肥満"

(* r3のテスト*)
let taikei_test1 = taikei 1.6 55.0 = "普通"
let taikei_test2 = taikei 1.5 80.0 = "肥満"
let taikei_test3 = taikei 1.8 40.0 = "低体重"


(* 問1：税抜き価格を受け取ったら、税込み価格を返す *)
(* shohizei : int -> int *)
let shohizei price = price + (price / 10)

(* 問1のテスト *)
let shohizei_test1 = shohizei 98 = 107
let shohizei_test2 = shohizei 100 = 110
let shohizei_test3 = shohizei 230 = 253


(* 問2：500円で一つでzeinuki円のチョコnum個を買えるか判断し、文字列を返す *)
(* choco : int -> int -> string *)
let choco zeinuki num = if shohizei (zeinuki * num) < 500 then "買える" else "買えない"

(* 問2のテスト *)
let choco_test1 = choco 75 5 = "買える"
let choco_test2 = choco 76 6 = "買えない"
let choco_test3 = choco 40 10 = "買える"
