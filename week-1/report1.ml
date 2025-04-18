(* 目的：所持金で一つ126円のチョコレートをいくつ買えるかを求める。 *)
(* int -> int *)
let chocolate yen = yen / 126 

(* test case for chocolate *)
let chocolate_test1 = (chocolate 890 = 7)
let chocolate_test2 = (chocolate 0 = 0)
let chocolate_test3 = (chocolate 1385 = 10)


(* 目的：名前を引数としてもらって、挨拶を出力する。 *)
(* string -> string *)
let aisatsu name = "こんにちは、" ^ name ^ "さん。" 

(* test case for aisatsu *)
let aisatsu_test1 = (aisatsu "doi" = "こんにちは、doiさん。")
let aisatsu_test2 = (aisatsu "lauren" = "こんにちは、laurenさん。")
let aisatsu_test3 = (aisatsu "ドイ" = "こんにちは、ドイさん。")


(* 目的：身長と体重をもらって、BMI値を求める。 *)
(* float -> float *)
let bmi m kg = kg /. (m ** 2.0)

(* test case for bmi *)
let bmi_test1 = (bmi 1.6 55. = 21.4843749999999964)
let bmi_test2 = (bmi 1.7 80. = 27.6816608996539806 )
let bmi_test3 = (bmi 1.5 40.0 = 17.7777777777777786)
