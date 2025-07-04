open List
open Metro

type eki_t = {
  namae : string * string;
  saitan_kyori : float;
  temae_list : (string * string) list;
}

(* hikaku: eki_t -> eki_t -> eki_t *)
(* 目的：eki_t 型のデータ２つを変数で受け取って、 saitan_kyori が小さい方のデータを返す *)
let dummy_list = {
  namae = ("", "");
  saitan_kyori = infinity;
  temae_list = [];
}

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


let test1 = saitan_wo_bunri2 [
  {namae = ("湯島", "東京"); saitan_kyori = 0.5; temae_list = []};
  {namae = ("根津", "東京"); saitan_kyori = 4.8; temae_list = []};
  {namae = ("千駄木", "東京"); saitan_kyori = 1.7; temae_list = []};
  {namae = ("西日暮里", "東京"); saitan_kyori = infinity; temae_list = []};
] = ({namae = ("湯島", "東京"); saitan_kyori = 0.5; temae_list = []},
   [{namae = ("根津", "東京"); saitan_kyori = 4.8; temae_list = []};
    {namae = ("千駄木", "東京"); saitan_kyori = 1.7; temae_list = []};
    {namae = ("西日暮里", "東京"); saitan_kyori = infinity; temae_list = []}])
let test2 = saitan_wo_bunri2 [
   {namae = ("末広町", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("神田", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("三越前", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("日本橋", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("京橋", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("銀座", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("新橋", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("虎ノ門", "東京"); saitan_kyori = infinity; temae_list = []};
   ] =   ({namae = ("末広町", "東京"); saitan_kyori = infinity;
    temae_list = []},
   [{namae = ("神田", "東京"); saitan_kyori = infinity; temae_list = []};
    {namae = ("三越前", "東京"); saitan_kyori = infinity; temae_list = []};
    {namae = ("日本橋", "東京"); saitan_kyori = infinity; temae_list = []};
    {namae = ("京橋", "東京"); saitan_kyori = infinity; temae_list = []};
    {namae = ("銀座", "東京"); saitan_kyori = infinity; temae_list = []};
    {namae = ("新橋", "東京"); saitan_kyori = infinity; temae_list = []};
    {namae = ("虎ノ門", "東京"); saitan_kyori = infinity; temae_list = []}])
let test3 = saitan_wo_bunri2 [
  {namae = ("新宿", "東京"); saitan_kyori = 1.8; temae_list = []};
  {namae = ("外苑前", "東京"); saitan_kyori = infinity; temae_list = []};
  {namae = ("表参道", "東京"); saitan_kyori = infinity; temae_list = []};
  {namae = ("渋谷", "東京"); saitan_kyori = infinity; temae_list = []};
  ] = 
  ({namae = ("新宿", "東京"); saitan_kyori = 1.8; temae_list = []},
   [{namae = ("外苑前", "東京"); saitan_kyori = infinity; temae_list = []};
    {namae = ("表参道", "東京"); saitan_kyori = infinity; temae_list = []};
    {namae = ("渋谷", "東京"); saitan_kyori = infinity; temae_list = []}])
