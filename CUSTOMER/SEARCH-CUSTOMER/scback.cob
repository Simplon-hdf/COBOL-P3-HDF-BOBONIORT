      ******************************************************************
      *    [RD] Le programme 'search logic' recherche dans la table    *
      *    'customer' un ou plusieurs adhérent en fonction des saisies *
      *    de l'utilisateur dans les différents champs de recherche.   *
      *    Les saisies de l'utilisateur correspondent à :              *
      *    - soit au code_secu.                                        *
      *    - soit au nom, prénom et date de naissance.                 *
      *    - soit au code_secu, nom, prénom et date de naissance.      *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. scback.
       AUTHOR.       Rémi.

      ******************************************************************

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CUSTOMER.
           05 WS-CUS-FIRSTNAME PIC X(20).
           05 WS-CUS-LASTNAME  PIC X(20).
           05 WS-CUS-BIRTHDATE PIC X(10).
           05 WS-CUS-CODE-SECU PIC 9(15). 

OCESQL*EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  DBNAME   PIC  X(11) VALUE 'boboniortdb'.
       01  USERNAME PIC  X(05) VALUE 'cobol'.
       01  PASSWD   PIC  X(10) VALUE 'cbl85'.

       01  SQL-CUSTOMER.
           03 SQL-CUS-UUID        PIC X(36).
           03 SQL-CUS-GENDER      PIC X(10).
           03 SQL-CUS-LASTNAME    PIC X(20).
           03 SQL-CUS-FIRSTNAME   PIC X(20).
           03 SQL-CUS-ADRESS1	  PIC X(50).
           03 SQL-CUS-ADRESS2	  PIC X(50).
           03 SQL-CUS-ZIPCODE	  PIC X(15).
           03 SQL-CUS-TOWN	      PIC X(50).
           03 SQL-CUS-COUNTRY	  PIC X(20).
           03 SQL-CUS-PHONE	      PIC X(10).
           03 SQL-CUS-MAIL	      PIC X(50).
           03 SQL-CUS-BIRTH-DATE  PIC X(10).
           03 SQL-CUS-DOCTOR	  PIC X(50).
           03 SQL-CUS-CODE-SECU   PIC 9(15).
           03 SQL-CUS-CODE-IBAN   PIC X(34).
           03 SQL-CUS-NBCHILDREN  PIC 9(03).
           03 SQL-CUS-COUPLE      PIC X(05).
           03 SQL-CUS-CREATE-DATE PIC X(10).
           03 SQL-CUS-UPDATE-DATE PIC X(10).
           03 SQL-CUS-CLOSE-DATE  PIC X(10).
           03 SQL-CUS-ACTIVE	  PIC X(01).
OCESQL*EXEC SQL END DECLARE SECTION END-EXEC.
OCESQL*EXEC SQL INCLUDE SQLCA END-EXEC.  
OCESQL     copy "sqlca.cbl".

