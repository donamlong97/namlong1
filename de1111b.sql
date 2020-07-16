-- a. List the books have been borrowed more than 10 times in 2011
/*select title 
	from book inner join borrow_detail on book.book_id=borrow_detail.book_id inner join borrow on borrow_detail.borrow_id=borrow.borrow_id
	where year(borrow_date)=2011
   group by title 
   having SUM(quantity)>=10*/

-- b. List the readers has borrowed at least 10 different books
/*select reader_name 
from reader inner join (select reader_id 
						from book inner join borrow_detail on book.book_id=borrow_detail.book_id inner join borrow on borrow_detail.borrow_id=borrow.borrow_id
						group by reader_id   
						having count(borrow_detail_id)>=10) a on reader.reader_id=a.reader_id */

-- c. List the books are being borrowed by a reader in the preceding sentence (b)
/*select distinct title 
from book inner join borrow_detail on book.book_id=borrow_detail.book_id inner join borrow on borrow_detail.borrow_id=borrow.borrow_id 
where reader_id=(select reader_id 
					from book inner join borrow_detail on book.book_id=borrow_detail.book_id inner join borrow on borrow_detail.borrow_id=borrow.borrow_id
					group by reader_id   
					having count(borrow_detail_id)>=10)*/

-- d. List of Stephen King books present no one is borrowing 
/*select distinct title 
	from author inner join book_author on author.author_id=book_author.author_id inner join book on book_author.book_id=book.book_id left join borrow_detail on book.book_id=borrow_detail.book_id
    where borrow_id is null /*
