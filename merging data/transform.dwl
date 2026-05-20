%dw 2.0
output application/json
import * from dw::core::Arrays
var books = payload.store.books
var authors = payload.store.authors
---
leftJoin(books,authors, (books)-> books.bookId, (authors)-> authors.bookId) map ((item, index) -> {
    id: item.l.bookId,
    title: item.l.title,
    price: item.l.price,
    authors: item.r.author
})

// payload.store.books map ((item, index) -> using (id = item.bookId) {
//     id: id,
//     title: item.title,
//     price: item.price,
//     (authors filter ((item, index) -> item.bookId contains  id) map ((item, index) -> {
//         authors: item.author
//     }))
// })

/*payload.store.books map ((item, index) -> if(authors.bookId[index]==item.bookId)item ++ authors[index] distinctBy($) else "")*/