OCESQL*
OCESQL 01  SQ0001.
OCESQL     02  FILLER PIC X(014) VALUE "DISCONNECT ALL".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0002.
OCESQL     02  FILLER PIC X(256) VALUE "SELECT uuid_customer, customer"
OCESQL  &  "_gender, customer_lastname, customer_firstname, customer_a"
OCESQL  &  "dress1, customer_adress2, customer_zipcode, customer_town,"
OCESQL  &  " customer_country, customer_phone, customer_mail, customer"
OCESQL  &  "_birth_date, customer_doctor, customer_code_secu, cu".
OCESQL     02  FILLER PIC X(207) VALUE "stomer_code_iban, customer_nbc"
OCESQL  &  "hildren, customer_couple, customer_create_date, customer_u"
OCESQL  &  "pdate_date, customer_close_date, customer_active FROM cust"
OCESQL  &  "omer WHERE customer_code_secu = $1 AND customer_active != "
OCESQL  &  "'A'".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0003.
OCESQL     02  FILLER PIC X(256) VALUE "SELECT uuid_customer, customer"
OCESQL  &  "_gender, customer_lastname, customer_firstname, customer_a"
OCESQL  &  "dress1, customer_adress2, customer_zipcode, customer_town,"
OCESQL  &  " customer_country, customer_phone, customer_mail, customer"
OCESQL  &  "_birth_date, customer_doctor, customer_code_secu, cu".
OCESQL     02  FILLER PIC X(256) VALUE "stomer_code_iban, customer_nbc"
OCESQL  &  "hildren, customer_couple, customer_create_date, customer_u"
OCESQL  &  "pdate_date, customer_close_date, customer_active FROM cust"
OCESQL  &  "omer WHERE customer_lastname = TRIM( $1 ) AND customer_fir"
OCESQL  &  "stname = TRIM( $2 ) AND customer_birth_date = $3 AND".
OCESQL     02  FILLER PIC X(023) VALUE " customer_active != 'A'".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
OCESQL 01  SQ0004.
OCESQL     02  FILLER PIC X(256) VALUE "SELECT uuid_customer, customer"
OCESQL  &  "_gender, customer_lastname, customer_firstname, customer_a"
OCESQL  &  "dress1, customer_adress2, customer_zipcode, customer_town,"
OCESQL  &  " customer_country, customer_phone, customer_mail, customer"
OCESQL  &  "_birth_date, customer_doctor, customer_code_secu, cu".
OCESQL     02  FILLER PIC X(256) VALUE "stomer_code_iban, customer_nbc"
OCESQL  &  "hildren, customer_couple, customer_create_date, customer_u"
OCESQL  &  "pdate_date, customer_close_date, customer_active FROM cust"
OCESQL  &  "omer WHERE customer_code_secu = $1 AND customer_lastname ="
OCESQL  &  " TRIM( $2 ) AND customer_firstname = TRIM( $3 ) AND ".
OCESQL     02  FILLER PIC X(051) VALUE "customer_birth_date = $4 AND c"
OCESQL  &  "ustomer_active != 'A'".
OCESQL     02  FILLER PIC X(1) VALUE X"00".
OCESQL*
       LINKAGE SECTION.
       01  LK-CUSTOMER.
           03 LK-CUR-UUID        PIC X(36).
           03 LK-CUR-GENDER      PIC X(10).
           03 LK-CUR-LASTNAME    PIC X(20).
           03 LK-CUR-FIRSTNAME   PIC X(20).
           03 LK-CUR-ADRESS1	 PIC X(50).
           03 LK-CUR-ADRESS2	 PIC X(50).
           03 LK-CUR-ZIPCODE	 PIC X(15).
           03 LK-CUR-TOWN	     PIC X(50).
           03 LK-CUR-COUNTRY	 PIC X(20).
           03 LK-CUR-PHONE	     PIC X(10).
           03 LK-CUR-MAIL	     PIC X(50).
           03 LK-CUR-BIRTH-DATE  PIC X(10).
           03 LK-CUR-DOCTOR	     PIC X(50).
           03 LK-CUR-CODE-SECU   PIC 9(15).
           03 LK-CUR-CODE-IBAN   PIC X(34).
           03 LK-CUR-NBCHILDREN  PIC 9(03).
           03 LK-CUR-COUPLE      PIC X(05).
           03 LK-CUR-CREATE-DATE PIC X(10).
           03 LK-CUR-UPDATE-DATE PIC X(10).
           03 LK-CUR-CLOSE-DATE  PIC X(10).
           03 LK-CUR-ACTIVE	     PIC X(01).

       01  LK-REQUEST-CODE       PIC 9(01).

      ******************************************************************

       PROCEDURE DIVISION USING LK-CUSTOMER, LK-REQUEST-CODE.
       
       0000-START-MAIN.
OCESQL*    EXEC SQL
OCESQL*        CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLConnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE USERNAME
OCESQL          BY VALUE 5
OCESQL          BY REFERENCE PASSWD
OCESQL          BY VALUE 10
OCESQL          BY REFERENCE DBNAME
OCESQL          BY VALUE 11
OCESQL     END-CALL.

           PERFORM 1000-START-HANDLE-CUSTOMER-ACCEPT
              THRU END-1000-HANDLE-CUSTOMER-ACCEPT.
           
           PERFORM 2000-START-SQL-REQUEST 
              THRU END-2000-SQL-REQUEST.

           PERFORM 3000-START-FETCH-CURSOR 
              THRU END-3000-FETCH-CURSOR.
       END-0000-MAIN.
