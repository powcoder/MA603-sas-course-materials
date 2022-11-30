* Statements, Comments, and Programs ;


dm 'post "This is a message" ' ;

dm 'post "SAS statements can continue


 over more than one line" ' ;



* this is a comment ;



* the semicolon key (;) indicates the end of a statement comment ;



/*
this code displays a message in a pop-up box
dm 'post "This message is commented " ' ;    */



* Example of a nested comment;
/*
a = 1;
b = 2 ;
/*c = 3 ;*/
d = 4 ;
*/


* example of a program ;
* this program displays messages in pop-up boxes ;
dm 'post "This is a message" ' ;		/* first message */
dm 'post "This is another message" ' ;	/* second message */
*/ this is the end of the program */



* Example of a run-away comment ;
* Vacaction check-list
dm 'post "Leave food for the cat" ' ;
dm 'post "Water plants " ' ;
dm 'post "Have a great vacation! " ' ;
