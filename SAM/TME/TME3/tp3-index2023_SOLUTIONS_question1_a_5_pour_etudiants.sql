-- UE SAM 

-- =========================
--      TP3 Index
-- =========================

-- vider la corbeille
purge recyclebin;


-- Le format par défaut d'une date 
alter session set NLS_DATE_FORMAT='DD/MM/YYYY';
SELECT SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') as format_date_par_defaut FROM DUAL;
select sysdate from dual;

-- Question préliminaire
Select * from Joueur;
-- 1)
--  a.
select table_name, blocks, num_rows, avg_row_len, global_stats, user_stats
from all_tables
where owner = upper('tpch') and not(table_name like 'S%')
order by num_rows desc;

-- c.
-- Description de la table lineItem par l'utilisateur tpch (sans alias)
desc tpch.Lineitem;

CREATE OR REPLACE SYNONYM ORDERS FOR tpch.ORDERS;
CREATE OR REPLACE SYNONYM LINEITEM FOR tpch.LINEITEM;
CREATE OR REPLACE SYNONYM PART FOR tpch.PART;
CREATE OR REPLACE SYNONYM PARTSUPP FOR tpch.PARTSUPP;
CREATE OR REPLACE SYNONYM CUSTOMER FOR tpch.CUSTOMER;
CREATE OR REPLACE SYNONYM NATION FOR tpch.NATION;
CREATE OR REPLACE SYNONYM REGION FOR tpch.REGION;

-- DESC avec alias
desc Lineitem;

-- 2) 
-- Drop d'une table COMMANDE si existence avérée
drop table Commande cascade constraints purge;
create table Commande (
                      numCde Number not null,
                      numClient Number not null,
                      etat Char(1) not null,
                      prixC Number(15,2) not null,
                      dateC Date not null,
                      priorite Char(15) not null,
                      vendeur Char(15) not null,
                      commentaire Varchar2(100)
);

-- Insertion d'une ligne 
insert into Commande (
  select o_orderkey as numCde, o_custkey as numClient, o_orderstatus as etat, o_totalprice as prixC, o_orderdate as dateC, o_orderpriority as priorite, o_clerk as vendeur, o_comment as commentaire
  from Orders
  where extract(year from o_orderdate) = 1992
  and extract(month from o_orderdate) between 1 and 3
);

-- 3) 
drop table AchatProduit cascade constraints purge;
create table AchatProduit (
                            numCde Number not null,
                            numAchat Number not null,
                            dateAchat Date not null,
                            prix Number(15,2) not null,
                            quantite Number(15,2) not null,
                            numProduit Number not null,
                            numFournisseur Number not null,
                            commentaire varchar2(100)
);
-- 
-- Insertion des achats correspondant aux commandes passées dans la table commande
INSERT INTO AchatProduit (
  SELECT l.L_ORDERKEY AS numCde,
  l.L_LINENUMBER AS numAchat,
  l.L_COMMITDATE AS dateAchat,  
  l.L_EXTENDEDPRICE AS prix, 
  l.L_QUANTITY AS quantite, 
  l.L_PARTKEY AS numProduit, 
  l.L_SUPPKEY AS numFournisseur,
  l.L_COMMENT AS commentaire
  FROM LINEITEM l, Commande c
  WHERE c.numCde = l.L_ORDERKEY
);


-- 4) 
--    a.
CREATE TABLE Client
(
   numClient     NUMBER(38)           NOT NULL,
   nom        VARCHAR2(25 Byte)    NOT NULL,
   numPays   NUMBER(38)           NOT NULL,
   segment  CHAR(10)             NOT NULL,
   commentaire     VARCHAR2(117 Byte)   NOT NULL
);


--    b.
INSERT INTO Client(
  SELECT DISTINCT c.C_CUSTKEY AS numClient,
  c.C_NAME AS nom,
  c.C_NATIONKEY AS numPays,
  c.C_MKTSEGMENT AS segment,
  c.C_COMMENT AS commentaire
  FROM Customer c, Commande co
  WHERE co.numClient = c.C_CUSTKEY
);

--    c.
CREATE TABLE Produit
(
   numProduit      NUMBER(38)          NOT NULL,
   nom         VARCHAR2(55 Byte)   NOT NULL,
   marque        CHAR(10)            NOT NULL,
   type         VARCHAR2(25 Byte)   NOT NULL,
   taille         NUMBER(38)          NOT NULL,
   prixDetail  NUMBER(15,2)        NOT NULL
);
-- Insertion des produits
INSERT INTO Produit(
  SELECT DISTINCT p.P_PARTKEY AS numProduit,
  p.P_NAME AS nom,
  p.P_BRAND AS marque, 
  p.P_TYPE AS type,
  p.P_SIZE AS taille,
  p.P_RETAILPRICE AS prixDetail
  FROM PART p, AchatProduit a
  WHERE a.numProduit = p.P_PARTKEY
);

-- 5) 
create or replace procedure analyse(nomTable varchar2) as
  utilisateur varchar2(30);
begin
  select sys_context('USERENV', 'SESSION_USER') into utilisateur from dual;
  -- avec histogramme :
  -- dbms_stats.gather_table_stats(utilisateur, upper(nomTable));
  -- SANS histogramme :
  dbms_stats.gather_table_stats(utilisateur, upper(nomTable), method_opt =>'for all columns size 1', estimate_percent => 100);
end;
/
show error

exec analyse('Commande');
exec analyse('AchatProduit');

-- Afficher pour chaque table sa cardinalité et son nombre de pages
SELECT table_name, num_rows AS card, blocks AS pages, global_stats AS analyseFaite FROM user_tables;

-- Résumé général sur chaque attribut tous types confondus
SELECT table_name, column_name, data_type, sample_size,
      num_distinct AS nb_distinct, -- cette valeur est une approximation
      utl_raw.cast_to_number(low_value) AS borneInf,
      utl_raw.cast_to_number(high_value) AS borneSup
FROM user_tab_columns c
WHERE data_type = 'NUMBER'
AND table_name IN ('ACHATPRODUIT', 'COMMANDE', 'CLIENT', 'PRODUIT')
UNION
SELECT table_name, column_name, data_type, sample_size,
        num_distinct as nb_distinct, -- cette valeur est une approximation
        null, null
FROM user_tab_columns c
WHERE data_type like '%CHAR%' or data_type = 'DATE'
AND table_name in ('ACHATPRODUIT', 'COMMANDE', 'CLIENT', 'PRODUIT')
ORDER BY table_name, column_name;

-- Requête d'information sur chaque attribut : nombre de valeur, longueur moyenne... (uniquement sur les NUMBER)
SELECT tabl e_name, column_name, data_type, num_distinct, sample_size,
      avg_col_len AS longueur_moyenne, utl_raw.cast_to_number(low_value) AS borneInf,
      utl_raw.cast_to_number(high_value) AS borneSup, density
FROM user_tab_columns c
WHERE data_type = 'NUMBER'
ORDER BY table_name, column_id;

-- Requête d'information sur chaque attribut : nombre de valeur, longueur moyenne... (DATE et VARCHAR2)
SELECT table_name, column_name, data_type, num_distinct, avg_col_len AS longueur_moyenne, null AS borneInf, null AS borneSup, density
FROM user_tab_columns c
WHERE data_type = 'DATE' OR data_type LIKE '%CHAR%'
ORDER BY table_name, column_name;

-- unique = attr unq/PK
-- full = toutes feuilles de l'index
-- skip = toutes feuilles de l'index sauf certaines (permet l'utilisation d'index multi-attributs)

