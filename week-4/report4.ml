open Metro

let a = global_ekimei_list

(* 목적: 리스트를 받아 해당 리스트의 길이를 반환 *)
let rec length first = 
    match first with
      [] -> 0
      | _ :: rest 
        -> 1 + length rest

let length_test1 = (length [1; 2; 3; 4] = 4)
let length_test2 = (length [1; 2; 3; 4; 5; 6] = 6)
let length_test3 = (length [] = 0)

(* 목적: 로마자 역 이름과 역 정보가 든 리스트를 파라미터로 받아, 해당 로마자 역 이름을 검색해 해당하는 리스트에서 한자 역 이름과 현 정보를 반환 *)
let rec romaji_to_kanji2 namae ekimei_t = 
  match ekimei_t with 
    [] -> ("", "")
    | first :: rest 
      -> match first with { romaji; kanji; ken; _; } -> 
          if namae = romaji then (kanji, ken) 
                            else romaji_to_kanji2 namae rest

let romaji_to_kanji2_test1 = (romaji_to_kanji2 "tokyo" a = ("東京", "東京"))
let romaji_to_kanji2_test2 = (romaji_to_kanji2 "myogadani" a = ("茗荷谷", "東京"))
let romaji_to_kanji2_test3 = (romaji_to_kanji2 "wakoshi" a = ("和光市", "埼玉"))