OCESQL*    EXEC SQL COMMIT WORK END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLExec" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "COMMIT" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
OCESQL*    EXEC SQL DISCONNECT ALL END-EXEC. 
OCESQL     CALL "OCESQLDisconnect" USING
OCESQL          BY REFERENCE SQLCA
OCESQL     END-CALL.
           GOBACK.

      ******************************************************************
      *    [RD] Transfert les données de LK-CUSTOMER vers              *
      *    WS-CUSTOMER.                                                *
      ******************************************************************
       1000-START-HANDLE-CUSTOMER-ACCEPT.
           MOVE LK-CUR-CODE-SECU  TO WS-CUS-CODE-SECU.
           MOVE LK-CUR-FIRSTNAME  TO WS-CUS-FIRSTNAME.
           MOVE LK-CUR-LASTNAME   TO WS-CUS-LASTNAME.
           MOVE LK-CUR-BIRTH-DATE TO WS-CUS-BIRTHDATE.
       END-1000-HANDLE-CUSTOMER-ACCEPT.
           EXIT.

      ******************************************************************
      *    [RD] Requêtes SQL qui retourne un ou plusieurs adhérents    * 
      *    qui ne sont pas archiver en fonction de la recherche        *
      *    effectuée par l'utilisateur.                                *
      ******************************************************************
       2000-START-SQL-REQUEST.
      *    Recherche en fonction du code_secu
OCESQL*    EXEC SQL
OCESQL*        DECLARE CRSCODESECU CURSOR FOR
OCESQL*        SELECT uuid_customer, customer_gender, 
OCESQL*        customer_lastname, customer_firstname, customer_adress1,
OCESQL*        customer_adress2, customer_zipcode, customer_town,
OCESQL*        customer_country, customer_phone, customer_mail,
OCESQL*        customer_birth_date, customer_doctor, customer_code_secu,
OCESQL*        customer_code_iban, customer_nbchildren, customer_couple,
OCESQL*        customer_create_date, customer_update_date,
OCESQL*        customer_close_date, customer_active
OCESQL*        FROM customer
OCESQL*        WHERE customer_code_secu = :WS-CUS-CODE-SECU
OCESQL*        AND customer_active != 'A'
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorDeclareParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSCODESECU" & x"00"
OCESQL          BY REFERENCE SQ0002
OCESQL          BY VALUE 1
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

      *    Recherche en fonction du lastname, firstname et birth_date
OCESQL*    EXEC SQL
OCESQL*        DECLARE CRSNAMEDATE CURSOR FOR
OCESQL*        SELECT uuid_customer, customer_gender, 
OCESQL*        customer_lastname, customer_firstname, customer_adress1,
OCESQL*        customer_adress2, customer_zipcode, customer_town,
OCESQL*        customer_country, customer_phone, customer_mail,
OCESQL*        customer_birth_date, customer_doctor, customer_code_secu,
OCESQL*        customer_code_iban, customer_nbchildren, customer_couple,
OCESQL*        customer_create_date, customer_update_date,
OCESQL*        customer_close_date, customer_active
OCESQL*        FROM customer
OCESQL*        WHERE customer_lastname = TRIM(:WS-CUS-LASTNAME)
OCESQL*        AND customer_firstname = TRIM(:WS-CUS-FIRSTNAME)
OCESQL*        AND customer_birth_date = :WS-CUS-BIRTHDATE
OCESQL*        AND customer_active != 'A'
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-BIRTHDATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorDeclareParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSNAMEDATE" & x"00"
OCESQL          BY REFERENCE SQ0003
OCESQL          BY VALUE 3
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.

      *    Recherche en fonction du code_secu, lastname, firstname 
      *    et birth_date
