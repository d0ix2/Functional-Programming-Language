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
{kanji="漣川"; kana="연천역"; romaji="Yeoncheon"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="全谷"; kana="전곡역"; romaji="Jeongok"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="靑山"; kana="청산역"; romaji="Cheongsan"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="逍遙山"; kana="소요산역"; romaji="Soyosan"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="東豆川"; kana="동두천역"; romaji="Dongducheon"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="保山"; kana="보산역"; romaji="Bosan"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="東豆川中央"; kana="동두천중앙역"; romaji="Dongducheon Jungang"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="指行"; kana="지행역"; romaji="Jihaeng"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="德井"; kana="덕정역"; romaji="Deokjeong"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="德溪"; kana="덕계역"; romaji="Deokgye"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="楊州"; kana="양주역"; romaji="Yangju"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="綠陽"; kana="녹양역"; romaji="Nogyang"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="加寧"; kana="가능역"; romaji="Ganeung"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="義政府"; kana="의정부역"; romaji="Uijeongbu"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="回龍"; kana="회룡역"; romaji="Hoeryong"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="望月寺"; kana="망월사역"; romaji="Mangwolsa"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="道峰山"; kana="도봉산역"; romaji="Dobongsan"; ken="ソウル特別市"; shozoku="１号線"};
{kanji="カチ山"; kana="까치산"; romaji="Kkachisan"; ken="ソウル特別市"; shozoku="２号線"};
{kanji="進亭ネゴリ"; kana="신정네거리"; romaji="Sinjeongnegeori"; ken="ソウル特別市"; shozoku="２号線"};
{kanji="陽川区庁"; kana="양천구청"; romaji="Yangcheon-gu Office"; ken="ソウル特別市"; shozoku="２号線"};
{kanji="道林川"; kana="도림천"; romaji="Dorimcheon"; ken="ソウル特別市"; shozoku="２号線"};
{kanji="新道林"; kana="신도림"; romaji="Sindorim"; ken="ソウル特別市"; shozoku="２号線"};
{kanji="文来（金眼科病院）"; kana="문래(김안과병원)"; romaji="Mullae (Kim's Eye Hospital)"; ken="ソウル特別市"; shozoku="２号線"};
{kanji="永登浦区庁"; kana="영등포구청"; romaji="Yeongdeungpo-gu Office"; ken="ソウル特別市"; shozoku="２号線"};
{kanji="堂山"; kana="당산"; romaji="Dangsan"; ken="ソウル特別市"; shozoku="２号線"};
{kanji="合井（SeAHタワー）"; kana="합정(세아타워)"; romaji="Hapjeong(SeAH Tower)"; ken="ソウル特別市"; shozoku="２号線"};
{kanji="弘大入口"; kana="홍대입구"; romaji="Hongik Univ."; ken="ソウル特別市"; shozoku="２号線"};
{kanji="新村"; kana="신촌"; romaji="Sinchon"; ken="ソウル特別市"; shozoku="２号線"};
{kanji="梨大"; kana="이대"; romaji="Ewha Womans Univ."; ken="ソウル特別市"; shozoku="２号線"};
{kanji="碌磻"; kana="녹번"; romaji="Nokbeon"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="弘済"; kana="홍제"; romaji="Hongje"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="毋岳チェ"; kana="무악재"; romaji="Muakjae"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="独立門"; kana="독립문"; romaji="Dongnimmun"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="景福宮"; kana="경복궁"; romaji="Gyeongbokgung"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="安国"; kana="안국"; romaji="Anguk"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="鐘路３街"; kana="종로3가"; romaji="Jongno3(sam)-ga"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="乙支路３街"; kana="을지로3가"; romaji="Euljiro3(sam)-ga"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="忠武路"; kana="충무로"; romaji="Chungmuro"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="東大入口"; kana="동대입구"; romaji="Dongguk Univ."; ken="ソウル特別市"; shozoku="３号線"};
{kanji="薬水"; kana="약수"; romaji="Yaksu"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="金湖"; kana="금호"; romaji="Geumho"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="玉水"; kana="옥수"; romaji="Oksu"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="狎鴎亭"; kana="압구정"; romaji="Apgujeong"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="新沙"; kana="신사"; romaji="Sinsa"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="蚕院"; kana="잠원"; romaji="Jamwon"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="高速ターミナル"; kana="고속터미널"; romaji="Express Bus Terminal"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="教大"; kana="교대"; romaji="Seoul Nat'l Univ. of Education"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="南部ターミナル"; kana="남부터미널"; romaji="Nambu Bus Terminal"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="良才"; kana="양재"; romaji="Yangjae"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="メボン"; kana="매봉"; romaji="Maebong"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="道谷"; kana="도곡"; romaji="Dogok"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="大峙"; kana="대치"; romaji="Daechi"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="ハンニョウル"; kana="학여울"; romaji="Hangnyeoul"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="テチョン"; kana="대청"; romaji="Daecheong"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="逸院"; kana="일원"; romaji="Irwon"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="水西"; kana="수서"; romaji="Suseo"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="可楽市場"; kana="가락시장"; romaji="Garak Market"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="警察病院"; kana="경찰병원"; romaji="National Police Hospital"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="梧琴"; kana="오금"; romaji="Ogeum"; ken="ソウル特別市"; shozoku="３号線"};
{kanji="傍花"; kana="방화"; romaji="Banghwa"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="開花山"; kana="개화산"; romaji="Gaehwasan"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="金浦空港"; kana="김포공항"; romaji="Gimpo Int'l Airport"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="松亭"; kana="송정"; romaji="Songjeong"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="麻谷"; kana="마곡"; romaji="Magok"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="鉢山"; kana="발산"; romaji="Balsan"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="雨装山"; kana="우장산"; romaji="Ujangsan"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="禾谷"; kana="화곡"; romaji="Hwagok"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="カチ山"; kana="까치산"; romaji="Kkachisan"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="新亭"; kana="신정"; romaji="Sinjeong"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="木洞"; kana="목동"; romaji="Mok-dong"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="梧木橋"; kana="오목교"; romaji="Omokgyo"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="楊坪"; kana="양평"; romaji="Yangpyeong"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="永登浦区庁"; kana="영등포구청"; romaji="Yeongdeungpo-gu Office"; ken="ソウル特別市"; shozoku="５号線"};
{kanji="永登浦市場"; kana="영등포시장역"; romaji="Yeongdeungpo Market"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="新吉"; kana="신길역"; romaji="Singil"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="汝矣島"; kana="여의도역"; romaji="Yeouido"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="汝矣ナル"; kana="여의나루역"; romaji="Yeouinaru"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="麻浦"; kana="마포역"; romaji="Mapo"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="孔徳"; kana="공덕역"; romaji="Gongdeok"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="エオゲ"; kana="애오개역"; romaji="Aeogae"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="忠正路"; kana="충정로(경기대입구)역"; romaji="Chungieongno"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="西大門"; kana="서대문역"; romaji="Seodaemun"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="光化門"; kana="광화문(세종문화회관)역"; romaji="Gwanghwamun"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="鐘路3街"; kana="종로3가(탑골공원)역"; romaji="Jongno3(sam)-ga"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="乙支路4街"; kana="을지로4가(BC카드)역"; romaji="Euljiro4(sa)-ga"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="東大門歴史文化公園"; kana="동대문역사문화공원(DDP)역"; romaji="Dongdaemun History&Culture Park"; ken="ソウル特別市"; shozoku="5号線"};
{kanji="長岩"; kana ="장암"; romaji="Jangam"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="石南"; kana="석남"; romaji="Seongnam (Geobuk Market)"; ken="仁川広域市"; shozoku="７号線"};
{kanji="山谷"; kana="산곡"; romaji="Sangok"; ken="仁川広域市"; shozoku="７号線"};
{kanji="富平区庁"; kana="부평구청"; romaji="Bupyeong-gu Office"; ken="仁川広域市"; shozoku="７号線"};
{kanji="掘浦川"; kana="굴포천"; romaji="Gulpocheon"; ken="仁川広域市"; shozoku="７号線"};
{kanji="三山体育館"; kana="삼산체육관"; romaji="Samsan Gymnasium"; ken="仁川広域市"; shozoku="７号線"};
{kanji="上洞"; kana="상동"; romaji="Sangdong"; ken="京畿道"; shozoku="７号線"};
{kanji="富川市庁"; kana="부천시청"; romaji="Bucheon City Hall "; ken="京畿道"; shozoku="７号線"};
{kanji="新中洞"; kana="신중동"; romaji="Sinjungdong"; ken="京畿道"; shozoku="７号線"};
{kanji="春衣"; kana="춘의"; romaji="Chunui"; ken="京畿道"; shozoku="７号線"};
{kanji="富川総合運動公園"; kana="부천종합운동장"; romaji="Bucheon Stadium"; ken="京畿道"; shozoku="７号線"};
{kanji="カチウル"; kana="까치울역"; romaji="Kkachiul"; ken="京畿道"; shozoku="７号線"};
{kanji="温水"; kana="온수"; romaji="Onsu"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="天旺"; kana="천왕역"; romaji="Cheonwang"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="光明サゴリ"; kana="광명사거리역"; romaji="Gwangmyeongsageori"; ken="京畿道"; shozoku="７号線"};

