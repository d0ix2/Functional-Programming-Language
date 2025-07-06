open List
open Metro


type eki_t = {
    namae : string * string;
    saitan_kyori : float;
    temae_list : (string * string) list;
}

let rec get_ekikan_kyori2 (kanji1, ken1) (kanji2, ken2) ekikan_t =
  match ekikan_t with
    [] -> infinity
    | {kiten; kenk; shuten; kens; kyori} :: rest ->
    if (kiten = kanji1 && kenk = ken1 && shuten = kanji2 && kens = ken2)
      || (kiten = kanji2 && kenk = ken2 && shuten = kanji1 && kens = ken1)
      then kyori
      else get_ekikan_kyori2 (kanji1, ken1) (kanji2, ken2) rest
    
let rec quick_sort lst = 
	let take n lst p = filter (fun item -> p item n) lst
	in let take_less n lst = take n lst (<)
	in let take_greater n lst = take n lst (>)
	in match lst with
		[] -> []
		| first :: rest -> quick_sort (take_less first rest)
							@ [first]
							@ quick_sort (take_greater first rest)

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

(* 目的:　点pと最短距離が未確定の点の集合V、および駅間のリストを受け取ったら、 V中の全ての駅について、必要に応じて更新処理を行った後の集合Vを返す *)
(* koushin: eki_t -> eki_t t -> ekikan_t t -> eki_t t *)
let koushin p lst_V ekikan_t = 
    (* update: eki_t -> eki_t *)
    let update v = 
      koushin1 p v ekikan_t
    in map update lst_V

let dummy_list = {
  namae = ("", "");
  saitan_kyori = infinity;
  temae_list = [];
}

(* find_min_saitan_eki: eki_t t -> eki_t *)
let rec find_min_saitan_eki lst =
  match lst with
  | [] -> dummy_list
  | [first] -> first
  | first :: rest ->
    let min_rest = find_min_saitan_eki rest in
    if first.saitan_kyori <= min_rest.saitan_kyori 
      then first 
      else min_rest

(* 먼저 rest에 대해 재귀를 해서 rest 안에서 최소값을 가지는 eki_t를 특정한 뒤에, 그 값을 first와 비교해서 최소값을 최종적으로 특정한다면 리스트를 한 번만 보는 것만으로도 동작이 가능 *)

(* saitan_wo_bunri2: eki_t t -> eki_t * eki_t t *)
(* 目的：eki_t list 型のリストを受け取ったら、 「最短距離最小の駅」と「最短距離最小の駅以外からなるリスト」の組 （(eki_t * eki_t list) 型）を返す *)
let saitan_wo_bunri2 eki_t = 
    let min_eki = find_min_saitan_eki eki_t in
  let others =
    filter (fun eki ->
        (eki.namae != min_eki.namae ||
        eki.saitan_kyori != min_eki.saitan_kyori))
      eki_t
  in
  (min_eki, others)

(* dijkstra_main: eki_t t -> ekikan_t t * eki_t t *)
(* 目的：起点のみ最短距離が 0 で他は infinity となっている 駅のリストと駅間リストを受け取ったら、 「起点からの最短距離と『起点からその駅に至る 駅名のリスト』が入った駅」のリストを返す *)
let rec dijkstra_main eki_list ekikan_list =
  match eki_list with
  | [] -> []
  | _ ->
    let (saitan, nokori) = saitan_wo_bunri2 eki_list in
    let updated_list = koushin saitan nokori ekikan_list in
    saitan :: dijkstra_main updated_list ekikan_list

let dijkstra_main_test 
  = 
  dijkstra_main
  [{namae = ("外苑前", "東京"); saitan_kyori = 0.; temae_list = []};
  {namae = ("表参道", "東京"); saitan_kyori = infinity; temae_list = []};
  {namae = ("渋谷", "東京"); saitan_kyori = infinity; temae_list = []};]
  global_ekikan_list
