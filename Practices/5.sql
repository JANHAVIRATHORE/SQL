-- combining 2 varaible column called composite id can create primary key
-- partial dependency (col depend on one primary key col) full dependency (col depend on two conposite key pair)
-- normalization means- dataset organize,structure in better manner 
-- 1) first normal form = break atomicity (duplicate, multiple values break into rows) 
-- 2) second normal form =  partial dependency remove(col depend on 1 primary key) 
-- 3) third normal form = remove transitive dependency (indirectly finding non key value with help of non key col,non key col depend on non key)
-- 4) BCNK = candidate key(uniquelly identity a row) + determinate key(one col(should be part of candidate key) find another col(non key)) if one of this condition not fufill bcnf violeted.
-- 5) forth normal form = remove multi value dependency(not dependent on each other)
-- 6) fifth normal form = remove join dependency(means split table because of independency reletionship and join it and result in no col and rows can be lose)


