Cette partie charge le fichier individus.csv fourni par Florien.
Les étapes à suivre:
Dans le réperoire d'éxecution/compilation, déposer les fichiers annexes suivants:
individus.csv
villesz.csv
runvil
IND-UPDATE.sql

Exécuter runvil qui crée la table bobo_town et charge le fichier villesz.csv dans la table.
A partir de là les programmes cffront et cfback peuvent fonctionner.
Dans cffront j'ai mis en dur un chemin pour le fichier individus.csv. C'est juste de l'affichage, éventuellement modifier en fonction du chemin pour la démo. Le fichier doit être dans le même répertoire que l'éxecutable.
Le script IND-UPDATE.sql doit être dans le même répertoire que l'éxecutable.

cffront affiche le chemin complet de individus.csv et demande de valider le chargement.
cfback crée la table bobo_customer, charge le fichier individus.csv dans la table, exécute le script IND-UPDATE.sql, revient au menu data.
Pour l'exécution du script SQL, l'utilisateur doit saisir le mot de passe de la base de données.
