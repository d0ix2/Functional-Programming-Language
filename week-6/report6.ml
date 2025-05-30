open Metro

type eki_t = {
    namae : string * string;
    saitan_kyori : float;
    temae_list : (string * string) list;
}

(* 目的: ekimei_t 型のリストを受け取ったら、その駅名を使って eki_t 型の リストを作る　*)
(* make_eki_list2: ekimei_t list -> eki_t list *)
let rec make_eki_list2 ekimei_t = 
    match ekimei_t with
    [] -> []
    | first :: rest ->
        match first with
            { kanji; ken; } -> 
                { namae = (kanji, ken); saitan_kyori = infinity; temae_list = []} :: make_eki_list2 rest

(* test for make_eki_list2 *)
let make_eki_list2_test1 = make_eki_list2 global_ekimei_list
let make_eki_list2_test2 = make_eki_list2 [
{kanji="漣川"; kana="연천역"; romaji="Yeoncheon"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="全谷"; kana="전곡역"; romaji="Jeongok"; ken="ソウル特別市"; shozoku="１号線"};
] = [{namae = ("漣川", "ソウル特別市"); saitan_kyori = infinity; temae_list = []};
   {namae = ("全谷", "ソウル特別市"); saitan_kyori = infinity; temae_list = []}
]
let make_eki_list2_test3 = make_eki_list2 [
{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; ken="東京"; shozoku="千代田線"};
{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikoen"; ken="東京"; shozoku="千代田線"};
{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijingumae"; ken="東京"; shozoku="千代田線"};
] = [{namae = ("代々木上原", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("代々木公園", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("明治神宮前", "東京"); saitan_kyori = infinity; temae_list = []}
]

(* 目的: eki_t 型のリストと起点の駅名ペアを受け取ったら、 起点のみルールに従って修正し、 起点以外はもとと同じであるような駅のリストを返す *)
(* shokika2: eki_t list -> string * string -> eki_t list *)
let rec shokika2 eki_t_list ekimei_pair = 
    match eki_t_list with 
        [] -> []
        | first :: rest ->
            match first with { namae; } ->
                if namae = ekimei_pair
                    then { namae = ekimei_pair; saitan_kyori = 0.; temae_list = [ekimei_pair]} :: rest
                    else first :: shokika2 rest ekimei_pair

(* test for shokika2 *)
let shokika2_test1 = shokika2 make_eki_list2_test1 ("代々木上原", "東京")
let shokika2_test2 = shokika2 (make_eki_list2 [
{kanji="漣川"; kana="연천역"; romaji="Yeoncheon"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="全谷"; kana="전곡역"; romaji="Jeongok"; ken="ソウル特別市"; shozoku="１号線"};
]) ("漣川", "ソウル特別市") =   [{namae = ("漣川", "ソウル特別市"); saitan_kyori = 0.; temae_list = [("漣川", "ソウル特別市")]};
   {namae = ("全谷", "ソウル特別市"); saitan_kyori = infinity; temae_list = []}]
let shokika2_test3 = shokika2 (make_eki_list2 [
{kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; ken="東京"; shozoku="千代田線"};
{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikoen"; ken="東京"; shozoku="千代田線"};
{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijingumae"; ken="東京"; shozoku="千代田線"};
]) ("明治神宮前", "東京") =   [{namae = ("代々木上原", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("代々木公園", "東京"); saitan_kyori = infinity; temae_list = []};
   {namae = ("明治神宮前", "東京"); saitan_kyori = 0.; temae_list = [("明治神宮前", "東京")]}]
