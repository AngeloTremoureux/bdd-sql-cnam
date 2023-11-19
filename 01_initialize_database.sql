-- Supprimer toutes les contraintes et les index
DO $$ 
DECLARE 
    con record;
BEGIN 
    FOR con IN (SELECT conname, conrelid::regclass FROM pg_constraint) 
    LOOP 
        EXECUTE 'ALTER TABLE ' || con.conrelid || ' DROP CONSTRAINT IF EXISTS ' || con.conname; 
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

-- Supprimer toutes les tables
DO $$ 
DECLARE 
    table_name text;
BEGIN 
    FOR table_name IN (SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE') 
    LOOP 
        EXECUTE 'DROP TABLE IF EXISTS ' || table_name || ' CASCADE'; 
    END LOOP; 
END $$;
