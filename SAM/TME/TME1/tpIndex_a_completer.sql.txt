-- UE SAM 2022

-- NOM :
 
--Prénom : 


-- =========================
--      TP Index 2022
-- =========================

-- vider la corbeille
purge recyclebin;


-- Le format par défaut d'une date 
alter session set NLS_DATE_FORMAT='DD/MM/YYYY';
SELECT SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') as format_date_par_defaut FROM DUAL;

--select sysdate from dual;


desc tpch.Lineitem;


