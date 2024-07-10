

# COBOL-P3-HDF-BOBONIORT
<br>
<br>
<p align="center">
<img alt="COBOL" src="/DOCUMENTS/Boboniort.png" />&nbsp;
</p>
<br>
<br>
Le projet Boboniort est un écosystème applicatif cherchant à d'améliorer l'efficacité des opérations internes d'une mutuelle fictive dévelopé en COBOL.
<br>
### Objectif :
Fournir une interface conviviale permettant la saisie et la consultation faciles des informations.  
Les écrans devront avoir des fonctionnalités de recherche et de filtrage pour accéder rapidement aux données pertinentes.  
Automatiser les processus manuels.  
<br>
<br>
### Fonctionnalités :
Gestion des adhérents : enregistrement, modification et archivage des informations personnelles,
médicales et administratives des adhérents.  
Gestion des cotisations : calcul, facturation et suivi des paiements des cotisations des adhérents.  
Gestion des remboursements : enregistrement, traitement et suivi des demandes de
remboursement des adhérents.  
Gestion des prestations : attribution et suivi des prestations en fonction des garanties souscrites par
les adhérents.  
Génération de rapports : production de rapports personnalisés pour la direction, les services
administratifs et les adhérents.  
<br>

<br>
Vous trouverez ici le cahier des charges fonctionnel, la documentation technique, la documentation utilisateur, le powerpoint de présentation de l'application.
<br>
<br>
### L'application permet :
gérer les adhérents: Recherche d'un adhérent , création d'un adhérent, archivage d'un adhérent.  
gérer les prestations: 3 contrat types sont chargé dans la base, ils sont proposés par défaut, mais l'utilisateur peut personnaliser le contrat. Le coût mensuel du contrat est calculé immédiatement.  
gérer les cotisations: le coût du contrat est calculé au moment de l'affectation. L'utilisateur peut saisir un montant de versement et déclencher une facturation.  
gérer les rapports: une seconde application propose divers statistiques afin de fournir une premier niveau de rapport.  
Cette même application charge un fichier csv fourni par le client afin d'avoir un jeu de données plus important pour la partie client.    
<br>
<br>
### Preparation du Script :
Pour utiliser l'application, récupérez les éléments fournis dans ce github.
<br>
Commencez par créer la base postgres dans votre environnement.
Nom: boboniortdb, user: cobol, mot de passe: cbl85
ouvrez la fenêtre du terminal dans le répertoire SQL et dans l'ordre, appliquez le script BoBoniort-full-demo.sql.
par \q sortez de plsql, puis exécutez l'exécutable runvil.

<br>
Appropriez vous le script d'exécution scriptMAIN.sh par la ligne de commande suivante: sed -i -e 's/\r$//' scriptMAIN.sh
Puis lancez le script ./CUSTOMER-MGMT/scriptMAIN.sh pour voyager dans l'application principale.
<br>
<br> 
Appropriez vous le script d'exécution script-compile.sh par la ligne de commande suivante: sed -i -e 's/\r$//' script-compile.sh
Lancez le script ./DATA-MGMT/scriptMAIN.sh pour accéder à l'application annexe.
<br>
Vous pourrez visualiser les statistiques et charger le fichier csv.
<br>
<br>
Bonne visite de notre système applicatif !