OCESQL*    EXEC SQL
OCESQL*        DECLARE CRSALL CURSOR FOR
OCESQL*        SELECT uuid_customer, customer_gender, 
OCESQL*        customer_lastname, customer_firstname, customer_adress1,
OCESQL*        customer_adress2, customer_zipcode, customer_town,
OCESQL*        customer_country, customer_phone, customer_mail,
OCESQL*        customer_birth_date, customer_doctor, customer_code_secu,
OCESQL*        customer_code_iban, customer_nbchildren, customer_couple,
OCESQL*        customer_create_date, customer_update_date,
OCESQL*        customer_close_date, customer_active
OCESQL*        FROM customer
OCESQL*        WHERE customer_code_secu = :WS-CUS-CODE-SECU
OCESQL*        AND customer_lastname = TRIM(:WS-CUS-LASTNAME)
OCESQL*        AND customer_firstname = TRIM(:WS-CUS-FIRSTNAME)
OCESQL*        AND customer_birth_date = :WS-CUS-BIRTHDATE
OCESQL*        AND customer_active != 'A'
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetSQLParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE WS-CUS-BIRTHDATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorDeclareParams" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSALL" & x"00"
OCESQL          BY REFERENCE SQ0004
OCESQL          BY VALUE 4
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL.
       END-2000-SQL-REQUEST.
           EXIT.

      ******************************************************************
      *    [RD] Appel le paragraphe qui s'occupe de FETCH en fonction  *
      *    du numéro de LK-REQUEST-CODE.                               *
      ******************************************************************
       3000-START-FETCH-CURSOR.
           EVALUATE LK-REQUEST-CODE
               WHEN 1
                   PERFORM 3100-START-FETCH-CRSCODESECU
                      THRU END-3100-FETCH-CRSCODESECU
               WHEN 2
                   PERFORM 3200-START-FETCH-CRSNAMEDATE
                      THRU END-3200-FETCH-CRSNAMEDATE
               WHEN 3
                   PERFORM 3300-START-FETCH-CRSALL
                      THRU END-3300-FETCH-CRSALL
               WHEN OTHER
                  CONTINUE
           END-EVALUATE.
       END-3000-FETCH-CURSOR.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de code_secu.         *
      ******************************************************************
       3100-START-FETCH-CRSCODESECU.
OCESQL*    EXEC SQL  
OCESQL*        OPEN CRSCODESECU    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSCODESECU" & x"00"
OCESQL     END-CALL.

           PERFORM UNTIL SQLCODE = 100
OCESQL*        EXEC SQL
OCESQL*            FETCH CRSCODESECU
OCESQL*            INTO :SQL-CUS-UUID, :SQL-CUS-GENDER,
OCESQL*                 :SQL-CUS-LASTNAME, :SQL-CUS-FIRSTNAME,
OCESQL*                 :SQL-CUS-ADRESS1, :SQL-CUS-ADRESS2, 
OCESQL*                 :SQL-CUS-ZIPCODE, :SQL-CUS-TOWN,
OCESQL*                 :SQL-CUS-COUNTRY, :SQL-CUS-PHONE,
OCESQL*                 :SQL-CUS-MAIL, :SQL-CUS-BIRTH-DATE, 
OCESQL*                 :SQL-CUS-DOCTOR, :SQL-CUS-CODE-SECU, 
OCESQL*                 :SQL-CUS-CODE-IBAN, :SQL-CUS-NBCHILDREN, 
OCESQL*                 :SQL-CUS-COUPLE, :SQL-CUS-CREATE-DATE, 
OCESQL*                 :SQL-CUS-UPDATE-DATE, :SQL-CUS-CLOSE-DATE, 
OCESQL*                 :SQL-CUS-ACTIVE
OCESQL*        END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-GENDER
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ADRESS1
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ADRESS2
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ZIPCODE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-TOWN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-COUNTRY
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-PHONE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-MAIL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-BIRTH-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 34
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CODE-IBAN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-NBCHILDREN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 5
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-COUPLE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CREATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-UPDATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CLOSE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ACTIVE
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSCODESECU" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL

               EVALUATE SQLCODE
                   WHEN ZERO
                       PERFORM 4000-START-HANDLE THRU END-4000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSCODESECU :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

OCESQL*    EXEC SQL  
OCESQL*        CLOSE CRSCODESECU    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSCODESECU" & x"00"
OCESQL     END-CALL
OCESQL    .
       END-3100-FETCH-CRSCODESECU.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de lastname,          *
      *    firstname et birth_date.                                    *
      ******************************************************************
       3200-START-FETCH-CRSNAMEDATE.