{kanji="道峰山"; kana="도봉산"; romaji="Dobongsan"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="水落山"; kana="수락산"; romaji="Suraksan"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="マドゥル"; kana="마들"; romaji="Madeul"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="蘆原"; kana="노원"; romaji="Nowon"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="中渓"; kana="중계"; romaji="Junggye"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="下渓"; kana="하계"; romaji="Hagye"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="孔陵"; kana="공릉"; romaji="Gongneung"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="泰陵入口"; kana="태릉입구"; romaji="Taereung"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="モッコル"; kana="먹골"; romaji="Meokgol"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="中和"; kana="중화"; romaji="Junghwa"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="上鳳"; kana="상봉"; romaji="Sangbong"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="面牧"; kana="면목"; romaji="Myeonmok"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="四佳亭"; kana="사가정"; romaji="Sagajeong"; ken="ソウル特別市"; shozoku="７号線"};
{kanji="開花"; kana="개화"; romaji="Gaehwa"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="金浦空港"; kana="김포공항"; romaji="Gimpo Int'l Airport"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="空港市場"; kana="공항시장"; romaji="Airport Market"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="新傍花"; kana="신방화"; romaji="Sinbanghwa"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="麻谷ナル"; kana="마곡나루"; romaji="Magongnaru"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="陽川鄉校"; kana="양천향교"; romaji="Yangcheon Hyanggyo"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="加陽"; kana="가양"; romaji="Gayang"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="曽米"; kana="증미"; romaji="Jeungmi"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="登村"; kana="등촌"; romaji="Deungchon"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="塩倉"; kana="염창"; romaji="eomchang"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="新木洞"; kana="신목동"; romaji="Sinmok-dong"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="仙遊島"; kana="선유도"; romaji="Seonyudo"; ken="ソウル特別市"; shozoku="9号線"};
{kanji="堂山"; kana="당산"; romaji="Dangsan"; ken="ソウル特別市"; shozoku="9号線"};
]
let global_ekikan_list = [
{kiten="漣川"; kenk="ソウル特別市"; shuten="全谷"; kens="ソウル特別市"; keiyu="１号線"; kyori=8.7; jikan=3};
{kiten="全谷"; kenk="ソウル特別市"; shuten="靑山"; kens="ソウル特別市"; keiyu="１号線"; kyori=3.3; jikan=3};
{kiten="靑山"; kenk="ソウル特別市"; shuten="逍遙山"; kens="ソウル特別市"; keiyu="１号線"; kyori=5.8; jikan=3};
{kiten="逍遙山"; kenk="ソウル特別市"; shuten="東豆川"; kens="ソウル特別市"; keiyu="１号線"; kyori=2.5; jikan=3};
{kiten="東豆川"; kenk="ソウル特別市"; shuten="保山"; kens="ソウル特別市"; keiyu="１号線"; kyori=1.6; jikan=3};
{kiten="保山"; kenk="ソウル特別市"; shuten="東豆川中央"; kens="ソウル特別市"; keiyu="１号線"; kyori=1.4; jikan=3};
{kiten="東豆川中央"; kenk="ソウル特別市"; shuten="指行"; kens="ソウル特別市"; keiyu="１号線"; kyori=1.0; jikan=3};
{kiten="指行"; kenk="ソウル特別市"; shuten="德井"; kens="ソウル特別市"; keiyu="１号線"; kyori=5.6; jikan=3};
{kiten="德井"; kenk="ソウル特別市"; shuten="德溪"; kens="ソウル特別市"; keiyu="１号線"; kyori=2.9; jikan=3};
{kiten="德溪"; kenk="ソウル特別市"; shuten="楊州"; kens="ソウル特別市"; keiyu="１号線"; kyori=5.3; jikan=3};
{kiten="楊州"; kenk="ソウル特別市"; shuten="綠陽"; kens="ソウル特別市"; keiyu="１号線"; kyori=1.6; jikan=3};
{kiten="綠陽"; kenk="ソウル特別市"; shuten="加寧"; kens="ソウル特別市"; keiyu="１号線"; kyori=1.3; jikan=3};
{kiten="加寧"; kenk="ソウル特別市"; shuten="義政府"; kens="ソウル特別市"; keiyu="１号線"; kyori=1.2; jikan=3};
{kiten="義政府"; kenk="ソウル特別市"; shuten="回龍"; kens="ソウル特別市"; keiyu="１号線"; kyori=1.6; jikan=3};
{kiten="回龍"; kenk="ソウル特別市"; shuten="望月寺"; kens="ソウル特別市"; keiyu="１号線"; kyori=1.4; jikan=3};
{kiten="望月寺"; kenk="ソウル特別市"; shuten="道峰山"; kens="ソウル特別市"; keiyu="１号線"; kyori=2.3; jikan=3};
{kiten="カチ山"; kenk="ソウル特別市"; shuten="進亭ネゴリ"; kens="ソウル特別市"; keiyu="２号線"; kyori=1.4; jikan=3};
{kiten="進亭ネゴリ"; kenk="ソウル特別市"; shuten="陽川区庁"; kens="ソウル特別市"; keiyu="２号線"; kyori=1.9; jikan=4};
{kiten="陽川区庁"; kenk="ソウル特別市"; shuten="道林川"; kens="ソウル特別市"; keiyu="２号線"; kyori=1.7; jikan=3};
{kiten="道林川"; kenk="ソウル特別市"; shuten="新道林"; kens="ソウル特別市"; keiyu="２号線"; kyori=1.0; jikan=2};
{kiten="新道林"; kenk="ソウル特別市"; shuten="文来（金眼科病院）"; kens="ソウル特別市"; keiyu="２号線"; kyori=1.2; jikan=2};
{kiten="文来（金眼科病院）"; kenk="ソウル特別市"; shuten="永登浦区庁"; kens="ソウル特別市"; keiyu="２号線"; kyori=0.9; jikan=2};
{kiten="永登浦区庁"; kenk="ソウル特別市"; shuten="堂山"; kens="ソウル特別市"; keiyu="２号線"; kyori=1.1; jikan=2};
{kiten="堂山"; kenk="ソウル特別市"; shuten="文来（金眼科病院）"; kens="合井（SeAHタワー）"; keiyu="２号線"; kyori=2.0; jikan=4};
{kiten="合井（SeAHタワー）"; kenk="ソウル特別市"; shuten="弘大入口"; kens="ソウル特別市"; keiyu="２号線"; kyori=1.1; jikan=2};
{kiten="弘大入口"; kenk="ソウル特別市"; shuten="新村"; kens="ソウル特別市"; keiyu="２号線"; kyori=1.3; jikan=2};
{kiten="新村"; kenk="ソウル特別市"; shuten="梨大"; kens="ソウル特別市"; keiyu="２号線"; kyori=0.8; jikan=2};
{kiten="碌磻"; kenk="ソウル特別市"; shuten="弘済"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.6; jikan=3};
{kiten="弘済"; kenk="ソウル特別市"; shuten="毋岳チェ"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.9; jikan=2};
{kiten="毋岳チェ"; kenk="ソウル特別市"; shuten="独立門"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.1; jikan=2};
{kiten="独立門"; kenk="ソウル特別市"; shuten="景福宮"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.6; jikan=2};
{kiten="景福宮"; kenk="ソウル特別市"; shuten="安国"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.1; jikan=2};
{kiten="安国"; kenk="ソウル特別市"; shuten="鐘路３街"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.0; jikan=2};
{kiten="鐘路３街"; kenk="ソウル特別市"; shuten="乙支路３街"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.6; jikan=2};
{kiten="乙支路３街"; kenk="ソウル特別市"; shuten="忠武路"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.7; jikan=1};
{kiten="忠武路"; kenk="ソウル特別市"; shuten="東大入口"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.9; jikan=3};
{kiten="東大入口"; kenk="ソウル特別市"; shuten="薬水"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.7; jikan=1};
{kiten="薬水"; kenk="ソウル特別市"; shuten="金湖"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.8; jikan=1};
{kiten="金湖"; kenk="ソウル特別市"; shuten="玉水"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.8; jikan=2};
{kiten="玉水"; kenk="ソウル特別市"; shuten="狎鴎亭"; kens="ソウル特別市"; keiyu="３号線"; kyori=2.1; jikan=2};
{kiten="狎鴎亭"; kenk="ソウル特別市"; shuten="新沙"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.5; jikan=3};
{kiten="新沙"; kenk="ソウル特別市"; shuten="蚕院"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.9; jikan=2};
{kiten="蚕院"; kenk="ソウル特別市"; shuten="高速ターミナル"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.2; jikan=2};
{kiten="高速ターミナル"; kenk="ソウル特別市"; shuten="教大"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.6; jikan=2};
{kiten="教大"; kenk="ソウル特別市"; shuten="南部ターミナル"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.9; jikan=2};
{kiten="南部ターミナル"; kenk="ソウル特別市"; shuten="良才"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.8; jikan=3};
{kiten="良才"; kenk="ソウル特別市"; shuten="メボン"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.2; jikan=2};
{kiten="メボン"; kenk="ソウル特別市"; shuten="道谷"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.8; jikan=2};
{kiten="道谷"; kenk="ソウル特別市"; shuten="大峙"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.8; jikan=2};
{kiten="大峙"; kenk="ソウル特別市"; shuten="ハンニョウル"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.8; jikan=1};
{kiten="ハンニョウル"; kenk="ソウル特別市"; shuten="テチョン"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.9; jikan=2};
{kiten="テチョン"; kenk="ソウル特別市"; shuten="逸院"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.2; jikan=2};
{kiten="逸院"; kenk="ソウル特別市"; shuten="水西"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.8; jikan=2};
{kiten="水西"; kenk="ソウル特別市"; shuten="可楽市場"; kens="ソウル特別市"; keiyu="３号線"; kyori=1.4; jikan=2};
{kiten="可楽市場"; kenk="ソウル特別市"; shuten="警察病院"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.8; jikan=2};
{kiten="警察病院"; kenk="ソウル特別市"; shuten="梧琴"; kens="ソウル特別市"; keiyu="３号線"; kyori=0.8; jikan=1};
{kiten="永登浦区庁"; kenk="ソウル特別市"; shuten="永登浦市場"; kens="ソウル特別市"; keiyu="号線"; kyori=1.1; jikan=1};
{kiten="傍花"; kenk="ソウル特別市"; shuten="開花山"; kens="ソウル特別市"; keiyu="５号線"; kyori=0.9; jikan=2};
{kiten="開花山"; kenk="ソウル特別市"; shuten="金浦空港"; kens="ソウル特別市"; keiyu="５号線"; kyori=1.2; jikan=2};
{kiten="金浦空港"; kenk="ソウル特別市"; shuten="松亭"; kens="ソウル特別市"; keiyu="５号線"; kyori=1.2; jikan=2};
{kiten="松亭"; kenk="ソウル特別市"; shuten="麻谷"; kens="ソウル特別市"; keiyu="５号線"; kyori=1.1; jikan=2};
{kiten="麻谷"; kenk="ソウル特別市"; shuten="鉢山"; kens="ソウル特別市"; keiyu="５号線"; kyori=1.2; jikan=2};
{kiten="鉢山"; kenk="ソウル特別市"; shuten="雨装山"; kens="ソウル特別市"; keiyu="５号線"; kyori=1.1; jikan=2};
{kiten="雨装山"; kenk="ソウル特別市"; shuten="禾谷"; kens="ソウル特別市"; keiyu="５号線"; kyori=1.0; jikan=2};
{kiten="禾谷"; kenk="ソウル特別市"; shuten="カチ山"; kens="ソウル特別市"; keiyu="５号線"; kyori=1.2; jikan=2};
{kiten="カチ山"; kenk="ソウル特別市"; shuten="新亭"; kens="ソウル特別市"; keiyu="５号線"; kyori=1.3; jikan=2};
{kiten="新亭"; kenk="ソウル特別市"; shuten="木洞"; kens="ソウル特別市"; keiyu="５号線"; kyori=0.8; jikan=2};
{kiten="木洞"; kenk="ソウル特別市"; shuten="梧木橋"; kens="ソウル特別市"; keiyu="５号線"; kyori=0.9; jikan=1};
{kiten="梧木橋"; kenk="ソウル特別市"; shuten="楊坪"; kens="ソウル特別市"; keiyu="５号線"; kyori=1.1; jikan=2};
{kiten="楊坪"; kenk="ソウル特別市"; shuten="永登浦区庁"; kens="ソウル特別市"; keiyu="５号線"; kyori=0.8; jikan=2};

{kiten="永登浦市場"; kenk="ソウル特別市"; shuten="新吉"; kens="ソウル特別市"; keiyu="5号線"; kyori=1.0; jikan=2};
{kiten="新吉"; kenk="ソウル特別市"; shuten="汝矣島"; kens="ソウル特別市"; keiyu="5号線"; kyori=1.0; jikan=2};
{kiten="汝矣島"; kenk="ソウル特別市"; shuten="汝矣ナル"; kens="ソウル特別市"; keiyu="5号線"; kyori=1.0; jikan=0};
{kiten="汝矣ナル"; kenk="ソウル特別市"; shuten="麻浦"; kens="ソウル特別市"; keiyu="5号線"; kyori=1.8; jikan=3};
{kiten="麻浦"; kenk="ソウル特別市"; shuten="孔徳"; kens="ソウル特別市"; keiyu="5号線"; kyori=0.8; jikan=1};
{kiten="孔徳"; kenk="ソウル特別市"; shuten="エオゲ"; kens="ソウル特別市"; keiyu="5号線"; kyori=1.1; jikan=2};
{kiten="エオゲ"; kenk="ソウル特別市"; shuten="忠正路"; kens="ソウル特別市"; keiyu="5号線"; kyori=0.9; jikan=2};
{kiten="忠正路"; kenk="ソウル特別市"; shuten="西大門"; kens="ソウル特別市"; keiyu="5号線"; kyori=0.7; jikan=2};
{kiten="西大門"; kenk="ソウル特別市"; shuten="光化門"; kens="ソウル特別市"; keiyu="5号線"; kyori=1.1; jikan=2};
{kiten="光化門"; kenk="ソウル特別市"; shuten="鐘路3街"; kens="ソウル特別市"; keiyu="5号線"; kyori=1.2; jikan=3};
{kiten="鐘路3街"; kenk="ソウル特別市"; shuten="乙支路4街"; kens="ソウル特別市"; keiyu="5号線"; kyori=1.0; jikan=1};
{kiten="乙支路4街"; kenk="ソウル特別市"; shuten="東大門歴史文化公園"; kens="ソウル特別市"; keiyu="5号線"; kyori=0.9; jikan=2};
{kiten="長岩"; kenk="ソウル特別市"; shuten="道峰山"; kens="ソウル特別市"; keiyu="７号線"; kyori=1.4; jikan=5};
{kiten="石南"; kenk="仁川広域市"; shuten="山谷"; kens="仁川広域市"; keiyu="7号線"; kyori=2.6; jikan=2};
{kiten="山谷"; kenk="仁川広域市"; shuten="富平区庁"; kens="仁川広域市"; keiyu="７号線"; kyori=1.6; jikan=2};
{kiten="富平区庁"; kenk="仁川広域市"; shuten="堀浦川"; kens="仁川広域市"; keiyu="７号線"; kyori=0.9; jikan=2};
{kiten="浦堀川"; kenk="仁川広域市"; shuten="三山体育館"; kens="仁川広域市"; keiyu="7号線"; kyori=0.9; jikan=2};
{kiten="三山体育館"; kenk="仁川広域市"; shuten="上洞"; kens="京畿道"; keiyu="７号線"; kyori=1.1; jikan=2};
{kiten="上洞"; kenk="京畿道"; shuten="富川市庁"; kens="京畿道"; keiyu="７号線"; kyori=0.9; jikan=2};
{kiten="富川市庁"; kenk="京畿道"; shuten="新中洞"; kens="京畿道"; keiyu="７号線"; kyori=1.1; jikan=2};
{kiten="新中洞"; kenk="京畿道"; shuten="春衣"; kens="京畿道"; keiyu="７号線"; kyori=1.0; jikan=2};
{kiten="春衣"; kenk="京畿道"; shuten="富川総合運動場"; kens="京畿道"; keiyu="７号線"; kyori=0.9; jikan=2};
{kiten="富川総合運動場"; kenk="京畿道"; shuten="カウチル"; kens="京畿道"; keiyu="７号線"; kyori=1.2; jikan=2};
{kiten="カウチル"; kenk="京畿道"; shuten="温水"; kens="ソウル特別市"; keiyu="７号線"; kyori=2.2; jikan=3};
{kiten="温水"; kenk="ソウル特別市"; shuten="天旺"; kens="ソウル特別市"; keiyu="7号線"; kyori=1.5; jikan=2};
{kiten="天旺"; kenk="ソウル特別市"; shuten="光明サゴリ"; kens="京畿道"; keiyu="７号線"; kyori=1.7; jikan=3};
{kiten="光明サゴリ"; kenk="京畿道"; shuten="鉄山"; kens="京畿道"; keiyu="７号線"; kyori=1.3; jikan=2};

{kiten="道峰山"; kenk="ソウル特別市"; shuten="水落山"; kens="ソウル特別市"; keiyu="７号線"; kyori=1.6; jikan=3};
{kiten="水落山"; kenk="ソウル特別市"; shuten="マドゥル"; kens="ソウル特別市"; keiyu="７号線"; kyori=1.4; jikan=2};
{kiten="マドゥル"; kenk="ソウル特別市"; shuten="蘆原"; kens="ソウル特別市"; keiyu="７号線"; kyori=1.2; jikan=2};
{kiten="蘆原"; kenk="ソウル特別市"; shuten="中渓"; kens="ソウル特別市"; keiyu="７号線"; kyori=1.1; jikan=2};
{kiten="中渓"; kenk="ソウル特別市"; shuten="下渓"; kens="ソウル特別市"; keiyu="７号線"; kyori=1.0; jikan=2};
{kiten="下渓"; kenk="ソウル特別市"; shuten="孔陵"; kens="ソウル特別市"; keiyu="７号線"; kyori=1.3; jikan=2};
{kiten="孔陵"; kenk="ソウル特別市"; shuten="泰陵入口"; kens="ソウル特別市"; keiyu="７号線"; kyori=0.8; jikan=1};
{kiten="泰陵入口"; kenk="ソウル特別市"; shuten="モッコル"; kens="ソウル特別市"; keiyu="７号線"; kyori=0.9; jikan=2};
{kiten="モッコル"; kenk="ソウル特別市"; shuten="中和"; kens="ソウル特別市"; keiyu="７号線"; kyori=0.9; jikan=2};
{kiten="中和"; kenk="ソウル特別市"; shuten="上鳳"; kens="ソウル特別市"; keiyu="７号線"; kyori=1.0; jikan=2};
{kiten="上鳳"; kenk="ソウル特別市"; shuten="面牧"; kens="ソウル特別市"; keiyu="７号線"; kyori=0.8; jikan=2};
{kiten="面牧"; kenk="ソウル特別市"; shuten="四佳亭"; kens="ソウル特別市"; keiyu="７号線"; kyori=0.9; jikan=1};
{kiten="開花"; kenk="ソウル特別市"; shuten="金浦空港"; kens="ソウル特別市"; keiyu="9号線"; kyori=3.6; jikan=5};
{kiten="金浦空港"; kenk="ソウル特別市"; shuten="空港市場"; kens="ソウル特別市"; keiyu="9号線"; kyori=0.8; jikan=2};
{kiten="空港市場"; kenk="ソウル特別市"; shuten="新傍花"; kens="ソウル特別市"; keiyu="9号線"; kyori=0.8; jikan=2};
{kiten="新傍花"; kenk="ソウル特別市"; shuten="麻谷ナル"; kens="ソウル特別市"; keiyu="9号線"; kyori=0.9; jikan=2};
{kiten="麻谷ナル"; kenk="ソウル特別市"; shuten="陽川鄉校"; kens="ソウル特別市"; keiyu="9号線"; kyori=1.4; jikan=3};
{kiten="陽川鄉校"; kenk="ソウル特別市"; shuten="加陽"; kens="ソウル特別市"; keiyu="9号線"; kyori=1.3; jikan=3};
{kiten="加陽"; kenk="ソウル特別市"; shuten="曽米"; kens="ソウル特別市"; keiyu="9号線"; kyori=0.7; jikan=2};
{kiten="曽米"; kenk="ソウル特別市"; shuten="登村"; kens="ソウル特別市"; keiyu="9号線"; kyori=1.0; jikan=2};
{kiten="登村"; kenk="ソウル特別市"; shuten="塩倉"; kens="ソウル特別市"; keiyu="9号線"; kyori=0.9; jikan=2};
{kiten="塩倉"; kenk="ソウル特別市"; shuten="新木洞"; kens="ソウル特別市"; keiyu="9号線"; kyori=0.9; jikan=2};
{kiten="新木洞"; kenk="ソウル特別市"; shuten="仙遊島"; kens="ソウル特別市"; keiyu="9号線"; kyori=1.2; jikan=2};
{kiten="仙遊島"; kenk="ソウル特別市"; shuten="堂山"; kens="ソウル特別市"; keiyu="9号線"; kyori=1.0; jikan=2};
{kiten="堂山"; kenk="ソウル特別市"; shuten="国会議事堂"; kens="ソウル特別市"; keiyu="9号線"; kyori=1.5; jikan=3};
]