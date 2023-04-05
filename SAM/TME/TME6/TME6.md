# Exercice 1
## R2
Après ajout de l'index `IDX_NUMCLIENT`
```
Plan hash value: 51045663
 
--------------------------------------------------------------------------------------------------------------
| Id  | Operation                    | Name          | Rows  | Bytes | Cost (%CPU)| Time     | Inst   |IN-OUT|
--------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT             |               |    82 | 20336 |   166   (0)| 00:00:03 |        |      |
|   1 |  NESTED LOOPS                |               |       |       |            |          |        |      |
|   2 |   NESTED LOOPS               |               |    82 | 20336 |   166   (0)| 00:00:03 |        |      |
|   3 |    REMOTE                    | COMMANDE98    |    82 | 11152 |     2   (0)| 00:00:01 | SITEC~ | R->S |
|*  4 |    INDEX RANGE SCAN          | IDX_NUMCLIENT |     1 |       |     1   (0)| 00:00:01 |        |      |
|   5 |   TABLE ACCESS BY INDEX ROWID| CLIENT        |     1 |   112 |     2   (0)| 00:00:01 |        |      |
--------------------------------------------------------------------------------------------------------------
 
Query Block Name / Object Alias (identified by operation id):
-------------------------------------------------------------
 
   1 - SEL$1
   3 - SEL$1 / C1@SEL$1
   4 - SEL$1 / C@SEL$1
   5 - SEL$1 / C@SEL$1
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   4 - access("C"."NUMCLIENT"="C1"."NUMCLIENT")
 
Column Projection Information (identified by operation id):
-----------------------------------------------------------
 
   1 - (#keys=0) "C1"."NUMCDE"[NUMBER,22], "C1"."NUMCLIENT"[NUMBER,22], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C1"."COMMENTAIRE"[VARCHAR2,100], "C"."NUMCLIENT"[NUMBER,22], 
       "C"."NOM"[VARCHAR2,25], "C"."NUMPAYS"[NUMBER,22], "C"."SEGMENT"[CHARACTER,10], 
       "C"."COMMENTAIRE"[VARCHAR2,117]
   2 - (#keys=0) "C1"."NUMCDE"[NUMBER,22], "C1"."NUMCLIENT"[NUMBER,22], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C1"."COMMENTAIRE"[VARCHAR2,100], "C".ROWID[ROWID,10], 
       "C"."NUMCLIENT"[NUMBER,22]
   3 - "C1"."NUMCDE"[NUMBER,22], "C1"."NUMCLIENT"[NUMBER,22], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C1"."COMMENTAIRE"[VARCHAR2,100]
   4 - "C".ROWID[ROWID,10], "C"."NUMCLIENT"[NUMBER,22]
   5 - "C"."NOM"[VARCHAR2,25], "C"."NUMPAYS"[NUMBER,22], "C"."SEGMENT"[CHARACTER,10], 
       "C"."COMMENTAIRE"[VARCHAR2,117]
 
Remote SQL Information (identified by operation id):
----------------------------------------------------
 
   3 - SELECT /*+ USE_NL ("C1") */ "NUMCDE","NUMCLIENT","ETAT","PRIXC","DATEC","PRIORITE","VENDEUR","C
       OMMENTAIRE" FROM "COMMANDE98" "C1" (accessing 'SITECOMPLEMENT.FR' )
```