OCESQL*    EXEC SQL  
OCESQL*        OPEN CRSNAMEDATE    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSNAMEDATE" & x"00"
OCESQL     END-CALL.
           PERFORM UNTIL SQLCODE = 100
OCESQL*        EXEC SQL
OCESQL*            FETCH CRSNAMEDATE
OCESQL*            INTO :SQL-CUS-UUID, :SQL-CUS-GENDER,
OCESQL*                 :SQL-CUS-LASTNAME, :SQL-CUS-FIRSTNAME,
OCESQL*                 :SQL-CUS-ADRESS1, :SQL-CUS-ADRESS2, 
OCESQL*                 :SQL-CUS-ZIPCODE, :SQL-CUS-TOWN,
OCESQL*                 :SQL-CUS-COUNTRY, :SQL-CUS-PHONE,
OCESQL*                 :SQL-CUS-MAIL, :SQL-CUS-BIRTH-DATE, 
OCESQL*                 :SQL-CUS-DOCTOR, :SQL-CUS-CODE-SECU, 
OCESQL*                 :SQL-CUS-CODE-IBAN, :SQL-CUS-NBCHILDREN, 
OCESQL*                 :SQL-CUS-COUPLE, :SQL-CUS-CREATE-DATE, 
OCESQL*                 :SQL-CUS-UPDATE-DATE, :SQL-CUS-CLOSE-DATE, 
OCESQL*                 :SQL-CUS-ACTIVE
OCESQL*        END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-GENDER
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ADRESS1
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ADRESS2
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ZIPCODE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-TOWN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-COUNTRY
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-PHONE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-MAIL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-BIRTH-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 34
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CODE-IBAN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-NBCHILDREN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 5
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-COUPLE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CREATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-UPDATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CLOSE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ACTIVE
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSNAMEDATE" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL

               EVALUATE SQLCODE
                   WHEN ZERO
                       PERFORM 4000-START-HANDLE THRU END-4000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSNAMEDATE :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

OCESQL*    EXEC SQL  
OCESQL*        CLOSE CRSNAMEDATE    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSNAMEDATE" & x"00"
OCESQL     END-CALL
OCESQL    .
       END-3200-FETCH-CRSNAMEDATE.
           EXIT.

      ******************************************************************
      *    [RD] Effectue le FECTH pour le CURSOR de code_secu,         *
      *    lastname, firstname et birth_date.                          *
      ******************************************************************
       3300-START-FETCH-CRSALL.
OCESQL*    EXEC SQL  
OCESQL*        OPEN CRSALL    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorOpen" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSALL" & x"00"
OCESQL     END-CALL.
           PERFORM UNTIL SQLCODE = 100
