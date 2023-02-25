# Question 1 
1. `LINEITEM` comporte 6001215 line
2. Stocké que 109037 page
3. ...

# Question 2
...

# Question 3
...

# Question 4
...

# Question 5
1. Il y a 56683 prix distinct et 91 data différentes pour les commandes
2. Il y a 50 quantité distincte pour les achats d'un produit

# Question 6
```sql
drop index I_Achat_numCde;
create index I_Achat_numCde on AchatProduit(numCde);

drop index I_Achat_numAchat;
create index I_Achat_numAchat on AchatProduit(numAchat);

drop index I_Achat_dateAchat;
create index I_Achat_dateAchat on AchatProduit(dateAchat);

drop index I_Achat_prix;
create index I_Achat_prix on AchatProduit(prix);

drop index I_Achat_quantite;
create index I_Achat_quantite on AchatProduit(quantite);

drop index I_Achat_numProduit;
create index I_Achat_numProduit on AchatProduit(numProduit);

drop index I_Achat_numFournisseur;
create index I_Achat_numFournisseur on AchatProduit(numFournisseur);

drop index I_Achat_commentaire;
create index I_Achat_commentaire on AchatProduit(commentaire);
```

1. Les indexs avec la plus grande profondeur sont :
    - Date d'achat 
    - Numéros de commande
    - Commentaire
2. Le plus grand nombre de rowid est 1220 sur les commentaires

**Pourquoi ? C'est quoi ces mesures ?**

# Question 7 
## a
```md
---------------------------------------------------------------------------------
| Id  | Operation                   | Name         | Rows  | Bytes | Cost (%CPU)|
---------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |              |  2400 |   147K|  2407   (1)|
|   1 |  TABLE ACCESS BY INDEX ROWID| ACHATPRODUIT |  2400 |   147K|  2407   (1)|
|*  2 |   INDEX RANGE SCAN          | I_ACHAT_PRIX |  2400 |       |     7   (0)|
---------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("PRIX"<2000)
```

## b
```md
-------------------------------------------------------------------------------------
| Id  | Operation                   | Name             | Rows  | Bytes | Cost (%CPU)|
-------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |                  | 46273 |  2846K| 19128   (1)|
|   1 |  TABLE ACCESS BY INDEX ROWID| ACHATPRODUIT     | 46273 |  2846K| 19128   (1)|
|*  2 |   INDEX RANGE SCAN          | I_ACHAT_QUANTITE | 46273 |       |    92   (0)|
-------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("QUANTITE">40)
```

## c
```md
----------------------------------------------------------------------
| Id  | Operation        | Name         | Rows  | Bytes | Cost (%CPU)|
----------------------------------------------------------------------
|   0 | SELECT STATEMENT |              |   226K|  1328K|   535   (1)|
|   1 |  INDEX FULL SCAN | I_ACHAT_PRIX |   226K|  1328K|   535   (1)|
----------------------------------------------------------------------
```

## d
Remarque : Il n'y a pas de commande avec le prix < 2000 et la quantité > 40

En utilisant l'index sur le prix, le coût de la requete monte à 2407. En effet, on peut voir le `filter(quantite>40)` par la suite
```sql
SELECT /*+ index(a I_achat_prix) */
 numCde, numAchat
FROM AchatProduit a
WHERE quantite > 40 AND prix < 2000.0;
```
```md
---------------------------------------------------------------------------------
| Id  | Operation                   | Name         | Rows  | Bytes | Cost (%CPU)|
---------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |              |   490 |  8820 |  2407   (1)|
|*  1 |  TABLE ACCESS BY INDEX ROWID| ACHATPRODUIT |   490 |  8820 |  2407   (1)|
|*  2 |   INDEX RANGE SCAN          | I_ACHAT_PRIX |  2400 |       |     7   (0)|
---------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("QUANTITE">40)
   2 - access("PRIX"<2000.0)
 
```

En utilisant l'index sur le prix, le coût de la requete monte à 2407. En effet, on peut voir le `filter(prix<2000)` par la suite
```sql
SELECT /*+ index(a I_achat_quantite) */
 numCde, numAchat
FROM AchatProduit a;
```

```md
-------------------------------------------------------------------------------------
| Id  | Operation                   | Name             | Rows  | Bytes | Cost (%CPU)|
-------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |                  |   490 |  8820 | 19128   (1)|
|*  1 |  TABLE ACCESS BY INDEX ROWID| ACHATPRODUIT     |   490 |  8820 | 19128   (1)|
|*  2 |   INDEX RANGE SCAN          | I_ACHAT_QUANTITE | 46273 |       |    92   (0)|
-------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("PRIX"<2000)
   2 - access("QUANTITE">40)
```

## e
En combinant l’utilisation des deux index ou sans préciser d'index, on a un coût de 197
```sql
SELECT numCde, numAchat
FROM AchatProduit a
WHERE quantite > 40 AND prix < 2000.0;
```
```md
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
 
   6 - access("PRIX"<2000.0)
       filter("PRIX"<2000.0)
   9 - access("QUANTITE">40)
       filter("QUANTITE">40)
```

## f
```md
---------------------------------------------------------------------------------
| Id  | Operation               | Name             | Rows  | Bytes | Cost (%CPU)|
---------------------------------------------------------------------------------
|   0 | SELECT STATEMENT        |                  |   490 |  8820 |  1098   (1)|
|*  1 |  VIEW                   | index$_join$_001 |   490 |  8820 |  1098   (1)|
|*  2 |   HASH JOIN             |                  |       |       |            |
|*  3 |    HASH JOIN            |                  |       |       |            |
|*  4 |     HASH JOIN           |                  |       |       |            |
|*  5 |      INDEX RANGE SCAN   | I_ACHAT_PRIX     |   490 |  8820 |     8  (13)|
|*  6 |      INDEX RANGE SCAN   | I_ACHAT_QUANTITE |   490 |  8820 |    95   (4)|
|   7 |     INDEX FAST FULL SCAN| I_ACHAT_NUMACHAT |   490 |  8820 |   557   (1)|
|   8 |    INDEX FAST FULL SCAN | I_ACHAT_NUMCDE   |   490 |  8820 |   670   (1)|
---------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - filter("PRIX"<2000.0 AND "QUANTITE">40)
   2 - access(ROWID=ROWID)
   3 - access(ROWID=ROWID)
   4 - access(ROWID=ROWID)
   5 - access("PRIX"<2000.0)
   6 - access("QUANTITE">40)
```

# Question 8
1. 