## R3
```
Plan hash value: 3532254581
 
-------------------------------------------------------------------------------------------------
| Id  | Operation          | Name       | Rows  | Bytes | Cost (%CPU)| Time     | Inst   |IN-OUT|
-------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |            |    82 | 20336 |   186   (1)| 00:00:03 |        |      |
|*  1 |  HASH JOIN         |            |    82 | 20336 |   186   (1)| 00:00:03 |        |      |
|   2 |   REMOTE           | COMMANDE98 |    82 | 11152 |     2   (0)| 00:00:01 | SITEC~ | R->S |
|   3 |   TABLE ACCESS FULL| CLIENT     | 42247 |  4620K|   184   (1)| 00:00:03 |        |      |
-------------------------------------------------------------------------------------------------
 
Query Block Name / Object Alias (identified by operation id):
-------------------------------------------------------------
 
   1 - SEL$1
   2 - SEL$1 / C1@SEL$1
   3 - SEL$1 / C@SEL$1
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - access("C"."NUMCLIENT"="C1"."NUMCLIENT")
 
Column Projection Information (identified by operation id):
-----------------------------------------------------------
 
   1 - (#keys=1) "C1"."NUMCLIENT"[NUMBER,22], "C"."NUMCLIENT"[NUMBER,22], 
       "C1"."NUMCDE"[NUMBER,22], "C1"."COMMENTAIRE"[VARCHAR2,100], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C"."COMMENTAIRE"[VARCHAR2,117], "C"."NOM"[VARCHAR2,25], 
       "C"."NUMPAYS"[NUMBER,22], "C"."SEGMENT"[CHARACTER,10]
   2 - "C1"."NUMCDE"[NUMBER,22], "C1"."NUMCLIENT"[NUMBER,22], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C1"."COMMENTAIRE"[VARCHAR2,100]
   3 - "C"."NUMCLIENT"[NUMBER,22], "C"."NOM"[VARCHAR2,25], "C"."NUMPAYS"[NUMBER,22], 
       "C"."SEGMENT"[CHARACTER,10], "C"."COMMENTAIRE"[VARCHAR2,117]
 
Remote SQL Information (identified by operation id):
----------------------------------------------------
 
   2 - SELECT /*+ USE_HASH ("C1") */ "NUMCDE","NUMCLIENT","ETAT","PRIXC","DATEC","PRIORIT
       E","VENDEUR","COMMENTAIRE" FROM "COMMANDE98" "C1" (accessing 'SITECOMPLEMENT.FR' )
```

## R4 
```
Plan hash value: 3532254581
 
-------------------------------------------------------------------------------------------------
| Id  | Operation          | Name       | Rows  | Bytes | Cost (%CPU)| Time     | Inst   |IN-OUT|
-------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |            |     1 |   248 |   186   (1)| 00:00:03 |        |      |
|*  1 |  HASH JOIN         |            |     1 |   248 |   186   (1)| 00:00:03 |        |      |
|   2 |   REMOTE           | COMMANDE98 |     1 |   136 |     2   (0)| 00:00:01 | SITEC~ | R->S |
|   3 |   TABLE ACCESS FULL| CLIENT     | 42247 |  4620K|   184   (1)| 00:00:03 |        |      |
-------------------------------------------------------------------------------------------------
 
Query Block Name / Object Alias (identified by operation id):
-------------------------------------------------------------
 
   1 - SEL$1
   2 - SEL$1 / C1@SEL$1
   3 - SEL$1 / C@SEL$1
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - access("C"."NUMCLIENT"="C1"."NUMCLIENT")
 
Column Projection Information (identified by operation id):
-----------------------------------------------------------
 
   1 - (#keys=1) "C1"."NUMCLIENT"[NUMBER,22], "C"."NUMCLIENT"[NUMBER,22], 
       "C1"."NUMCDE"[NUMBER,22], "C1"."COMMENTAIRE"[VARCHAR2,100], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C"."COMMENTAIRE"[VARCHAR2,117], "C"."NOM"[VARCHAR2,25], 
       "C"."NUMPAYS"[NUMBER,22], "C"."SEGMENT"[CHARACTER,10]
   2 - "C1"."NUMCDE"[NUMBER,22], "C1"."NUMCLIENT"[NUMBER,22], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C1"."COMMENTAIRE"[VARCHAR2,100]
   3 - "C"."NUMCLIENT"[NUMBER,22], "C"."NOM"[VARCHAR2,25], "C"."NUMPAYS"[NUMBER,22], 
       "C"."SEGMENT"[CHARACTER,10], "C"."COMMENTAIRE"[VARCHAR2,117]
 
Remote SQL Information (identified by operation id):
----------------------------------------------------
 
   2 - SELECT /*+ USE_HASH ("C1") */ "NUMCDE","NUMCLIENT","ETAT","PRIXC","DATEC","PRIORIT
       E","VENDEUR","COMMENTAIRE" FROM "COMMANDE98" "C1" WHERE "PRIXC"=1000 (accessing 
       'SITECOMPLEMENT.FR' )
```
On peut voir dans la partie `Remote SQL` que la selection sur le prix est faite sur le site distant.

