open List
open Global


type eki_t = {
    namae : string * string;
    saitan_kyori : float;
    temae_list : (string * string) list;
}

exception Not_found

(* 目的:駅名ペアをふたつと駅間リストを受け取って来たら、 駅間リストの中からその２駅（ペア）間の距離を返す *)
(* get_ekikan_kyori2: (string * string) -> (string * string) -> ekikan_t list -> float *)
let rec get_ekikan_kyori2 (kanji1, ken1) (kanji2, ken2) ekikan_t =
  match ekikan_t with
  | [] -> raise Not_found
  | { kiten; kenk; shuten; kens; kyori } :: rest ->
      if (kiten = kanji1 && kenk = ken1 && shuten = kanji2 && kens = ken2)
        || (kiten = kanji2 && kenk = ken2 && shuten = kanji1 && kens = ken1)
      then kyori
      else get_ekikan_kyori2 (kanji1, ken1) (kanji2, ken2) rest


(* test *)
let get_ekikan_kyori2_test1 = get_ekikan_kyori2 ("新宿", "東京") ("代々木", "東京") global_ekikan_list = 0.7
let get_ekikan_kyori2_test2 =
  try
    let _ = get_ekikan_kyori2 ("大桑", "長野") ("代々木", "東京") global_ekikan_list in
    false
  with
  | Not_found -> true
  | _ -> false
let get_ekikan_kyori2_test3 = get_ekikan_kyori2 ("新宿", "東京") ("池袋", "東京") global_ekikan_list = 4.8


(* 目的:　点pと最短距離が未確定の点q、および駅間のリストを受け取ったら、 get_ekikan_kyori2を使ってqがpに接続しているかを調べ、 接続していたら最短距離と手前リストが次のようになっている新しいqを返す *)
(* koushin1: eki_t -> eki_t -> ekikan_ list -> eki_t *)
let koushin1 p q ekikan_t =
  match p with { namae = namae_p; saitan_kyori = kyori_p; temae_list = temae_list_p } ->
  match q with { namae = namae_q; saitan_kyori = kyori_q; } ->
    try
      let pq_kyori = get_ekikan_kyori2 namae_p namae_q ekikan_t in
      if kyori_q > kyori_p +. pq_kyori then
        { namae = namae_q;
          saitan_kyori = kyori_p +. pq_kyori;
          temae_list = namae_q :: temae_list_p }
      else q
    with Not_found -> q

(* 目的:　点pと最短距離が未確定の点の集合V、および駅間のリストを受け取ったら、 V中の全ての駅について、必要に応じて更新処理を行った後の集合Vを返す *)
(* koushin: eki_t -> eki_t t -> ekikan_t t -> eki_t t *)
let koushin p lst_V ekikan_t = 
    (* update: eki_t -> eki_t *)
    let update v = 
      koushin1 p v ekikan_t
    in map update lst_V


(* 目的:ローマ字駅名と駅情報が入ったリストをパラメータとして受け取り、当該ローマ字駅名を検索して該当するリストから漢字駅名と現情報を返す *)
(* romaji_to_kanji2: string -> ekimei_t list -> string * string *)
let rec romaji_to_kanji2 namae ekimei_t = 
  match ekimei_t with 
    [] -> ("", "")
    | first :: rest 
      -> match first with { romaji; kanji; ken; _; } -> 
          if namae = romaji then (kanji, ken) 
                            else romaji_to_kanji2 namae rest


(* test *)
let p = {
  namae = ("新宿", "東京");
  saitan_kyori = 0.0;
  temae_list = [("新宿", "東京")];
}

let q = {
  namae = ("代々木", "東京");
  saitan_kyori = infinity;
  temae_list = [];
}

let koushin1_test1 =
  let r = koushin1 p q global_ekikan_list in
  r.saitan_kyori = 0.7 && r.temae_list = [("代々木", "東京"); ("新宿", "東京")]
let koushin1_test2 =
  let q2 = { q with saitan_kyori = 0.5 } in
  koushin1 p q2 global_ekikan_list = q2
let koushin1_test3 =
  let fake_q = { namae = ("海老名", "神奈川"); saitan_kyori = 10.0; temae_list = [] } in
  koushin1 p fake_q global_ekikan_list = fake_q


exception No_such_station of string

let rec romaji_to_kanji2 namae ekimei_t =
  match ekimei_t with
  | [] -> raise (No_such_station(namae))
  | first :: rest ->
      match first with { romaji; kanji; ken; _ } ->
        if namae = romaji then (kanji, ken)
        else romaji_to_kanji2 namae rest


(* test *)
let romaji_to_kanji2_test1 = romaji_to_kanji2 "shinjuku" global_ekimei_list = ("新宿", "東京")
let romaji_to_kanji2_test2 = romaji_to_kanji2 "yoyogi" global_ekimei_list = ("代々木", "東京")
let romaji_to_kanji2_test3 =
  try
    let _ = romaji_to_kanji2 "naniwa" global_ekimei_list in false
  with No_such_station s -> s = "naniwa"
