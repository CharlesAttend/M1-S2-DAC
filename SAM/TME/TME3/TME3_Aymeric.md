# SAM - TME3
## Q7
```
PLAN_TABLE_OUTPUT                                                                         
------------------------------------------------------------------------------------------
Plan hash value: 1761007982                                                               
                                                                                          
------------------------------------------------------------------------------------------
| Id  | Operation                        | Name             | Rows  | Bytes | Cost (%CPU)|
------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                 |                  |   490 |  8820 |   197   (3)|
|   1 |  TABLE ACCESS BY INDEX ROWID     | ACHATPRODUIT     |   490 |  8820 |   197   (3)|
|   2 |   BITMAP CONVERSION TO ROWIDS    |                  |       |       |            |
|   3 |    BITMAP AND                    |                  |       |       |            |
|   4 |     BITMAP CONVERSION FROM ROWIDS|                  |       |       |            |
|   5 |      SORT ORDER BY               |                  |       |       |            |
|*  6 |       INDEX RANGE SCAN           | I_ACHAT_PRIX     |       |       |     7   (0)|
|   7 |     BITMAP CONVERSION FROM ROWIDS|                  |       |       |            |
|   8 |      SORT ORDER BY               |                  |       |       |            |
|*  9 |       INDEX RANGE SCAN           | I_ACHAT_QUANTITE |       |       |    92   (0)|
------------------------------------------------------------------------------------------
                                                                                          
Predicate Information (identified by operation id):                                       
---------------------------------------------------                                       
                                                                                          
   6 - access("PRIX"<2000)                                                                
       filter("PRIX"<2000)                                                                
   9 - access("QUANTITE">40)                                                              
       filter("QUANTITE">40)                                                              
                                                                                          
Column Projection Information (identified by operation id):                               
-----------------------------------------------------------                               
                                                                                          
   1 - "NUMCDE"[NUMBER,22], "NUMACHAT"[NUMBER,22]                                         
   2 - "A".ROWID[ROWID,10]                                                                
   3 - STRDEF[BM VAR, 10], STRDEF[BM VAR, 10], STRDEF[BM VAR, 32496]                      
   4 - STRDEF[BM VAR, 10], STRDEF[BM VAR, 10], STRDEF[BM VAR, 32496]                      
   5 - (#keys=1) "A".ROWID[ROWID,10]                                                      
   6 - "A".ROWID[ROWID,10]                                                                
   7 - STRDEF[BM VAR, 10], STRDEF[BM VAR, 10], STRDEF[BM VAR, 32496]                      
   8 - (#keys=1) "A".ROWID[ROWID,10]                                                      
   9 - "A".ROWID[ROWID,10]                                                                

```

f)
```
PLAN_TABLE_OUTPUT                                                               
--------------------------------------------------------------------------------
Plan hash value: 1929859435                                                     
                                                                                
--------------------------------------------------------------------------------
| Id  | Operation              | Name             | Rows  | Bytes | Cost (%CPU)|
--------------------------------------------------------------------------------
|   0 | SELECT STATEMENT       |                  |   212K|  3738K|  4812   (1)|
|*  1 |  VIEW                  | index$_join$_001 |   212K|  3738K|  4812   (1)|
|*  2 |   HASH JOIN            |                  |       |       |            |
|*  3 |    HASH JOIN           |                  |       |       |            |
|*  4 |     HASH JOIN          |                  |       |       |            |
|*  5 |      INDEX RANGE SCAN  | I_ACHAT_QUANTITE |   212K|  3738K|  1694   (1)|
|*  6 |      INDEX RANGE SCAN  | I_ACHAT_NUMACHAT |   212K|  3738K|  1733   (1)|
|*  7 |     INDEX RANGE SCAN   | I_ACHAT_PRIX     |   212K|  3738K|  1888   (1)|
|   8 |    INDEX FAST FULL SCAN| I_ACHAT_NUMCDE   |   212K|  3738K|   670   (1)|
--------------------------------------------------------------------------------
                                                                                
Predicate Information (identified by operation id):                             
---------------------------------------------------                             
                                                                                
   1 - filter("PRIX"<100000 AND "QUANTITE">1 AND "NUMACHAT"<20)                 
   2 - access(ROWID=ROWID)                                                      
   3 - access(ROWID=ROWID)                                                      
   4 - access(ROWID=ROWID)                                                      
   5 - access("QUANTITE">1)                                                     
   6 - access("NUMACHAT"<20)                                                    
   7 - access("PRIX"<100000)                                                    
                                                                                
Column Projection Information (identified by operation id):                     
-----------------------------------------------------------                     
                                                                                
   1 - "NUMCDE"[NUMBER,22], "PRIX"[NUMBER,22], "NUMACHAT"[NUMBER,22],           
       "QUANTITE"[NUMBER,22]                                                    
   2 - (#keys=1) "PRIX"[NUMBER,22], "NUMACHAT"[NUMBER,22],                      
       "QUANTITE"[NUMBER,22], "NUMCDE"[NUMBER,22]                               
   3 - (#keys=1) ROWID[ROWID,10], "NUMACHAT"[NUMBER,22],                        
       "QUANTITE"[NUMBER,22], "PRIX"[NUMBER,22]                                 
   4 - (#keys=1) ROWID[ROWID,10], "QUANTITE"[NUMBER,22],                        
       "NUMACHAT"[NUMBER,22]                                                    
   5 - ROWID[ROWID,10], "QUANTITE"[NUMBER,22]                                   
   6 - ROWID[ROWID,10], "NUMACHAT"[NUMBER,22]                                   
   7 - ROWID[ROWID,10], "PRIX"[NUMBER,22]                                       
   8 - ROWID[ROWID,10], "NUMCDE"[NUMBER,22]                                     

```

