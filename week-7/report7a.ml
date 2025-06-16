open List
open Global

(* from report4.ml *)
(* 目的: 駅名ペアをふたつと駅間リストを受け取って来たら、 駅間リストの中からその２駅（ペア）間の距離を返す *)
(* get_ekikan_kyori2: (string * string) -> (string * string) -> ekikan_t list -> float *)
let rec get_ekikan_kyori2 (kanji1, ken1) (kanji2, ken2) ekikan_t =
  match ekikan_t with
    [] -> infinity
    | {kiten; kenk; shuten; kens; kyori} :: rest ->
    if (kiten = kanji1 && kenk = ken1 && shuten = kanji2 && kens = ken2)
      || (kiten = kanji2 && kenk = ken2 && shuten = kanji1 && kens = ken1)
      then kyori
      else get_ekikan_kyori2 (kanji1, ken1) (kanji2, ken2) rest

type eki_t = {
  namae : string * string;
  saitan_kyori : float;
  temae_list : (string * string) list;
}

(* 目的:　点pと最短距離が未確定の点q、および駅間のリストを受け取ったら、 get_ekikan_kyori2を使ってqがpに接続しているかを調べ、 接続していたら最短距離と手前リストが次のようになっている新しいqを返す *)
(* koushin1: eki_t -> eki_t -> ekikan_ list -> eki_t *)
let koushin1 p q ekikan_t = 
  match p with { namae = namae_p; saitan_kyori = kyori_p; temae_list = temae_list_p } ->
    match q with { namae = namae_q; saitan_kyori = kyori_q; } ->
      let pq_kyori
      = get_ekikan_kyori2 namae_p namae_q ekikan_t in
        (if kyori_q > kyori_p +. pq_kyori 
          then { namae = namae_q; 
                saitan_kyori = kyori_p +. pq_kyori; 
                temae_list = namae_q :: temae_list_p
                }
          else q)

(* テスト *)
let koushin1_test1 
  = 
  koushin1 
  {namae = ("池袋", "東京"); saitan_kyori = 0.8; temae_list = [("代々木上原", "東京")]}
  {namae = ("新宿", "東京"); saitan_kyori = 1.8; temae_list = []}
  global_ekikan_list
  =
   {namae = ("新宿", "東京"); saitan_kyori = 1.8; temae_list = []}
let koushin1_test2
  = 
  koushin1 
  {namae = ("外苑前", "東京"); saitan_kyori = infinity; temae_list = []}
   {namae = ("表参道", "東京"); saitan_kyori = infinity; temae_list = []}
  global_ekikan_list
  =
  {namae = ("表参道", "東京"); saitan_kyori = infinity; temae_list = []}
let koushin1_test3
  = 
  koushin1 
  {namae = ("日本橋", "東京"); saitan_kyori = infinity; temae_list = []}
  {namae = ("新橋", "東京"); saitan_kyori = infinity; temae_list = []}
  global_ekikan_list
  =
  {namae = ("新橋", "東京"); saitan_kyori = infinity; temae_list = []}

(* 目的:　点pと最短距離が未確定の点の集合V、および駅間のリストを受け取ったら、 V中の全ての駅について、必要に応じて更新処理を行った後の集合Vを返す *)
(* koushin: eki_t -> eki_t t -> ekikan_t t -> eki_t t *)
let koushin p lst_V ekikan_t = 
    (* update: eki_t -> eki_t *)
    let update v = 
      koushin1 p v ekikan_t
    in map update lst_V

(* テスト *)
let koushin_test1 
  = 
  koushin
  {namae = ("新宿", "東京"); saitan_kyori = 1.8; temae_list = []}
  [{namae = ("外苑前", "東京"); saitan_kyori = infinity; temae_list = []};
  {namae = ("表参道", "東京"); saitan_kyori = infinity; temae_list = []};
  {namae = ("渋谷", "東京"); saitan_kyori = infinity; temae_list = []};]
  global_ekikan_list
  =
  [{namae = ("外苑前", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("表参道", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("渋谷", "東京"); saitan_kyori = 5.2; temae_list = [("渋谷", "東京")]}]
let koushin_test2 
  = 
  koushin
  {namae = ("京橋", "東京"); saitan_kyori = 2.0; temae_list = []}
  [{namae = ("末広町", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("神田", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("三越前", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("日本橋", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("京橋", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("銀座", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("新橋", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("虎ノ門", "東京"); saitan_kyori = infinity; temae_list = []};]
   global_ekikan_list
   =
  [{namae = ("末広町", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("神田", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("三越前", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("日本橋", "東京"); saitan_kyori = 2.7; temae_list = [("日本橋", "東京")]};
   {namae = ("京橋", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("銀座", "東京"); saitan_kyori = 2.7; temae_list = [("銀座", "東京")]};
   {namae = ("新橋", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("虎ノ門", "東京"); saitan_kyori = infinity; temae_list = []}]
let koushin_test3
  =  
  koushin
  {namae = ("湯島", "東京"); saitan_kyori = 3.0; temae_list = []}
  [{namae = ("湯島", "東京"); saitan_kyori = infinity; temae_list = []};
  {namae = ("根津", "東京"); saitan_kyori = infinity; temae_list = []};
  {namae = ("千駄木", "東京"); saitan_kyori = infinity; temae_list = []};
  {namae = ("西日暮里", "東京"); saitan_kyori = infinity;temae_list = []};]
  global_ekikan_list
  =
  [{namae = ("湯島", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("根津", "東京"); saitan_kyori = 4.2; temae_list = [("根津", "東京")]};
   {namae = ("千駄木", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("西日暮里", "東京"); saitan_kyori = infinity; temae_list = []}]