# Exercice 3
## R5
```
Plan hash value: 51045663
 
--------------------------------------------------------------------------------------------------------------
| Id  | Operation                    | Name          | Rows  | Bytes | Cost (%CPU)| Time     | Inst   |IN-OUT|
--------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT             |               |     4 |   992 |   166   (0)| 00:00:03 |        |      |
|   1 |  NESTED LOOPS                |               |       |       |            |          |        |      |
|   2 |   NESTED LOOPS               |               |     4 |   992 |   166   (0)| 00:00:03 |        |      |
|   3 |    REMOTE                    | COMMANDE98    |    82 | 11152 |     2   (0)| 00:00:01 | SITEC~ | R->S |
|*  4 |    INDEX RANGE SCAN          | IDX_NUMCLIENT |     1 |       |     1   (0)| 00:00:01 |        |      |
|*  5 |   TABLE ACCESS BY INDEX ROWID| CLIENT        |     1 |   112 |     2   (0)| 00:00:01 |        |      |
--------------------------------------------------------------------------------------------------------------
 
Query Block Name / Object Alias (identified by operation id):
-------------------------------------------------------------
 
   1 - SEL$1
   3 - SEL$1 / C1@SEL$1
   4 - SEL$1 / C@SEL$1
   5 - SEL$1 / C@SEL$1
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   4 - access("C"."NUMCLIENT"="C1"."NUMCLIENT")
   5 - filter("C"."NOM" LIKE '%001')
 
Column Projection Information (identified by operation id):
-----------------------------------------------------------
 
   1 - (#keys=0) "C1"."NUMCDE"[NUMBER,22], "C1"."NUMCLIENT"[NUMBER,22], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C1"."COMMENTAIRE"[VARCHAR2,100], "C"."NUMCLIENT"[NUMBER,22], 
       "C"."NOM"[VARCHAR2,25], "C"."NUMPAYS"[NUMBER,22], "C"."SEGMENT"[CHARACTER,10], 
       "C"."COMMENTAIRE"[VARCHAR2,117]
   2 - (#keys=0) "C1"."NUMCDE"[NUMBER,22], "C1"."NUMCLIENT"[NUMBER,22], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C1"."COMMENTAIRE"[VARCHAR2,100], "C".ROWID[ROWID,10], 
       "C"."NUMCLIENT"[NUMBER,22]
   3 - "C1"."NUMCDE"[NUMBER,22], "C1"."NUMCLIENT"[NUMBER,22], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C1"."COMMENTAIRE"[VARCHAR2,100]
   4 - "C".ROWID[ROWID,10], "C"."NUMCLIENT"[NUMBER,22]
   5 - "C"."NOM"[VARCHAR2,25], "C"."NUMPAYS"[NUMBER,22], "C"."SEGMENT"[CHARACTER,10], 
       "C"."COMMENTAIRE"[VARCHAR2,117]
 
Remote SQL Information (identified by operation id):
----------------------------------------------------
 
   3 - SELECT "NUMCDE","NUMCLIENT","ETAT","PRIXC","DATEC","PRIORITE","VENDEUR","COMMENTAIRE" FROM 
       "COMMANDE98" "C1" (accessing 'SITECOMPLEMENT.FR' )
```
On constate en effet dans la première table que l'opération faite à distance contient 82 lignes et pèse assez lourd. 


## R6
```
Plan hash value: 2764306955
 
-------------------------------------------------------------------------------------------------
| Id  | Operation          | Name       | Rows  | Bytes | Cost (%CPU)| Time     | Inst   |IN-OUT|
-------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |            |     4 |   992 |   186   (1)| 00:00:03 |        |      |
|*  1 |  HASH JOIN         |            |     4 |   992 |   186   (1)| 00:00:03 |        |      |
|*  2 |   TABLE ACCESS FULL| CLIENT     |  2112 |   231K|   184   (1)| 00:00:03 |        |      |
|   3 |   REMOTE           | COMMANDE98 |    82 | 11152 |     2   (0)| 00:00:01 | SITEC~ | R->S |
-------------------------------------------------------------------------------------------------
 
Query Block Name / Object Alias (identified by operation id):
-------------------------------------------------------------
 
   1 - SEL$1
   2 - SEL$1 / C@SEL$1
   3 - SEL$1 / C1@SEL$1
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - access("C"."NUMCLIENT"="C1"."NUMCLIENT")
   2 - filter("C"."NOM" LIKE '%001')
 
Column Projection Information (identified by operation id):
-----------------------------------------------------------
 
   1 - (#keys=1) "C"."NUMCLIENT"[NUMBER,22], "C1"."NUMCLIENT"[NUMBER,22], 
       "C"."COMMENTAIRE"[VARCHAR2,117], "C"."NOM"[VARCHAR2,25], "C"."NUMPAYS"[NUMBER,22], 
       "C"."SEGMENT"[CHARACTER,10], "C1"."NUMCDE"[NUMBER,22], "C1"."COMMENTAIRE"[VARCHAR2,100], 
       "C1"."ETAT"[VARCHAR2,1], "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], 
       "C1"."PRIORITE"[CHARACTER,15], "C1"."VENDEUR"[CHARACTER,15]
   2 - "C"."NUMCLIENT"[NUMBER,22], "C"."NOM"[VARCHAR2,25], "C"."NUMPAYS"[NUMBER,22], 
       "C"."SEGMENT"[CHARACTER,10], "C"."COMMENTAIRE"[VARCHAR2,117]
   3 - "C1"."NUMCDE"[NUMBER,22], "C1"."NUMCLIENT"[NUMBER,22], "C1"."ETAT"[VARCHAR2,1], 
       "C1"."PRIXC"[NUMBER,22], "C1"."DATEC"[DATE,7], "C1"."PRIORITE"[CHARACTER,15], 
       "C1"."VENDEUR"[CHARACTER,15], "C1"."COMMENTAIRE"[VARCHAR2,100]
 
Remote SQL Information (identified by operation id):
----------------------------------------------------
 
   3 - SELECT "NUMCDE","NUMCLIENT","ETAT","PRIXC","DATEC","PRIORITE","VENDEUR","COMMENTAI
       RE" FROM "COMMANDE98" "C1" (accessing 'SITECOMPLEMENT.FR' )
```