Comparer les plans d’exécution pour deux situations différentes lorsque les index existants sont :  
- I_achat_prix, I_achat_quantite, I_achat_numCde  
- I_achat_prix, I_achat_quantite, I_achat_numCde et I_achat_numAchat  
Dans quelle situation peut‐on dire que les index couvrent la requête ?
couvre dans les 2 cas par jointure

a) prix < 1000 and quantite =2  
direct access
b) quantite = 2  
filtre
c) prix < 1000  
range scan
d) prix > 1000
filtre .???

## Q9
```
NOM                    | TYPE_INDEX | PROFONDEUR | NUM_ROWS | NB_PAGES_DE_ROWIDS
-----------------------+------------+------------+----------+-------------------
I_ACHAT_QUANTITE_PRIX  | NORMAL     |          2 |   226736 |                627
I_ACHAT_QUANTITE       | NORMAL     |          1 |   226736 |                443
I_ACHAT_NUMPRODUIT     | NORMAL     |          1 |   226736 |                504
I_ACHAT_NUMFOURNISSEUR | NORMAL     |          1 |   226736 |                474
I_ACHAT_NUMCDE         | NORMAL     |          2 |   226736 |                532
I_ACHAT_NUMACHAT       | NORMAL     |          1 |   226736 |                443
I_ACHAT_DATE           | NORMAL     |          2 |   226736 |                602
I_ACHAT_COMMENTAIRE    | NORMAL     |          2 |   226736 |               1220
I_ACHAT_PRIX           | NORMAL     |          1 |   226736 |                532

```
R1
```sql
SELECT /*+ index(a I_achat_prix) */  
*  
FROM AchatProduit a  
WHERE prix < 2000;

```
$\text{coût}(R_a) = 1-1 + 2400 * 532/226736$


$\text{coût}(R_b) = 1-1 + 46273*443/226736$

$\text{coût}(R_c) = 1-1 + 226736 * 532/226736$

$coût(R_d) = 1-1+46273*443/226736$

## Q10
```
NOM                    | NUM_ROWS | CF    
-----------------------+----------+-------
I_ACHAT_QUANTITE_PRIX  |   226736 | 226641
I_ACHAT_QUANTITE       |   226736 |  93243
I_ACHAT_NUMPRODUIT     |   226736 | 226607
I_ACHAT_NUMFOURNISSEUR |   226736 | 225504
I_ACHAT_NUMCDE         |   226736 |  29422
I_ACHAT_NUMACHAT       |   226736 |  14708
I_ACHAT_DATE           |   226736 | 148964
I_ACHAT_COMMENTAIRE    |   226736 | 226040
I_ACHAT_PRIX           |   226736 | 226628
```

The _clustering_factor_ measures how synchronized an index is with the data in a table.  A table with a high clustering factor is out-of-sequence with the rows and large index range scans will consume lots of I/O.  Conversely, an index with a low _clustering_factor_ is closely aligned with the table and related rows reside together of each data block, making indexes very desirable for optimal access.

### a) 
Index dont le CF est très proche du nombre de lignes :
I_ACHAT_PRIX = 0.9995
I_ACHAT_NUMPRODUIT  = 0.9994
I_ACHAT_QUANTITE_PRIX = 0.9995
I_ACHAT_NUMFOURNISSEUR = 0.9945
I_ACHAT_COMMENTAIRE = 0.996

Index dont le CF est très inférieur au nombre de lignes :
I_ACHAT_NUMACHAT = 0.0648
I_ACHAT_NUMCDE = 0.1298

Insérer une commande va déclencher l'insertion de plusieurs tuples dans une même page, rendant la lecture de cet index beaucoup plus rapide et efficace (d'où un CF faible). Idem pour les achats.

### b)
$R_1 = cout(R1) + 2400 \times 226628/226736 = 2404$
Le SGBD trouve 2407.

## Q12
### a)
L'ajout d'une contrainte déclenche la création d'un index sur cette clé primaire.
```
NOM                    | TYPE_INDEX | PROFONDEUR | NUM_ROWS | NB_PAGES_DE_ROWIDS
-----------------------+------------+------------+----------+-------------------
CLE_COMMANDE           | NORMAL     |          1 |    56741 |                126

```
### b)
```
PLAN_TABLE_OUTPUT                                                                
---------------------------------------------------------------------------------
Plan hash value: 723999855                                                       
                                                                                 
---------------------------------------------------------------------------------
| Id  | Operation                   | Name         | Rows  | Bytes | Cost (%CPU)|
---------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |              |     1 |   108 |     2   (0)|
|   1 |  TABLE ACCESS BY INDEX ROWID| COMMANDE     |     1 |   108 |     2   (0)|
|*  2 |   INDEX UNIQUE SCAN         | CLE_COMMANDE |     1 |       |     1   (0)|
---------------------------------------------------------------------------------
                                                                                 
Predicate Information (identified by operation id):                              
---------------------------------------------------                              
                                                                                 
   2 - access("NUMCDE"=200)                                                      
                                     
```
Selection -> projection

## Q13
### a)
cout = 535

### b)
cout = 144

### c)
moins de tuples quand on lit que les valeurs uniques => donc on ne lit pas l'index en entier contrairement à la requête d'avant.

## Q15
coût_lecture_sequentielle(T) = pages(T) / multiRead + card(T) / cpu  
avec multiRead = 3,77 et cpu = 58000

= pages(T) / 3,77 + card(T) / 58000

table(commande) = 906 / 3.77 + 56741 / 58000  = 241
table(client) = 685/3.77 + 42247 / 58000 = 182
table(produit) = 1599/3.77 + 135775/58000 = 426


