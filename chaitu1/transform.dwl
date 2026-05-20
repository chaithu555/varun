%dw 2.0
output application/json 
var x=payload.store.authors
---
// payload.store.books map ((item, index) -> if(x.bookId[index]==item.bookId)item ++ x[index] distinctBy($) else "")

payload.store.books map ((item, index) -> x[index]  ++ item distinctBy($))
 