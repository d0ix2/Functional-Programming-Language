open Seoul

(* 問１の目的: 整数のリストを受け取ったら、その中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even int_list =
  match int_list with
  [] -> []
  | first :: rest -> if first mod 2 = 0 
    then first :: even rest 
    else even rest

(* test for even *)
let even_test1 = even [ 2; 4; 5; 6; 7; 0 ] = [ 2; 4; 6; 0 ]
let even_test2 = even [ 1; 3; 5; 7 ] = []
let even_test3 = even [ 0; 1 ] = [0]

(* 問２の目的: すでに昇順に並んでいるリスト lst と数字 n を 受け取ったら、lst を前から順に見ていき、 昇順になる位置に n を挿入したリストを返す *)
(* insert : 'a -> 'a list -> 'a list *)
let rec insert lst x = 
  match lst with
    [] -> [x]
    | first :: rest -> 
        if x <= first 
          then x :: lst 
          else first :: insert rest x

(* test for insert *)      
let insert_test1 = insert [2; 3] 5 = [2; 3; 5]
let insert_test2 = insert [2; 3; 0] 0 = [0; 2; 3; 0]
let insert_test1 = insert [1; 0] 1 = [1; 1; 0]

(* 問３の目的: リストを受け取ったら、挿入法により昇順に整列したリストを返す *)
(* ins_sort : 'a list -> 'a list *)
let rec ins_sort lst =
  match lst with
    [] -> []
    | first :: rest ->
        insert (ins_sort rest) first 

(* test for ins_sort *)
let ins_sort_test1 = ins_sort [2; 6; 7; 4; 3;] = [2; 3; 4; 6; 7]
let ins_sort_test2 = ins_sort [0] = [0]
let ins_sort_test3 = ins_sort [0; 1; 0; 1; 0;] = [0; 0; 0; 1; 1]

(* 目的: seiretsu2に必要となる、 eki と ekimei_t を受け取ったら、ルールに従って整列し、 さらに重複した駅を取り除いた ekimei_t 型のリストを返す関数 ekimei_t_insert *)
(* ekimei_t_insert : ekimei_t -> ekimei_t list -> ekimei_t list *)
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

(* 問４の目的: ekimei_t 型のリストを受け取ったら、ルールに従って整列し、 さらに重複した駅を取り除いた ekimei_t 型のリストを返す *)
(* seiretsu2 : ekimei_t list -> ekimei_t list *)
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
= [{kanji="ささしまライブ"; kana="ささしまらいぶ"; romaji="sasashimaraibu"; ken="愛知"; shozoku="あおなみ線"}; 
{kanji="名古屋"; kana="なごや"; romaji="nagoya"; ken="愛知"; shozoku="あおなみ線"}]
let seiretsu2_test2 = seiretsu2
[{kanji="名古屋"; kana="なごや"; romaji="nagoya"; ken="愛知"; shozoku="あおなみ線"};
{kanji="名古屋"; kana="なごや"; romaji="nagoya"; ken="愛知"; shozoku="あおなみ線"};
{kanji="名古屋"; kana="なごや"; romaji="nagoya"; ken="愛知"; shozoku="あおなみ線"}]
= [{kanji="名古屋"; kana="なごや"; romaji="nagoya"; ken="愛知"; shozoku="あおなみ線"}]
let seiretsu2_test3 = seiretsu2 [
  {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; ken="東京"; shozoku="千代田線"};
{kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikoen"; ken="東京"; shozoku="千代田線"};
{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijingumae"; ken="東京"; shozoku="千代田線"};
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; ken="東京"; shozoku="千代田線"};
{kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; ken="東京"; shozoku="千代田線"};
{kanji="赤坂"; kana="あかさか"; romaji="akasaka"; ken="東京"; shozoku="千代田線"};
{kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidoumae"; ken="東京"; shozoku="千代田線"};
{kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; ken="東京"; shozoku="千代田線"};
{kanji="日比谷"; kana="ひびや"; romaji="hibiya"; ken="東京"; shozoku="千代田線"};
{kanji="二重橋前"; kana="にじゅうばしまえ"; romaji="nijuubashimae"; ken="東京"; shozoku="千代田線"};
{kanji="大手町"; kana="おおてまち"; romaji="otemachi"; ken="東京"; shozoku="千代田線"};
{kanji="新御茶ノ水"; kana="しんおちゃのみず"; romaji="shinochanomizu"; ken="東京"; shozoku="千代田線"};
{kanji="湯島"; kana="ゆしま"; romaji="yushima"; ken="東京"; shozoku="千代田線"};
{kanji="根津"; kana="ねづ"; romaji="nezu"; ken="東京"; shozoku="千代田線"};
{kanji="千駄木"; kana="せんだぎ"; romaji="sendagi"; ken="東京"; shozoku="千代田線"};
{kanji="西日暮里"; kana="にしにっぽり"; romaji="nishinippori"; ken="東京"; shozoku="千代田線"};
{kanji="町屋"; kana="まちや"; romaji="machiya"; ken="東京"; shozoku="千代田線"};
{kanji="北千住"; kana="きたせんじゅ"; romaji="kitasenju"; ken="東京"; shozoku="千代田線"};
{kanji="綾瀬"; kana="あやせ"; romaji="ayase"; ken="東京"; shozoku="千代田線"};
{kanji="北綾瀬"; kana="きたあやせ"; romaji="kitaayase"; ken="東京"; shozoku="千代田線"};
{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; ken="東京"; shozoku="副都心線"};
] = [
{kanji = "乃木坂"; kana = "のぎざか"; romaji = "nogizaka"; ken = "東京"; shozoku = "千代田線"};
{kanji = "二重橋前"; kana = "にじゅうばしまえ"; romaji = "nijuubashimae"; ken = "東京"; shozoku = "千代田線"};
{kanji = "代々木上原"; kana = "よよぎうえはら"; romaji = "yoyogiuehara"; ken = "東京"; shozoku = "千代田線"};
{kanji = "代々木公園"; kana = "よよぎこうえん"; romaji = "yoyogikoen"; ken = "東京"; shozoku = "千代田線"};
{kanji = "北千住"; kana = "きたせんじゅ"; romaji = "kitasenju"; ken = "東京"; shozoku = "千代田線"};
{kanji = "北綾瀬"; kana = "きたあやせ"; romaji = "kitaayase"; ken = "東京"; shozoku = "千代田線"};
{kanji = "千駄木"; kana = "せんだぎ"; romaji = "sendagi"; ken = "東京"; shozoku = "千代田線"};
{kanji = "国会議事堂前"; kana = "こっかいぎじどうまえ"; romaji = "kokkaigijidoumae"; ken = "東京"; shozoku = "千代田線"};
{kanji = "大手町"; kana = "おおてまち"; romaji = "otemachi"; ken = "東京"; shozoku = "千代田線"};
{kanji = "新御茶ノ水"; kana = "しんおちゃのみず"; romaji = "shinochanomizu"; ken = "東京"; shozoku = "千代田線"};
{kanji = "日比谷"; kana = "ひびや"; romaji = "hibiya"; ken = "東京"; shozoku = "千代田線"};
{kanji = "明治神宮前"; kana = "めいじじんぐうまえ"; romaji = "meijijingumae"; ken = "東京"; shozoku = "千代田線"};
{kanji = "根津"; kana = "ねづ"; romaji = "nezu"; ken = "東京"; shozoku = "千代田線"};
{kanji = "池袋"; kana = "いけぶくろ"; romaji = "ikebukuro"; ken = "東京"; shozoku = "副都心線"};
{kanji = "湯島"; kana = "ゆしま"; romaji = "yushima"; ken = "東京"; shozoku = "千代田線"};
{kanji = "町屋"; kana = "まちや"; romaji = "machiya"; ken = "東京"; shozoku = "千代田線"};
{kanji = "綾瀬"; kana = "あやせ"; romaji = "ayase"; ken = "東京"; shozoku = "千代田線"};
{kanji = "表参道"; kana = "おもてさんどう"; romaji = "omotesando"; ken = "東京"; shozoku = "千代田線"};
{kanji = "西日暮里"; kana = "にしにっぽり"; romaji = "nishinippori"; ken = "東京"; shozoku = "千代田線"};
{kanji = "赤坂"; kana = "あかさか"; romaji = "akasaka"; ken = "東京"; shozoku = "千代田線"};
{kanji = "霞ヶ関"; kana = "かすみがせき"; romaji = "kasumigaseki"; ken = "東京"; shozoku = "千代田線"}
]
let seiretsu2_test4 = seiretsu2 global_ekimei_list 