## R7
```
Plan hash value: 2618700453
 
-----------------------------------------------------------------------------------------------------
| Id  | Operation              | Name       | Rows  | Bytes | Cost (%CPU)| Time     | Inst   |IN-OUT|
-----------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT REMOTE|            |  2592 |   627K|   189   (3)| 00:00:03 |        |      |
|*  1 |  HASH JOIN             |            |  2592 |   627K|   189   (3)| 00:00:03 |        |      |
|   2 |   REMOTE               | CLIENT     |  2112 |   231K|   118   (2)| 00:00:02 |      ! | R->S |
|   3 |   TABLE ACCESS FULL    | COMMANDE98 | 17996 |  2390K|    70   (2)| 00:00:01 |  ORA10 |      |
-----------------------------------------------------------------------------------------------------
 
Query Block Name / Object Alias (identified by operation id):
-------------------------------------------------------------
 
   1 - SEL$1
   2 - SEL$1 / A1@SEL$1
   3 - SEL$1 / A2@SEL$1
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - access("A1"."NUMCLIENT"="A2"."NUMCLIENT")
 
Column Projection Information (identified by operation id):
-----------------------------------------------------------
 
   1 - (#keys=1) "A1"."NUMCLIENT"[NUMBER,22], "A2"."NUMCLIENT"[NUMBER,22], 
       "A1"."COMMENTAIRE"[VARCHAR2,117], "A1"."NOM"[VARCHAR2,25], "A1"."NUMPAYS"[NUMBER,22], 
       "A1"."SEGMENT"[CHARACTER,10], "A2"."NUMCDE"[NUMBER,22], "A2"."COMMENTAIRE"[VARCHAR2,100], 
       "A2"."ETAT"[VARCHAR2,1], "A2"."PRIXC"[NUMBER,22], "A2"."DATEC"[DATE,7], 
       "A2"."PRIORITE"[CHARACTER,15], "A2"."VENDEUR"[CHARACTER,15]
   2 - "A1"."NUMCLIENT"[NUMBER,22], "A1"."NOM"[VARCHAR2,25], "A1"."NUMPAYS"[NUMBER,22], 
       "A1"."SEGMENT"[CHARACTER,10], "A1"."COMMENTAIRE"[VARCHAR2,117]
   3 - "A2"."NUMCDE"[NUMBER,22], "A2"."NUMCLIENT"[NUMBER,22], "A2"."ETAT"[VARCHAR2,1], 
       "A2"."PRIXC"[NUMBER,22], "A2"."DATEC"[DATE,7], "A2"."PRIORITE"[CHARACTER,15], 
       "A2"."VENDEUR"[CHARACTER,15], "A2"."COMMENTAIRE"[VARCHAR2,100]
 
Remote SQL Information (identified by operation id):
----------------------------------------------------
 
   2 - SELECT "NUMCLIENT","NOM","NUMPAYS","SEGMENT","COMMENTAIRE" FROM "CLIENT" "A1" WHERE 
       "NOM" LIKE '%001' (accessing '!' )
 
 
Note
-----
   - fully remote statement
   - dynamic sampling used for this statement (level=yes)
```

# Exercice 4
# Exercice 5
# Exercice 6