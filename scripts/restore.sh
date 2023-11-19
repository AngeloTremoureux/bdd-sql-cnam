#!/bin/bash

set -e  # Arrêter le script en cas d'erreur

# Variables
DATABASE_NAME="db"
USER_NAME="alexis"
SCHEMA_DIR="../docker-entrypoint-initdb.d"


# Exécution du fichier "restore.sql"
psql -U $USER_NAME -d $DATABASE_NAME -f ./../backup/restore.sql

# Exécution des fichiers SQL dans le dossier "schemas"
for file in $(ls $SCHEMA_DIR/*.sql | sort); do
    echo "Exécution de $file"
    psql -U $USER_NAME -d $DATABASE_NAME -1 -f $file || { echo "Erreur lors de l'exécution de $file"; exit 1; }
done

echo "Script exécuté avec succès !"
