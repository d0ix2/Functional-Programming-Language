(* 駅名の情報を格納するレコード型 *)
type ekimei_t = {
  kanji   : string; (* 漢字の駅名 *)
  kana    : string; (* 読み *)
  romaji  : string; (* ローマ字 *)
  ken     : string; (* 県名 *)
  shozoku : string; (* 所属路線名 *)
}

(* 駅間の情報を格納するレコード型 *)
type ekikan_t = {
  kiten  : string; (* 起点 *)
  kenk   : string; (* 起点の県名 *)
  shuten : string; (* 終点 *)
  kens   : string; (* 終点の県名 *)
  keiyu  : string; (* 経由路線名 *)
  kyori  : float;  (* 距離 *)
  jikan  : int;    (* 所要時間 *)
}

let global_ekimei_list = [
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
{kanji="雑司が谷"; kana="ぞうしがや"; romaji="zoshigaya"; ken="東京"; shozoku="副都心線"};
{kanji="西早稲田"; kana="にしわせだ"; romaji="nishiwaseda"; ken="東京"; shozoku="副都心線"};
{kanji="東新宿"; kana="ひがししんじゅく"; romaji="higashishinjuku"; ken="東京"; shozoku="副都心線"};
{kanji="新宿三丁目"; kana="しんじゅくさんちょうめ"; romaji="shinjukusanchome"; ken="東京"; shozoku="副都心線"};
{kanji="北参道"; kana="きたさんどう"; romaji="kitasando"; ken="東京"; shozoku="副都心線"};
{kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijingumae"; ken="東京"; shozoku="副都心線"};
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; ken="東京"; shozoku="副都心線"};
{kanji="浅草"; kana="あさくさ"; romaji="asakusa"; ken="東京"; shozoku="銀座線"};
{kanji="田原町"; kana="たわらまち"; romaji="tawaramachi"; ken="東京"; shozoku="銀座線"};
{kanji="稲荷町"; kana="いなりちょう"; romaji="inaricho"; ken="東京"; shozoku="銀座線"};
{kanji="上野"; kana="うえの"; romaji="ueno"; ken="東京"; shozoku="銀座線"};
{kanji="上野広小路"; kana="うえのひろこうじ"; romaji="uenohirokoji"; ken="東京"; shozoku="銀座線"};
{kanji="末広町"; kana="すえひろちょう"; romaji="suehirocho"; ken="東京"; shozoku="銀座線"};
{kanji="神田"; kana="かんだ"; romaji="kanda"; ken="東京"; shozoku="銀座線"};
{kanji="三越前"; kana="みつこしまえ"; romaji="mitsukoshimae"; ken="東京"; shozoku="銀座線"};
{kanji="日本橋"; kana="にほんばし"; romaji="nihonbashi"; ken="東京"; shozoku="銀座線"};
{kanji="京橋"; kana="きょうばし"; romaji="kyobashi"; ken="東京"; shozoku="銀座線"};
{kanji="銀座"; kana="ぎんざ"; romaji="ginza"; ken="東京"; shozoku="銀座線"};
{kanji="新橋"; kana="しんばし"; romaji="shinbashi"; ken="東京"; shozoku="銀座線"};
{kanji="虎ノ門"; kana="とらのもん"; romaji="toranomon"; ken="東京"; shozoku="銀座線"};
{kanji="溜池山王"; kana="ためいけさんのう"; romaji="tameikesannou"; ken="東京"; shozoku="銀座線"};
{kanji="赤坂見附"; kana="あかさかみつけ"; romaji="akasakamitsuke"; ken="東京"; shozoku="銀座線"};
{kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaicchome"; ken="東京"; shozoku="銀座線"};
{kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; ken="東京"; shozoku="銀座線"};
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesando"; ken="東京"; shozoku="銀座線"};
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; ken="東京"; shozoku="銀座線"};
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; ken="東京"; shozoku="半蔵門線"};
{kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; ken="東京"; shozoku="半蔵門線"};
{kanji="青山一丁目"; kana="あおやまいっちょうめ"; romaji="aoyamaitchome"; ken="東京"; shozoku="半蔵門線"};
{kanji="永田町"; kana="ながたちょう"; romaji="nagatacho"; ken="東京"; shozoku="半蔵門線"};
{kanji="半蔵門"; kana="はんぞうもん"; romaji="hanzomon"; ken="東京"; shozoku="半蔵門線"};
{kanji="九段下"; kana="くだんした"; romaji="kudanshita"; ken="東京"; shozoku="半蔵門線"};
{kanji="神保町"; kana="じんぼうちょう"; romaji="jinbocho"; ken="東京"; shozoku="半蔵門線"};
{kanji="大手町"; kana="おおてまち"; romaji="otemachi"; ken="東京"; shozoku="半蔵門線"};
{kanji="三越前"; kana="みつこしまえ"; romaji="mitsukoshimae"; ken="東京"; shozoku="半蔵門線"};
{kanji="水天宮前"; kana="すいてんぐうまえ"; romaji="suitengumae"; ken="東京"; shozoku="半蔵門線"};
{kanji="清澄白河"; kana="きよすみしらかわ"; romaji="kiyosumi-shirakawa"; ken="東京"; shozoku="半蔵門線"};
{kanji="住吉"; kana="すみよし"; romaji="sumiyoshi"; ken="東京"; shozoku="半蔵門線"};
{kanji="錦糸町"; kana="きんしちょう"; romaji="kinshicho"; ken="東京"; shozoku="半蔵門線"};
{kanji="押上"; kana="おしあげ"; romaji="oshiage"; ken="東京"; shozoku="半蔵門線"};
{kanji="中目黒"; kana="なかめぐろ"; romaji="nakameguro"; ken="東京"; shozoku="日比谷線"};
{kanji="恵比寿"; kana="えびす"; romaji="ebisu"; ken="東京"; shozoku="日比谷線"};
{kanji="広尾"; kana="ひろお"; romaji="hiro"; ken="東京"; shozoku="日比谷線"};
{kanji="六本木"; kana="ろっぽんぎ"; romaji="roppongi"; ken="東京"; shozoku="日比谷線"};
{kanji="神谷町"; kana="かみやちょう"; romaji="kamiyacho"; ken="東京"; shozoku="日比谷線"};
{kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; ken="東京"; shozoku="日比谷線"};
{kanji="日比谷"; kana="ひびや"; romaji="hibiya"; ken="東京"; shozoku="日比谷線"};
{kanji="銀座"; kana="ぎんざ"; romaji="ginza"; ken="東京"; shozoku="日比谷線"};
{kanji="東銀座"; kana="ひがしぎんざ"; romaji="higashiginza"; ken="東京"; shozoku="日比谷線"};
{kanji="築地"; kana="つきじ"; romaji="tsukiji"; ken="東京"; shozoku="日比谷線"};
{kanji="八丁堀"; kana="はっちょうぼり"; romaji="hacchobori"; ken="東京"; shozoku="日比谷線"};
{kanji="茅場町"; kana="かやばちょう"; romaji="kayabacho"; ken="東京"; shozoku="日比谷線"};
{kanji="人形町"; kana="にんぎょうちょう"; romaji="ningyomachi"; ken="東京"; shozoku="日比谷線"};
{kanji="小伝馬町"; kana="こでんまちょう"; romaji="kodemmacho"; ken="東京"; shozoku="日比谷線"};
{kanji="秋葉原"; kana="あきはばら"; romaji="akihabara"; ken="東京"; shozoku="日比谷線"};
{kanji="仲御徒町"; kana="なかおかちまち"; romaji="nakaokachimachi"; ken="東京"; shozoku="日比谷線"};
{kanji="上野"; kana="うえの"; romaji="ueno"; ken="東京"; shozoku="日比谷線"};
{kanji="入谷"; kana="いりや"; romaji="iriya"; ken="東京"; shozoku="日比谷線"};
{kanji="三ノ輪"; kana="みのわ"; romaji="minowa"; ken="東京"; shozoku="日比谷線"};
{kanji="南千住"; kana="みなみせんじゅ"; romaji="minamisenju"; ken="東京"; shozoku="日比谷線"};
{kanji="北千住"; kana="きたせんじゅ"; romaji="kitasenju"; ken="東京"; shozoku="日比谷線"};
{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; ken="東京"; shozoku="丸ノ内線"};
{kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; ken="東京"; shozoku="丸ノ内線"};
{kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; ken="東京"; shozoku="丸ノ内線"};
{kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; ken="東京"; shozoku="丸ノ内線"};
{kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; ken="東京"; shozoku="丸ノ内線"};
{kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; ken="東京"; shozoku="丸ノ内線"};
{kanji="淡路町"; kana="あわじちょう"; romaji="awajicho"; ken="東京"; shozoku="丸ノ内線"};
{kanji="大手町"; kana="おおてまち"; romaji="otemachi"; ken="東京"; shozoku="丸ノ内線"};
{kanji="東京"; kana="とうきょう"; romaji="tokyo"; ken="東京"; shozoku="丸ノ内線"};
{kanji="銀座"; kana="ぎんざ"; romaji="ginza"; ken="東京"; shozoku="丸ノ内線"};
{kanji="霞ヶ関"; kana="かすみがせき"; romaji="kasumigaseki"; ken="東京"; shozoku="丸ノ内線"};
{kanji="国会議事堂前"; kana="こっかいぎじどうまえ"; romaji="kokkaigijidomae"; ken="東京"; shozoku="丸ノ内線"};
{kanji="赤坂見附"; kana="あかさかみつけ"; romaji="akasakamitsuke"; ken="東京"; shozoku="丸ノ内線"};
{kanji="四ツ谷"; kana="よつや"; romaji="yotsuya"; ken="東京"; shozoku="丸ノ内線"};
{kanji="四谷三丁目"; kana="よつやさんちょうめ"; romaji="yotsuyasanchome"; ken="東京"; shozoku="丸ノ内線"};
{kanji="新宿御苑前"; kana="しんじゅくぎょえんまえ"; romaji="shinjuku-gyoemmae"; ken="東京"; shozoku="丸ノ内線"};
{kanji="新宿三丁目"; kana="しんじゅくさんちょうめ"; romaji="shinjuku-sanchome"; ken="東京"; shozoku="丸ノ内線"};
{kanji="新宿"; kana="しんじゅく"; romaji="shinjuku"; ken="東京"; shozoku="丸ノ内線"};
{kanji="西新宿"; kana="にししんじゅく"; romaji="nishi-shinjuku"; ken="東京"; shozoku="丸ノ内線"};
{kanji="中野坂上"; kana="なかのさかうえ"; romaji="nakano-sakaue"; ken="東京"; shozoku="丸ノ内線"};
{kanji="新中野"; kana="しんなかの"; romaji="shin-nakano"; ken="東京"; shozoku="丸ノ内線"};
{kanji="東高円寺"; kana="ひがしこうえんじ"; romaji="higashi-koenji"; ken="東京"; shozoku="丸ノ内線"};
{kanji="新高円寺"; kana="しんこうえんじ"; romaji="shin-koenji"; ken="東京"; shozoku="丸ノ内線"};
{kanji="南阿佐ヶ谷"; kana="みなみあさがや"; romaji="minami-asagaya"; ken="東京"; shozoku="丸ノ内線"};
{kanji="荻窪"; kana="おぎくぼ"; romaji="ogikubo"; ken="東京"; shozoku="丸ノ内線"};
{kanji="中野新橋"; kana="なかのしんばし"; romaji="nakano-shimbashi"; ken="東京"; shozoku="丸ノ内線"};
{kanji="中野富士見町"; kana="なかのふじみちょう"; romaji="nakano-fujimicho"; ken="東京"; shozoku="丸ノ内線"};
{kanji="方南町"; kana="ほうなんちょう"; romaji="honancho"; ken="東京"; shozoku="丸ノ内線"};
{kanji="四ツ谷"; kana="よつや"; romaji="yotsuya"; ken="東京"; shozoku="南北線"};
{kanji="永田町"; kana="ながたちょう"; romaji="nagatacho"; ken="東京"; shozoku="南北線"};
{kanji="溜池山王"; kana="ためいけさんのう"; romaji="tameikesanno"; ken="東京"; shozoku="南北線"};
{kanji="六本木一丁目"; kana="ろっぽんぎいっちょうめ"; romaji="roppongiitchome"; ken="東京"; shozoku="南北線"};
{kanji="麻布十番"; kana="あざぶじゅうばん"; romaji="azabujuban"; ken="東京"; shozoku="南北線"};
{kanji="白金高輪"; kana="しろかねたかなわ"; romaji="shirokanetakanawa"; ken="東京"; shozoku="南北線"};
{kanji="白金台"; kana="しろかねだい"; romaji="shirokanedai"; ken="東京"; shozoku="南北線"};
{kanji="目黒"; kana="めぐろ"; romaji="meguro"; ken="東京"; shozoku="南北線"};
{kanji="市ヶ谷"; kana="いちがや"; romaji="ichigaya"; ken="東京"; shozoku="南北線"};
{kanji="飯田橋"; kana="いいだばし"; romaji="iidabashi"; ken="東京"; shozoku="南北線"};
{kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; ken="東京"; shozoku="南北線"};
{kanji="東大前"; kana="とうだいまえ"; romaji="todaimae"; ken="東京"; shozoku="南北線"};
{kanji="本駒込"; kana="ほんこまごめ"; romaji="honkomagome"; ken="東京"; shozoku="南北線"};
{kanji="駒込"; kana="こまごめ"; romaji="komagome"; ken="東京"; shozoku="南北線"};
{kanji="西ヶ原"; kana="にしがはら"; romaji="nishigahara"; ken="東京"; shozoku="南北線"};
{kanji="王子"; kana="おうじ"; romaji="oji"; ken="東京"; shozoku="南北線"};
{kanji="王子神谷"; kana="おうじかみや"; romaji="ojikamiya"; ken="東京"; shozoku="南北線"};
{kanji="志茂"; kana="しも"; romaji="shimo"; ken="東京"; shozoku="南北線"};
{kanji="赤羽岩淵"; kana="あかばねいわぶち"; romaji="akabaneiwabuchi"; ken="東京"; shozoku="南北線"};
{kanji="西船橋"; kana="にしふなばし"; romaji="nishi-funabashi"; ken="千葉"; shozoku="東西線"};
{kanji="原木中山"; kana="ばらきなかやま"; romaji="baraki-nakayama"; ken="千葉"; shozoku="東西線"};
{kanji="妙典"; kana="みょうでん"; romaji="myoden"; ken="千葉"; shozoku="東西線"};
{kanji="行徳"; kana="ぎょうとく"; romaji="gyotoku"; ken="千葉"; shozoku="東西線"};
{kanji="南行徳"; kana="みなみぎょうとく"; romaji="minami-gyotoku"; ken="千葉"; shozoku="東西線"};
{kanji="浦安"; kana="うらやす"; romaji="urayasu"; ken="千葉"; shozoku="東西線"};
{kanji="葛西"; kana="かさい"; romaji="kasai"; ken="東京"; shozoku="東西線"};
{kanji="西葛西"; kana="にしかさい"; romaji="nishi-kasai"; ken="東京"; shozoku="東西線"};
{kanji="南砂町"; kana="みなみすなまち"; romaji="minami-sunamachi"; ken="東京"; shozoku="東西線"};
{kanji="東陽町"; kana="とうようちょう"; romaji="toyocho"; ken="東京"; shozoku="東西線"};
{kanji="木場"; kana="きば"; romaji="kiba"; ken="東京"; shozoku="東西線"};
{kanji="門前仲町"; kana="もんぜんなかちょう"; romaji="monzen-nakacho"; ken="東京"; shozoku="東西線"};
{kanji="茅場町"; kana="かやばちょう"; romaji="kayabacho"; ken="東京"; shozoku="東西線"};
{kanji="日本橋"; kana="にほんばし"; romaji="nihonbashi"; ken="東京"; shozoku="東西線"};
{kanji="大手町"; kana="おおてまち"; romaji="otemachi"; ken="東京"; shozoku="東西線"};
{kanji="竹橋"; kana="たけばし"; romaji="takebashi"; ken="東京"; shozoku="東西線"};
{kanji="九段下"; kana="くだんした"; romaji="kudanshita"; ken="東京"; shozoku="東西線"};
{kanji="飯田橋"; kana="いいだばし"; romaji="iidabashi"; ken="東京"; shozoku="東西線"};
{kanji="神楽坂"; kana="かぐらざか"; romaji="kagurazaka"; ken="東京"; shozoku="東西線"};
{kanji="早稲田"; kana="わせだ"; romaji="waseda"; ken="東京"; shozoku="東西線"};
{kanji="高田馬場"; kana="たかだのばば"; romaji="takadanobaba"; ken="東京"; shozoku="東西線"};
{kanji="落合"; kana="おちあい"; romaji="ochiai"; ken="東京"; shozoku="東西線"};
{kanji="中野"; kana="なかの"; romaji="nakano"; ken="東京"; shozoku="東西線"};
{kanji="新木場"; kana="しんきば"; romaji="shinkiba"; ken="東京"; shozoku="有楽町線"};
{kanji="辰巳"; kana="たつみ"; romaji="tatsumi"; ken="東京"; shozoku="有楽町線"};
{kanji="豊洲"; kana="とよす"; romaji="toyosu"; ken="東京"; shozoku="有楽町線"};
{kanji="月島"; kana="つきしま"; romaji="tsukishima"; ken="東京"; shozoku="有楽町線"};
{kanji="新富町"; kana="しんとみちょう"; romaji="shintomicho"; ken="東京"; shozoku="有楽町線"};
{kanji="銀座一丁目"; kana="ぎんざいっちょうめ"; romaji="ginzaicchome"; ken="東京"; shozoku="有楽町線"};
{kanji="有楽町"; kana="ゆうらくちょう"; romaji="yurakucho"; ken="東京"; shozoku="有楽町線"};
{kanji="桜田門"; kana="さくらだもん"; romaji="sakuradamon"; ken="東京"; shozoku="有楽町線"};
{kanji="永田町"; kana="ながたちょう"; romaji="nagatacho"; ken="東京"; shozoku="有楽町線"};
{kanji="麹町"; kana="こうじまち"; romaji="koujimachi"; ken="東京"; shozoku="有楽町線"};
{kanji="市ヶ谷"; kana="いちがや"; romaji="ichigaya"; ken="東京"; shozoku="有楽町線"};
{kanji="飯田橋"; kana="いいだばし"; romaji="iidabashi"; ken="東京"; shozoku="有楽町線"};
{kanji="江戸川橋"; kana="えどがわばし"; romaji="edogawabashi"; ken="東京"; shozoku="有楽町線"};
{kanji="護国寺"; kana="ごこくじ"; romaji="gokokuji"; ken="東京"; shozoku="有楽町線"};
{kanji="東池袋"; kana="ひがしいけぶくろ"; romaji="higashiikebukuro"; ken="東京"; shozoku="有楽町線"};
{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; ken="東京"; shozoku="有楽町線"};
{kanji="要町"; kana="かなめちょう"; romaji="kanamecho"; ken="東京"; shozoku="有楽町線"};
{kanji="千川"; kana="せんかわ"; romaji="senkawa"; ken="東京"; shozoku="有楽町線"};
{kanji="小竹向原"; kana="こたけむかいはら"; romaji="kotakemukaihara"; ken="東京"; shozoku="有楽町線"};
{kanji="氷川台"; kana="ひかわだい"; romaji="hikawadai"; ken="東京"; shozoku="有楽町線"};
{kanji="平和台"; kana="へいわだい"; romaji="heiwadai"; ken="東京"; shozoku="有楽町線"};
{kanji="地下鉄赤塚"; kana="ちかてつあかつか"; romaji="chikatetsuakatsuka"; ken="東京"; shozoku="有楽町線"};
{kanji="地下鉄成増"; kana="ちかてつなります"; romaji="chikatetsunarimasu"; ken="東京"; shozoku="有楽町線"};
{kanji="和光市"; kana="わこうし"; romaji="wakoshi"; ken="埼玉"; shozoku="有楽町線"};
]
let global_ekikan_list = [
{kiten="代々木上原"; kenk="東京"; shuten="代々木公園"; kens="東京"; keiyu="千代田線"; kyori=1.0; jikan=2};
{kiten="代々木公園"; kenk="東京"; shuten="明治神宮前"; kens="東京"; keiyu="千代田線"; kyori=1.2; jikan=2};
{kiten="明治神宮前"; kenk="東京"; shuten="表参道"; kens="東京"; keiyu="千代田線"; kyori=0.9; jikan=2};
{kiten="表参道"; kenk="東京"; shuten="乃木坂"; kens="東京"; keiyu="千代田線"; kyori=1.4; jikan=3};
{kiten="乃木坂"; kenk="東京"; shuten="赤坂"; kens="東京"; keiyu="千代田線"; kyori=1.1; jikan=2};
{kiten="赤坂"; kenk="東京"; shuten="国会議事堂前"; kens="東京"; keiyu="千代田線"; kyori=0.8; jikan=1};
{kiten="国会議事堂前"; kenk="東京"; shuten="霞ヶ関"; kens="東京"; keiyu="千代田線"; kyori=0.7; jikan=1};
{kiten="霞ヶ関"; kenk="東京"; shuten="日比谷"; kens="東京"; keiyu="千代田線"; kyori=1.2; jikan=2};
{kiten="日比谷"; kenk="東京"; shuten="二重橋前"; kens="東京"; keiyu="千代田線"; kyori=0.7; jikan=1};
{kiten="二重橋前"; kenk="東京"; shuten="大手町"; kens="東京"; keiyu="千代田線"; kyori=0.7; jikan=1};
{kiten="大手町"; kenk="東京"; shuten="新御茶ノ水"; kens="東京"; keiyu="千代田線"; kyori=1.3; jikan=2};
{kiten="新御茶ノ水"; kenk="東京"; shuten="湯島"; kens="東京"; keiyu="千代田線"; kyori=1.2; jikan=2};
{kiten="湯島"; kenk="東京"; shuten="根津"; kens="東京"; keiyu="千代田線"; kyori=1.2; jikan=2};
{kiten="根津"; kenk="東京"; shuten="千駄木"; kens="東京"; keiyu="千代田線"; kyori=1.0; jikan=2};
{kiten="千駄木"; kenk="東京"; shuten="西日暮里"; kens="東京"; keiyu="千代田線"; kyori=0.9; jikan=1};
{kiten="西日暮里"; kenk="東京"; shuten="町屋"; kens="東京"; keiyu="千代田線"; kyori=1.7; jikan=2};
{kiten="町屋"; kenk="東京"; shuten="北千住"; kens="東京"; keiyu="千代田線"; kyori=2.6; jikan=3};
{kiten="北千住"; kenk="東京"; shuten="綾瀬"; kens="東京"; keiyu="千代田線"; kyori=2.5; jikan=3};
{kiten="綾瀬"; kenk="東京"; shuten="北綾瀬"; kens="東京"; keiyu="千代田線"; kyori=2.1; jikan=4};
{kiten="池袋"; kenk="東京"; shuten="雑司が谷"; kens="東京"; keiyu="副都心線"; kyori=1.8; jikan=3};
{kiten="雑司が谷"; kenk="東京"; shuten="西早稲田"; kens="東京"; keiyu="副都心線"; kyori=1.5; jikan=2};
{kiten="西早稲田"; kenk="東京"; shuten="東新宿"; kens="東京"; keiyu="副都心線"; kyori=0.9; jikan=2};
{kiten="東新宿"; kenk="東京"; shuten="新宿三丁目"; kens="東京"; keiyu="副都心線"; kyori=1.1; jikan=3};
{kiten="新宿三丁目"; kenk="東京"; shuten="北参道"; kens="東京"; keiyu="副都心線"; kyori=1.4; jikan=2};
{kiten="北参道"; kenk="東京"; shuten="明治神宮前"; kens="東京"; keiyu="副都心線"; kyori=1.2; jikan=2};
{kiten="明治神宮前"; kenk="東京"; shuten="渋谷"; kens="東京"; keiyu="副都心線"; kyori=1.0; jikan=4};
{kiten="浅草"; kenk="東京"; shuten="田原町"; kens="東京"; keiyu="銀座線"; kyori=0.8; jikan=2};
{kiten="田原町"; kenk="東京"; shuten="稲荷町"; kens="東京"; keiyu="銀座線"; kyori=0.7; jikan=1};
{kiten="稲荷町"; kenk="東京"; shuten="上野"; kens="東京"; keiyu="銀座線"; kyori=0.7; jikan=2};
{kiten="上野"; kenk="東京"; shuten="上野広小路"; kens="東京"; keiyu="銀座線"; kyori=0.5; jikan=2};
{kiten="上野広小路"; kenk="東京"; shuten="末広町"; kens="東京"; keiyu="銀座線"; kyori=0.6; jikan=1};
{kiten="末広町"; kenk="東京"; shuten="神田"; kens="東京"; keiyu="銀座線"; kyori=1.1; jikan=2};
{kiten="神田"; kenk="東京"; shuten="三越前"; kens="東京"; keiyu="銀座線"; kyori=0.7; jikan=1};
{kiten="三越前"; kenk="東京"; shuten="日本橋"; kens="東京"; keiyu="銀座線"; kyori=0.6; jikan=2};
{kiten="日本橋"; kenk="東京"; shuten="京橋"; kens="東京"; keiyu="銀座線"; kyori=0.7; jikan=2};
{kiten="京橋"; kenk="東京"; shuten="銀座"; kens="東京"; keiyu="銀座線"; kyori=0.7; jikan=1};
{kiten="銀座"; kenk="東京"; shuten="新橋"; kens="東京"; keiyu="銀座線"; kyori=0.9; jikan=2};
{kiten="新橋"; kenk="東京"; shuten="虎ノ門"; kens="東京"; keiyu="銀座線"; kyori=0.8; jikan=2};
{kiten="虎ノ門"; kenk="東京"; shuten="溜池山王"; kens="東京"; keiyu="銀座線"; kyori=0.6; jikan=2};
{kiten="溜池山王"; kenk="東京"; shuten="赤坂見附"; kens="東京"; keiyu="銀座線"; kyori=0.9; jikan=2};
{kiten="赤坂見附"; kenk="東京"; shuten="青山一丁目"; kens="東京"; keiyu="銀座線"; kyori=1.3; jikan=2};
{kiten="青山一丁目"; kenk="東京"; shuten="外苑前"; kens="東京"; keiyu="銀座線"; kyori=0.7; jikan=2};
{kiten="外苑前"; kenk="東京"; shuten="表参道"; kens="東京"; keiyu="銀座線"; kyori=0.7; jikan=1};
{kiten="表参道"; kenk="東京"; shuten="渋谷"; kens="東京"; keiyu="銀座線"; kyori=1.3; jikan=1};
{kiten="渋谷"; kenk="東京"; shuten="表参道"; kens="東京"; keiyu="半蔵門線"; kyori=1.3; jikan=2};
{kiten="表参道"; kenk="東京"; shuten="青山一丁目"; kens="東京"; keiyu="半蔵門線"; kyori=1.4; jikan=2};
{kiten="青山一丁目"; kenk="東京"; shuten="永田町"; kens="東京"; keiyu="半蔵門線"; kyori=1.3; jikan=2};
{kiten="永田町"; kenk="東京"; shuten="半蔵門"; kens="東京"; keiyu="半蔵門線"; kyori=1.0; jikan=2};
{kiten="半蔵門"; kenk="東京"; shuten="九段下"; kens="東京"; keiyu="半蔵門線"; kyori=1.6; jikan=2};
{kiten="九段下"; kenk="東京"; shuten="神保町"; kens="東京"; keiyu="半蔵門線"; kyori=0.4; jikan=1};
{kiten="神保町"; kenk="東京"; shuten="大手町"; kens="東京"; keiyu="半蔵門線"; kyori=1.7; jikan=3};
{kiten="大手町"; kenk="東京"; shuten="三越前"; kens="東京"; keiyu="半蔵門線"; kyori=0.7; jikan=1};
{kiten="三越前"; kenk="東京"; shuten="水天宮前"; kens="東京"; keiyu="半蔵門線"; kyori=1.3; jikan=2};
{kiten="水天宮前"; kenk="東京"; shuten="清澄白河"; kens="東京"; keiyu="半蔵門線"; kyori=1.7; jikan=3};
{kiten="清澄白河"; kenk="東京"; shuten="住吉"; kens="東京"; keiyu="半蔵門線"; kyori=1.9; jikan=3};
{kiten="住吉"; kenk="東京"; shuten="錦糸町"; kens="東京"; keiyu="半蔵門線"; kyori=1.; jikan=2};
{kiten="錦糸町"; kenk="東京"; shuten="押上"; kens="東京"; keiyu="半蔵門線"; kyori=1.4; jikan=2};
{kiten="中目黒"; kenk="東京"; shuten="恵比寿"; kens="東京"; keiyu="日比谷線"; kyori=1.; jikan=2};
{kiten="恵比寿"; kenk="東京"; shuten="広尾"; kens="東京"; keiyu="日比谷線"; kyori=1.5; jikan=3};
{kiten="広尾"; kenk="東京"; shuten="六本木"; kens="東京"; keiyu="日比谷線"; kyori=1.7; jikan=3};
{kiten="六本木"; kenk="東京"; shuten="神谷町"; kens="東京"; keiyu="日比谷線"; kyori=1.5; jikan=3};
{kiten="神谷町"; kenk="東京"; shuten="霞ヶ関"; kens="東京"; keiyu="日比谷線"; kyori=1.3; jikan=2};
{kiten="霞ヶ関"; kenk="東京"; shuten="日比谷"; kens="東京"; keiyu="日比谷線"; kyori=1.2; jikan=2};
{kiten="日比谷"; kenk="東京"; shuten="銀座"; kens="東京"; keiyu="日比谷線"; kyori=0.4; jikan=1};
{kiten="銀座"; kenk="東京"; shuten="東銀座"; kens="東京"; keiyu="日比谷線"; kyori=0.4; jikan=1};
{kiten="東銀座"; kenk="東京"; shuten="築地"; kens="東京"; keiyu="日比谷線"; kyori=0.6; jikan=2};
{kiten="築地"; kenk="東京"; shuten="八丁堀"; kens="東京"; keiyu="日比谷線"; kyori=1.; jikan=2};
{kiten="八丁堀"; kenk="東京"; shuten="茅場町"; kens="東京"; keiyu="日比谷線"; kyori=0.5; jikan=1};
{kiten="茅場町"; kenk="東京"; shuten="人形町"; kens="東京"; keiyu="日比谷線"; kyori=0.9; jikan=2};
{kiten="人形町"; kenk="東京"; shuten="小伝馬町"; kens="東京"; keiyu="日比谷線"; kyori=0.6; jikan=1};
{kiten="小伝馬町"; kenk="東京"; shuten="秋葉原"; kens="東京"; keiyu="日比谷線"; kyori=0.9; jikan=2};
{kiten="秋葉原"; kenk="東京"; shuten="仲御徒町"; kens="東京"; keiyu="日比谷線"; kyori=1.; jikan=1};
{kiten="仲御徒町"; kenk="東京"; shuten="上野"; kens="東京"; keiyu="日比谷線"; kyori=0.5; jikan=1};
{kiten="上野"; kenk="東京"; shuten="入谷"; kens="東京"; keiyu="日比谷線"; kyori=1.2; jikan=2};
{kiten="入谷"; kenk="東京"; shuten="三ノ輪"; kens="東京"; keiyu="日比谷線"; kyori=1.2; jikan=2};
{kiten="三ノ輪"; kenk="東京"; shuten="南千住"; kens="東京"; keiyu="日比谷線"; kyori=0.8; jikan=2};
{kiten="南千住"; kenk="東京"; shuten="北千住"; kens="東京"; keiyu="日比谷線"; kyori=1.8; jikan=3};
{kiten="池袋"; kenk="東京"; shuten="新大塚"; kens="東京"; keiyu="丸ノ内線"; kyori=1.8; jikan=3};
{kiten="新大塚"; kenk="東京"; shuten="茗荷谷"; kens="東京"; keiyu="丸ノ内線"; kyori=1.2; jikan=2};
{kiten="茗荷谷"; kenk="東京"; shuten="後楽園"; kens="東京"; keiyu="丸ノ内線"; kyori=1.8; jikan=2};
{kiten="後楽園"; kenk="東京"; shuten="本郷三丁目"; kens="東京"; keiyu="丸ノ内線"; kyori=0.8; jikan=1};
{kiten="本郷三丁目"; kenk="東京"; shuten="御茶ノ水"; kens="東京"; keiyu="丸ノ内線"; kyori=0.8; jikan=1};
{kiten="御茶ノ水"; kenk="東京"; shuten="淡路町"; kens="東京"; keiyu="丸ノ内線"; kyori=0.8; jikan=1};
{kiten="淡路町"; kenk="東京"; shuten="大手町"; kens="東京"; keiyu="丸ノ内線"; kyori=0.9; jikan=2};
{kiten="大手町"; kenk="東京"; shuten="東京"; kens="東京"; keiyu="丸ノ内線"; kyori=0.6; jikan=1};
{kiten="東京"; kenk="東京"; shuten="銀座"; kens="東京"; keiyu="丸ノ内線"; kyori=1.1; jikan=2};
{kiten="銀座"; kenk="東京"; shuten="霞ヶ関"; kens="東京"; keiyu="丸ノ内線"; kyori=1.0; jikan=2};
{kiten="霞ヶ関"; kenk="東京"; shuten="国会議事堂前"; kens="東京"; keiyu="丸ノ内線"; kyori=0.7; jikan=1};
{kiten="国会議事堂前"; kenk="東京"; shuten="赤坂見附"; kens="東京"; keiyu="丸ノ内線"; kyori=0.9; jikan=2};
{kiten="赤坂見附"; kenk="東京"; shuten="四ツ谷"; kens="東京"; keiyu="丸ノ内線"; kyori=1.3; jikan=2};
{kiten="四ツ谷"; kenk="東京"; shuten="四谷三丁目"; kens="東京"; keiyu="丸ノ内線"; kyori=1.0; jikan=2};
{kiten="四谷三丁目"; kenk="東京"; shuten="新宿御苑前"; kens="東京"; keiyu="丸ノ内線"; kyori=0.9; jikan=1};
{kiten="新宿御苑前"; kenk="東京"; shuten="新宿三丁目"; kens="東京"; keiyu="丸ノ内線"; kyori=0.7; jikan=1};
{kiten="新宿三丁目"; kenk="東京"; shuten="新宿"; kens="東京"; keiyu="丸ノ内線"; kyori=0.3; jikan=1};
{kiten="新宿"; kenk="東京"; shuten="西新宿"; kens="東京"; keiyu="丸ノ内線"; kyori=0.8; jikan=1};
{kiten="西新宿"; kenk="東京"; shuten="中野坂上"; kens="東京"; keiyu="丸ノ内線"; kyori=1.1; jikan=2};
{kiten="中野坂上"; kenk="東京"; shuten="新中野"; kens="東京"; keiyu="丸ノ内線"; kyori=1.1; jikan=2};
{kiten="新中野"; kenk="東京"; shuten="東高円寺"; kens="東京"; keiyu="丸ノ内線"; kyori=1.0; jikan=1};
{kiten="東高円寺"; kenk="東京"; shuten="新高円寺"; kens="東京"; keiyu="丸ノ内線"; kyori=0.9; jikan=1};
{kiten="新高円寺"; kenk="東京"; shuten="南阿佐ヶ谷"; kens="東京"; keiyu="丸ノ内線"; kyori=1.2; jikan=2};
{kiten="南阿佐ヶ谷"; kenk="東京"; shuten="荻窪"; kens="東京"; keiyu="丸ノ内線"; kyori=1.5; jikan=2};
{kiten="中野坂上"; kenk="東京"; shuten="中野新橋"; kens="東京"; keiyu="丸ノ内線"; kyori=1.3; jikan=2};
{kiten="中野新橋"; kenk="東京"; shuten="中野富士見町"; kens="東京"; keiyu="丸ノ内線"; kyori=0.6; jikan=1};
{kiten="中野富士見町"; kenk="東京"; shuten="方南町"; kens="東京"; keiyu="丸ノ内線"; kyori=1.3; jikan=2};
{kiten="市ヶ谷"; kenk="東京"; shuten="四ツ谷"; kens="東京"; keiyu="南北線"; kyori=1.0; jikan=2};
{kiten="四ツ谷"; kenk="東京"; shuten="永田町"; kens="東京"; keiyu="南北線"; kyori=1.3; jikan=3};
{kiten="永田町"; kenk="東京"; shuten="溜池山王"; kens="東京"; keiyu="南北線"; kyori=0.9; jikan=1};
{kiten="溜池山王"; kenk="東京"; shuten="六本木一丁目"; kens="東京"; keiyu="南北線"; kyori=0.9; jikan=2};
{kiten="六本木一丁目"; kenk="東京"; shuten="麻布十番"; kens="東京"; keiyu="南北線"; kyori=1.2; jikan=2};
{kiten="麻布十番"; kenk="東京"; shuten="白金高輪"; kens="東京"; keiyu="南北線"; kyori=1.3; jikan=2};
{kiten="白金高輪"; kenk="東京"; shuten="白金台"; kens="東京"; keiyu="南北線"; kyori=1.0; jikan=2};
{kiten="白金台"; kenk="東京"; shuten="目黒"; kens="東京"; keiyu="南北線"; kyori=1.3; jikan=2};
{kiten="市ヶ谷"; kenk="東京"; shuten="飯田橋"; kens="東京"; keiyu="南北線"; kyori=1.1; jikan=2};
{kiten="飯田橋"; kenk="東京"; shuten="後楽園"; kens="東京"; keiyu="南北線"; kyori=1.4; jikan=2};
{kiten="後楽園"; kenk="東京"; shuten="東大前"; kens="東京"; keiyu="南北線"; kyori=1.3; jikan=3};
{kiten="東大前"; kenk="東京"; shuten="本駒込"; kens="東京"; keiyu="南北線"; kyori=0.9; jikan=2};
{kiten="本駒込"; kenk="東京"; shuten="駒込"; kens="東京"; keiyu="南北線"; kyori=1.4; jikan=2};
{kiten="駒込"; kenk="東京"; shuten="西ヶ原"; kens="東京"; keiyu="南北線"; kyori=1.4; jikan=2};
{kiten="西ヶ原"; kenk="東京"; shuten="王子"; kens="東京"; keiyu="南北線"; kyori=1.0; jikan=2};
{kiten="王子"; kenk="東京"; shuten="王子神谷"; kens="東京"; keiyu="南北線"; kyori=1.2; jikan=2};
{kiten="王子神谷"; kenk="東京"; shuten="志茂"; kens="東京"; keiyu="南北線"; kyori=1.6; jikan=3};
{kiten="志茂"; kenk="東京"; shuten="赤羽岩淵"; kens="東京"; keiyu="南北線"; kyori=1.1; jikan=2};
{kiten="西船橋"; kenk="千葉"; shuten="原木中山"; kens="千葉"; keiyu="東西線"; kyori=1.9; jikan=3};
{kiten="原木中山"; kenk="千葉"; shuten="妙典"; kens="千葉"; keiyu="東西線"; kyori=2.1; jikan=2};
{kiten="妙典"; kenk="千葉"; shuten="行徳"; kens="千葉"; keiyu="東西線"; kyori=1.3; jikan=2};
{kiten="行徳"; kenk="千葉"; shuten="南行徳"; kens="千葉"; keiyu="東西線"; kyori=1.5; jikan=2};
{kiten="南行徳"; kenk="千葉"; shuten="浦安"; kens="千葉"; keiyu="東西線"; kyori=1.2; jikan=2};
{kiten="浦安"; kenk="千葉"; shuten="葛西"; kens="東京"; keiyu="東西線"; kyori=1.9; jikan=2};
{kiten="葛西"; kenk="東京"; shuten="西葛西"; kens="東京"; keiyu="東西線"; kyori=1.2; jikan=2};
{kiten="西葛西"; kenk="東京"; shuten="南砂町"; kens="東京"; keiyu="東西線"; kyori=2.7; jikan=2};
{kiten="南砂町"; kenk="東京"; shuten="東陽町"; kens="東京"; keiyu="東西線"; kyori=1.2; jikan=2};
{kiten="東陽町"; kenk="東京"; shuten="木場"; kens="東京"; keiyu="東西線"; kyori=0.9; jikan=1};
{kiten="木場"; kenk="東京"; shuten="門前仲町"; kens="東京"; keiyu="東西線"; kyori=1.1; jikan=1};
{kiten="門前仲町"; kenk="東京"; shuten="茅場町"; kens="東京"; keiyu="東西線"; kyori=1.8; jikan=2};
{kiten="茅場町"; kenk="東京"; shuten="日本橋"; kens="東京"; keiyu="東西線"; kyori=0.5; jikan=1};
{kiten="日本橋"; kenk="東京"; shuten="大手町"; kens="東京"; keiyu="東西線"; kyori=0.8; jikan=1};
{kiten="大手町"; kenk="東京"; shuten="竹橋"; kens="東京"; keiyu="東西線"; kyori=1.0; jikan=2};
{kiten="竹橋"; kenk="東京"; shuten="九段下"; kens="東京"; keiyu="東西線"; kyori=1.0; jikan=1};
{kiten="九段下"; kenk="東京"; shuten="飯田橋"; kens="東京"; keiyu="東西線"; kyori=0.7; jikan=1};
{kiten="飯田橋"; kenk="東京"; shuten="神楽坂"; kens="東京"; keiyu="東西線"; kyori=1.2; jikan=2};
{kiten="神楽坂"; kenk="東京"; shuten="早稲田"; kens="東京"; keiyu="東西線"; kyori=1.2; jikan=2};
{kiten="早稲田"; kenk="東京"; shuten="高田馬場"; kens="東京"; keiyu="東西線"; kyori=1.7; jikan=3};
{kiten="高田馬場"; kenk="東京"; shuten="落合"; kens="東京"; keiyu="東西線"; kyori=1.9; jikan=3};
{kiten="落合"; kenk="東京"; shuten="中野"; kens="東京"; keiyu="東西線"; kyori=2.0; jikan=3};
{kiten="新木場"; kenk="東京"; shuten="辰巳"; kens="東京"; keiyu="有楽町線"; kyori=1.5; jikan=2};
{kiten="辰巳"; kenk="東京"; shuten="豊洲"; kens="東京"; keiyu="有楽町線"; kyori=1.7; jikan=2};
{kiten="豊洲"; kenk="東京"; shuten="月島"; kens="東京"; keiyu="有楽町線"; kyori=1.4; jikan=2};
{kiten="月島"; kenk="東京"; shuten="新富町"; kens="東京"; keiyu="有楽町線"; kyori=1.3; jikan=2};
{kiten="新富町"; kenk="東京"; shuten="銀座一丁目"; kens="東京"; keiyu="有楽町線"; kyori=0.7; jikan=1};
{kiten="銀座一丁目"; kenk="東京"; shuten="有楽町"; kens="東京"; keiyu="有楽町線"; kyori=0.5; jikan=1};
{kiten="有楽町"; kenk="東京"; shuten="桜田門"; kens="東京"; keiyu="有楽町線"; kyori=1.0; jikan=1};
{kiten="桜田門"; kenk="東京"; shuten="永田町"; kens="東京"; keiyu="有楽町線"; kyori=0.9; jikan=2};
{kiten="永田町"; kenk="東京"; shuten="麹町"; kens="東京"; keiyu="有楽町線"; kyori=0.9; jikan=1};
{kiten="麹町"; kenk="東京"; shuten="市ヶ谷"; kens="東京"; keiyu="有楽町線"; kyori=0.9; jikan=1};
{kiten="市ヶ谷"; kenk="東京"; shuten="飯田橋"; kens="東京"; keiyu="有楽町線"; kyori=1.1; jikan=2};
{kiten="飯田橋"; kenk="東京"; shuten="江戸川橋"; kens="東京"; keiyu="有楽町線"; kyori=1.6; jikan=3};
{kiten="江戸川橋"; kenk="東京"; shuten="護国寺"; kens="東京"; keiyu="有楽町線"; kyori=1.3; jikan=2};
{kiten="護国寺"; kenk="東京"; shuten="東池袋"; kens="東京"; keiyu="有楽町線"; kyori=1.1; jikan=2};
{kiten="東池袋"; kenk="東京"; shuten="池袋"; kens="東京"; keiyu="有楽町線"; kyori=0.9; jikan=2};
{kiten="池袋"; kenk="東京"; shuten="要町"; kens="東京"; keiyu="有楽町線"; kyori=1.2; jikan=2};
{kiten="要町"; kenk="東京"; shuten="千川"; kens="東京"; keiyu="有楽町線"; kyori=1.0; jikan=1};
{kiten="千川"; kenk="東京"; shuten="小竹向原"; kens="東京"; keiyu="有楽町線"; kyori=1.0; jikan=2};
{kiten="小竹向原"; kenk="東京"; shuten="氷川台"; kens="東京"; keiyu="有楽町線"; kyori=1.5; jikan=2};
{kiten="氷川台"; kenk="東京"; shuten="平和台"; kens="東京"; keiyu="有楽町線"; kyori=1.4; jikan=2};
{kiten="平和台"; kenk="東京"; shuten="地下鉄赤塚"; kens="東京"; keiyu="有楽町線"; kyori=1.8; jikan=2};
{kiten="地下鉄赤塚"; kenk="東京"; shuten="地下鉄成増"; kens="東京"; keiyu="有楽町線"; kyori=1.5; jikan=2};
{kiten="地下鉄成増"; kenk="東京"; shuten="和光市"; kens="埼玉"; keiyu="有楽町線"; kyori=2.1; jikan=3};
]