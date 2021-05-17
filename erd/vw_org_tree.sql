--   -------------------------------------------------- 
--   created day : 2019.01.15 
--   dbms       : postgresql 
--   -------------------------------------------------- 

CREATE VIEW vw_org_tree AS  
 WITH RECURSIVE tb_result(row_type, org_cd, org_nm, up_org_cd, level, group_path, cycle) AS (
         SELECT 'grp'::text AS row_type,
            (g.org_cd)::text AS org_cd,
            (g.org_nm)::text AS org_nm,
				CASE WHEN ((g.up_org_cd)::text = ''::text or (g.up_org_cd is null)) 
				THEN '#'::text ELSE g.up_org_cd END up_org_cd,
            0,
            ARRAY[(g.org_cd)::text] AS "array",
            false AS bool
           FROM tb_m_org g
          WHERE ((g.up_org_cd)::text=''::text or (g.up_org_cd is null))
        UNION ALL
         SELECT grp.row_type,
            grp.org_cd,
            grp.org_nm,
            grp.up_org_cd,
            (r.level + 1),
            (r.group_path || (grp.org_cd)::text),
            ((grp.org_cd)::text = ANY (r.group_path))
           FROM ( SELECT 
		    			  'grp'::text AS row_type,
                    TG.org_cd,
                    TG.org_nm,
                    TG.up_org_cd                   
                   FROM tb_m_org TG
                UNION ALL
                 SELECT 
					     'emp'::text AS row_type,
                    TE.emp_no AS org_cd,
                    TE.emp_nm AS org_nm,
                    TE.org_cd AS up_org_cd
                   FROM tb_m_emp TE) grp,
            tb_result r
          WHERE (((grp.up_org_cd)::text = r.org_cd) AND (NOT r.cycle))
        )
 SELECT rslt.row_type,
    rslt.org_cd,
    rslt.org_nm,
    rslt.up_org_cd,
    rslt.level,
    replace(replace(replace((rslt.group_path)::text, '{'::text, '/'::text), ','::text, '/'::text), '}'::text, ''::text) AS group_path
   FROM tb_result rslt
