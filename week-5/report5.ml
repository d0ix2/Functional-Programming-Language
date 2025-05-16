open Global

(* even : int list -> int list *)
let rec even int_list =
  match int_list with
  | [] -> []
  | first :: rest -> if first mod 2 = 0 
    then first :: even rest 
    else even rest

(* test for even *)
let even_test1 = even [ 2; 4; 5; 6; 7; 0 ] = [ 2; 4; 6; 0 ]
let even_test2 = even [ 1; 3; 5; 7 ] = []
let even_test3 = even [ 0; 1 ] = [0]

(* insert : 'a -> 'a list -> 'a list *)
let rec insert x lst = 
  match lst with
    [] -> [x]
    | first :: rest -> 
        if x <= first 
          then x :: lst 
          else first :: insert x rest

(* test for insert *)      
let insert_test1 = insert 5 [2; 3] = [2; 3; 5]
let insert_test2 = insert 0 [2; 3; 0] = [0; 2; 3; 0]
let insert_test1 = insert 1 [1; 0] = [1; 1; 0]

(* ins_sort : 'a list -> 'a list *)
let rec ins_sort lst =
  match lst with
    [] -> []
    | first :: rest ->
        insert first (ins_sort rest)

(* test for ins_sort *)
let ins_sort_test1 = ins_sort [2; 6; 7; 4; 3;] = [2; 3; 4; 6; 7]
let ins_sort_test2 = ins_sort [0] = [0]
let ins_sort_test3 = ins_sort [0; 1; 0; 1; 0;] = [0; 0; 0; 1; 1]


let rec ekimei_t_insert eki ekimei_t = 
  match ekimei_t with
    [] -> [eki]
    | first :: rest -> 
        match first with 
          { kanji; ken; } -> 
            if eki.kanji = kanji && eki.ken = ken
              then ekimei_t_insert eki rest
              else (if eki.kanji < kanji 
                then eki :: ekimei_t
                else first :: ekimei_t_insert eki rest)

let rec seiretsu2 ekimei_t =
  match ekimei_t with
     [] -> []
      | first :: rest ->
        ekimei_t_insert first (seiretsu2 rest)

let seiretsu2_test1 = seiretsu2
[{kanji="名古屋"; kana="なごや"; romaji="nagoya"; ken="愛知"; shozoku="あおなみ線"};
{kanji="名古屋"; kana="なごや"; romaji="nagoya"; ken="愛知"; shozoku="あおなみ線"};
{kanji="ささしまライブ"; kana="ささしまらいぶ"; romaji="sasashimaraibu"; ken="愛知"; shozoku="あおなみ線"};
{kanji="ささしまライブ"; kana="ささしまらいぶ"; romaji="sasashimaraibu"; ken="愛知"; shozoku="あおなみ線"}]
