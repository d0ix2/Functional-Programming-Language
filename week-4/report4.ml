open Global

let a = global_ekimei_list
let b = global_ekikan_list

(* 目的:リストを受け取って、そのリストの長さを返す *)
(* length : 'a list -> list *)
let rec length first = 
    match first with
      [] -> 0
      | _ :: rest 
        -> 1 + length rest

(* test *)
let length_test1 = (length [1; 2; 3; 4] = 4)
let length_test2 = (length a = 9192)
let length_test3 = (length [] = 0)

(* 目的:ローマ字駅名と駅情報が入ったリストをパラメータとして受け取り、当該ローマ字駅名を検索して該当するリストから漢字駅名と現情報を返す *)
(* romaji_to_kanji2: string -> ekimei_t list -> string * -> string *)
let rec romaji_to_kanji2 namae ekimei_t = 
  match ekimei_t with 
    [] -> ("", "")
    | first :: rest 
      -> match first with { romaji; kanji; ken; _; } -> 
          if namae = romaji then (kanji, ken) 
                            else romaji_to_kanji2 namae rest

(* test *)
let romaji_to_kanji2_test1 = (romaji_to_kanji2 "tokyo" a = ("東京", "東京"))
let romaji_to_kanji2_test2 = (romaji_to_kanji2 "myogadani" a = ("茗荷谷", "東京"))
let romaji_to_kanji2_test3 = (romaji_to_kanji2 "wakoshi" a = ("和光市", "埼玉"))

(* 目的:駅名ペアをふたつと駅間リストを受け取って来たら、 駅間リストの中からその２駅（ペア）間の距離を返す *)
(* get_ekikan_kyori2: (string * string) -> (string * string) -> ekikan_t list -> float *)
let rec get_ekikan_kyori2 (kanji1, ken1) (kanji2, ken2) ekikan_t =
  match ekikan_t with
    [] -> infinity
    | {kiten; kenk; shuten; kens; kyori} :: rest ->
    if (kiten = kanji1 && kenk = ken1 && shuten = kanji2 && kens = ken2)
      || (kiten = kanji2 && kenk = ken2 && shuten = kanji1 && kens = ken1)
      then kyori
      else get_ekikan_kyori2 (kanji1, ken1) (kanji2, ken2) rest

(* test *)
let get_ekikan_kyori2_test1 = get_ekikan_kyori2 ("大桑", "長野") ("代々木", "東京") b = infinity
let get_ekikan_kyori2_test2 = get_ekikan_kyori2 ("新宿", "東京") ("代々木", "東京") b = 0.7
let get_ekikan_kyori2_test3 = get_ekikan_kyori2 ("新宿", "東京") ("池袋", "東京") b = 4.8
