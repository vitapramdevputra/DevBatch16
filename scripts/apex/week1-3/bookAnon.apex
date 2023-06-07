//Book b1 = new book();//will this work? NO.
Book b1 = new book('The Great Gatsby', 'Scott', 10.99);
b1.printDetails();

string b1title = b1.getTitle();
system.debug('b1 title is ' + b1title);
system.debug('b1 price is ' + b1.getPrice());

b1.setPrice(14.99);
b1.setAuthor('F. Scott Fitzgerald');
b1.printDetails();

system.debug('---');


Book b2 = new book('The Great Gatsby 2', 'Scott', 14.99);
b2.printDetails();