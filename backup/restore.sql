-- Supprimer toutes les tables
DO $$
DECLARE
    table_name text;
BEGIN
    FOR table_name IN (SELECT information_schema.tables.table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE')
    LOOP
        EXECUTE 'DROP TABLE IF EXISTS ' || table_name || ' CASCADE';
    END LOOP;
END $$;

-- Supprimer toutes les contraintes et les index
DO $$ 
DECLARE 
    row_data record;
BEGIN 
    FOR row_data IN 
        SELECT table_name, constraint_name 
        FROM information_schema.table_constraints 
        WHERE table_schema = 'public'
    LOOP 
        EXECUTE 'ALTER TABLE ' || row_data.table_name || ' DROP CONSTRAINT IF EXISTS ' || row_data.constraint_name;
    END LOOP; 
END $$;

-- Supprimer toutes les vues
DO $$ 
DECLARE 
    view_name text;
BEGIN 
    FOR view_name IN (SELECT table_name FROM information_schema.tables WHERE table_type = 'VIEW' AND table_schema = 'public') 
    LOOP 
        EXECUTE 'DROP VIEW IF EXISTS ' || view_name; 
    END LOOP; 
END $$;


