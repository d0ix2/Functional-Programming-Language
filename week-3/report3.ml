let manhattan (a, b) (c, d) =  abs (a - c) + abs (b - d)

type ekimei_t = {
  kanji: string;
  kana: string;
  romaji: string;
  ken: string;
  shozoku: string;
}

let hyoji ekimei_t = ekimei_t.ken ^ "：" 
                      ^ ekimei_t.shozoku ^ "、"
                      ^ ekimei_t.kanji ^ "（"
                      ^ ekimei_t.kana ^ ")"