       01  SCREEN-FRAME FOREGROUND-COLOR IS 2.
           05 BLANK SCREEN.
           05 FILLER PIC X(182) VALUE all " " LINE 4 COL 10 
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 5 COL 10 
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 6 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(18) VALUE  "RECHERCHE ADHERENT" 
           COL 89 
           FOREGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 7 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(182) VALUE all  "  " LINE 8 COL 10 
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 9 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 10 COL 10 
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 11 COL 10 
           BACKGROUND-COLOR IS 2.                       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 12 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 13 COL 10 
           BACKGROUND-COLOR IS 2.                           
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(28) VALUE "Numero de securite sociale :" 
           LINE 13 COL 60 .
         
           05 FILLER PIC X(1) TO  CODE-SECU-1 
            LINE 13 COL 115 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
         
           05 FILLER PIC X(2) TO  CODE-SECU-2 
            LINE 13 COL 117 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
          
           05 FILLER PIC X(2) TO  CODE-SECU-3 
            LINE 13 COL 119 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           
           05 FILLER PIC X(2) TO  CODE-SECU-4 
            LINE 13 COL 122 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
        
           05 FILLER PIC X(3) TO  CODE-SECU-5 
            LINE 13 COL 125 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
        
           05 FILLER PIC X(3) TO  CODE-SECU-6 
            LINE 13 COL 129 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
        
           05 FILLER PIC X(2) TO  CODE-SECU-7 
           LINE 13 COL 133 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           
           05 FILLER PIC X(2) VALUE  "  " LINE 14 COL 10 
           BACKGROUND-COLOR IS 2. 
           
           05 FILLER PIC X(8) VALUE "Prenom :" 
           LINE 15 COL 60 . 
            
           05 FILLER PIC X(20) TO  CUSTOMER-FIRSTNAME
           LINE 15 COL 115 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.  
           05 FILLER PIC X(2) VALUE  "  " LINE 14 COL 190 
           BACKGROUND-COLOR IS 2.             
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  "  " LINE 15 COL 10 
           BACKGROUND-COLOR IS 2.                  
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 16 COL 10 
           BACKGROUND-COLOR IS 2.                
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  "  " LINE 17 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.
           05 FILLER PIC X(5) VALUE "Nom :" 
           LINE 17 COL 60 . 
          
           05 FILLER PIC X(20) TO  CUSTOMER-LASTNAME
           LINE 17 COL 115 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           05 FILLER PIC X(32) VALUE "Date de naissance (AAAA-MM-JJ) :" 
           LINE 19 COL 60 . 
          
           05 FILLER PIC X(2) TO  BIRTHDATE-DAYS
           LINE 19 COL 133 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(1) VALUE "-"
           LINE 19 COL 132 AUTO 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(2) TO  BIRTHDATE-MONTH
           LINE 19 COL 130 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           05 FILLER PIC X(1) VALUE "-"
           LINE 19 COL 129 AUTO 
           FOREGROUND-COLOR IS 2.
           05 FILLER PIC X(4) TO  BIRTHDATE-YEAR
           LINE 19 COL 125 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           05 FILLER PIC X(10) VALUE "RECHERCHER" 
           LINE 21 COL 60 
           FOREGROUND-COLOR IS 2. 
           05 FILLER PIC X(1) TO  SC-SEARCH-VALIDATION
           LINE 21 COL 71
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(22) VALUE "Statut de la requete :" 
           LINE 25 COL 30 .
           05 FILLER PIC X(120) FROM  ERROR-MESSAGE
           LINE 25 COL 53 AUTO 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0.
           05 FILLER PIC X(2) VALUE  "  " LINE 18 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE  19 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.  

           05 FILLER PIC X(2) VALUE  "  " LINE 20 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.            

           05 FILLER PIC X(2) VALUE  "  " LINE 21 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.                     

           05 FILLER PIC X(2) VALUE  "  " LINE 22 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 23 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 24 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 25 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 26 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 27 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 28 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 29 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 30 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 21 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 22 COL 10 
           BACKGROUND-COLOR IS 2.         
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 23 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 24 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 25 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 26 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 27 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 28 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 29 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 30 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 31 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 32 COL 10 
           BACKGROUND-COLOR IS 2.       
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 
           
           05 FILLER PIC X(2) VALUE  "  " LINE 33 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 34 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 
           05 FILLER PIC X(1) TO  SC-MENU-RETURN  
           COL 170 
           BACKGROUND-COLOR IS 2
           FOREGROUND-COLOR IS 0. 
           05 FILLER PIC X(14) VALUE  "RETOUR AU MENU" 
           COL 172 
           FOREGROUND-COLOR IS 2.

           05 FILLER PIC X(2) VALUE  "  " LINE 35 COL 10 
           BACKGROUND-COLOR IS 2.      
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(2) VALUE  "  " LINE 36 COL 10 
           BACKGROUND-COLOR IS 2.        
           05 FILLER PIC X(2) VALUE  "  " COL  190
           BACKGROUND-COLOR IS 2. 

           05 FILLER PIC X(182) VALUE all  "  " LINE 37 COL 10 
           BACKGROUND-COLOR IS 2.
