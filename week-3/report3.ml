(* 目的: 2つの格子点（整数の座標）を受け取り、そのマンハッタン距離を返す *)
(* manhattan : int * int -> int * int -> int *)
let manhattan (a, b) (c, d) =  abs (a - c) + abs (b - d)

(* テスト *)
let manhattan_test1 = manhattan (0, 0) (3, 4) = 7
let manhattan_test2 = manhattan (1, 1) (1, 1) = 0
let manhattan_test3 = manhattan (-1, -2) (2, 3) = 8


(* 目的: 駅名に関する情報を格納するためのレコード型を定義する *)
type ekimei_t = {
  kanji: string;
  kana: string;
  romaji: string;
  ken: string;
  shozoku: string;
}


(* 目的: ekimei_t 型のデータを受け取り、駅情報を「県名：路線名、駅名（かな）」形式の文字列で返す *)
(* hyoji : ekimei_t -> string *)
let hyoji ekimei = ekimei.ken ^ "：" 
                  ^ ekimei.shozoku ^ "、"
                  ^ ekimei.kanji ^ "（"
                  ^ ekimei.kana ^ "）"

(* テスト *)
let hyoji_test1 =
  hyoji {kanji = "茗荷谷"; kana = "みょうがだに"; romaji = "myogadani"; ken = "東京"; shozoku = "丸ノ内線"}
  = "東京：丸ノ内線、茗荷谷（みょうがだに）"

let hyoji_test2 =
  hyoji {kanji = "京都"; kana = "きょうと"; romaji = "kyoto"; ken = "京都"; shozoku = "東海道本線"}
  = "京都：東海道本線、京都（きょうと）"

let hyoji_test3 =
  hyoji {kanji = "梅田"; kana = "うめだ"; romaji = "umeda"; ken = "大阪"; shozoku = "御堂筋線"}
  = "大阪：御堂筋線、梅田（うめだ）"


(* 目的: 駅と駅の接続情報（駅間）を格納するためのレコード型を定義する *)
type ekikan_t = {
  kiten : string;   
  kenk : string;    
  shuten : string;  
  kens : string;    
  keiyu : string;   
  kyori : float;    
  jikan : int;
}
