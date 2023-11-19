-- Création de la fonction pour calculer l'amende
CREATE OR REPLACE FUNCTION calculer_amende()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.date_retour > NEW.date_retour_prevu THEN
        NEW.amende = (NEW.date_retour - NEW.date_retour_prevu) * 1.0; -- 1€ par jour de retard
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Création du trigger associé à la fonction
CREATE TRIGGER check_date_retour
BEFORE INSERT OR UPDATE ON Emprunt
FOR EACH ROW EXECUTE FUNCTION calculer_amende();