OCESQL*        EXEC SQL
OCESQL*            FETCH CRSALL
OCESQL*            INTO :SQL-CUS-UUID, :SQL-CUS-GENDER,
OCESQL*                 :SQL-CUS-LASTNAME, :SQL-CUS-FIRSTNAME,
OCESQL*                 :SQL-CUS-ADRESS1, :SQL-CUS-ADRESS2, 
OCESQL*                 :SQL-CUS-ZIPCODE, :SQL-CUS-TOWN,
OCESQL*                 :SQL-CUS-COUNTRY, :SQL-CUS-PHONE,
OCESQL*                 :SQL-CUS-MAIL, :SQL-CUS-BIRTH-DATE, 
OCESQL*                 :SQL-CUS-DOCTOR, :SQL-CUS-CODE-SECU, 
OCESQL*                 :SQL-CUS-CODE-IBAN, :SQL-CUS-NBCHILDREN, 
OCESQL*                 :SQL-CUS-COUPLE, :SQL-CUS-CREATE-DATE, 
OCESQL*                 :SQL-CUS-UPDATE-DATE, :SQL-CUS-CLOSE-DATE, 
OCESQL*                 :SQL-CUS-ACTIVE
OCESQL*        END-EXEC
OCESQL     CALL "OCESQLStartSQL"
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 36
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-UUID
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-GENDER
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-LASTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-FIRSTNAME
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ADRESS1
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ADRESS2
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ZIPCODE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-TOWN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 20
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-COUNTRY
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-PHONE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-MAIL
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-BIRTH-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 50
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-DOCTOR
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 15
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CODE-SECU
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 34
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CODE-IBAN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 1
OCESQL          BY VALUE 3
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-NBCHILDREN
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 5
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-COUPLE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CREATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-UPDATE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 10
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-CLOSE-DATE
OCESQL     END-CALL
OCESQL     CALL "OCESQLSetResultParams" USING
OCESQL          BY VALUE 16
OCESQL          BY VALUE 1
OCESQL          BY VALUE 0
OCESQL          BY REFERENCE SQL-CUS-ACTIVE
OCESQL     END-CALL
OCESQL     CALL "OCESQLCursorFetchOne" USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSALL" & x"00"
OCESQL     END-CALL
OCESQL     CALL "OCESQLEndSQL"
OCESQL     END-CALL
               
               EVALUATE SQLCODE
                   WHEN ZERO
                       PERFORM 4000-START-HANDLE THRU END-4000-HANDLE
                   WHEN 100
                       DISPLAY 'NO MORE ROWS IN CURSOR RESULT SET'
                   WHEN OTHER
                       DISPLAY 'ERROR FETCHING CURSOR CRSALL :'
                       SPACE SQLCODE
               END-EVALUATE
           END-PERFORM.

OCESQL*    EXEC SQL  
OCESQL*        CLOSE CRSALL    
OCESQL*    END-EXEC.
OCESQL     CALL "OCESQLCursorClose"  USING
OCESQL          BY REFERENCE SQLCA
OCESQL          BY REFERENCE "scback_CRSALL" & x"00"
OCESQL     END-CALL
OCESQL    .
       END-3300-FETCH-CRSALL.
           EXIT.

      ******************************************************************
      *    [RD] Stock le ou les résultats de la requête SQL dans la    * 
      *    TABLE customer.                                             *
      ******************************************************************
       4000-START-HANDLE.
           MOVE SQL-CUS-UUID        TO LK-CUR-UUID.
           MOVE SQL-CUS-GENDER      TO LK-CUR-GENDER.
           MOVE SQL-CUS-LASTNAME    TO LK-CUR-LASTNAME.
           MOVE SQL-CUS-FIRSTNAME   TO LK-CUR-FIRSTNAME.
           MOVE SQL-CUS-ADRESS1     TO LK-CUR-ADRESS1.
           MOVE SQL-CUS-ADRESS2     TO LK-CUR-ADRESS2.
           MOVE SQL-CUS-ZIPCODE     TO LK-CUR-ZIPCODE.
           MOVE SQL-CUS-TOWN        TO LK-CUR-TOWN.
           MOVE SQL-CUS-COUNTRY     TO LK-CUR-COUNTRY.
           MOVE SQL-CUS-PHONE       TO LK-CUR-PHONE.
           MOVE SQL-CUS-MAIL        TO LK-CUR-MAIL.
           MOVE SQL-CUS-BIRTH-DATE  TO LK-CUR-BIRTH-DATE.
           MOVE SQL-CUS-DOCTOR      TO LK-CUR-DOCTOR.
           MOVE SQL-CUS-CODE-SECU   TO LK-CUR-CODE-SECU.
           MOVE SQL-CUS-CODE-IBAN   TO LK-CUR-CODE-IBAN.
           MOVE SQL-CUS-NBCHILDREN  TO LK-CUR-NBCHILDREN.
           MOVE SQL-CUS-COUPLE      TO LK-CUR-COUPLE.
           MOVE SQL-CUS-CREATE-DATE TO LK-CUR-CREATE-DATE.
           MOVE SQL-CUS-UPDATE-DATE TO LK-CUR-UPDATE-DATE.
           MOVE SQL-CUS-CLOSE-DATE  TO LK-CUR-CLOSE-DATE.
           MOVE SQL-CUS-ACTIVE      TO LK-CUR-ACTIVE.
       END-4000-HANDLE.
           EXIT.
           EXIT.
           EXIT.
