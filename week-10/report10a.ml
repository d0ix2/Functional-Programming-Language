type ('a, 'b) tree_t =
  Empty
  | Node of ('a, 'b) tree_t * 'a * 'b * ('a, 'b) tree_t


(* ('a, 'b) tree_t 型の木と 'a 型のキー、 'b 型の値を受け取ったら、 そのキーと値を挿入した木を返す *)
(* insert : ('a, 'b) tree_t -> 'a -> 'b -> ('a, 'b) tree_t *)
let rec insert tree key value =
  match tree with
  Empty -> Node (Empty, key, value, Empty)
  | Node (left, k, v, right) ->
      let cmp = compare key k in
      if cmp = 0 then Node (left, key, value, right)
      else if cmp < 0 then Node (insert left key value, k, v, right)
      else Node (left, k, v, insert right key value)


(* test *)
let insert_test1 =
  insert Empty 3 30 = Node (Empty, 3, 30, Empty)
let insert_test2 =
  insert (Node (Empty, 3, 30, Empty)) 5 50 =
    Node (Empty, 3, 30, Node (Empty, 5, 50, Empty))
let insert_test3 =
  insert (Node (Empty, 3, 30, Empty)) 3 99 =
    Node (Empty, 3, 99, Empty)


(* さらに、キーと値をひとつではなく 「キーと値のペア」をリストで受け取り、 それを順に挿入した木を返す *)
(* inserts : ('a, 'b) tree_t -> ('a * 'b) list -> ('a, 'b) tree_t *)
let rec inserts tree lst =
  match lst with
  [] -> tree
  | (k, v) :: rest 
    -> inserts (insert tree k v) rest


(* test *)
let inserts_test1 =
  inserts Empty [(2, 20); (1, 10); (3, 30)] =
    Node (Node (Empty, 1, 10, Empty), 2, 20, Node (Empty, 3, 30, Empty))
let inserts_test2 =
  inserts Empty [(1, 100); (1, 200)] =
    Node (Empty, 1, 200, Empty) 
let inserts_test3 =
  inserts Empty [] = Empty 


(* ('a, 'b) tree_t 型の木と 'a 型のキーを 受け取ったら、対応する値を返す *)
(* search : ('a, int) tree_t -> 'a -> int *)
let rec search tree key =
  match tree with
  Empty -> 0
  | Node (left, k, v, right) ->
      let cmp = compare key k in
      if cmp = 0 then v
      else if cmp < 0 then search left key
      else search right key


(* test *)
let search_test1 =
  search (inserts Empty [(2, 20); (1, 10); (3, 30)]) 2 = 20
let search_test2 =
  search (inserts Empty [(2, 20); (1, 10); (3, 30)]) 4 = 0  
let search_test3 =
  search (insert Empty 5 55) 5 = 55
