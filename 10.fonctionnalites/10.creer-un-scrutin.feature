#language: fr
@fr
Fonctionnalité: Créer un scrutin au jugement majoritaire
  Dans le but de décider collectivement
  En tant que collectif démocratique connecté
  Nous souhaitons créer un scrutin au jugement majoritaire

  Dans le but de s'organiser pour ce week-end
  En tant que groupe d'amis
  Nous souhaitons créer un scrutin au jugement majoritaire


Règle: Un scrutin requiert un sujet

Règle: Le sujet d'un scrutin doit comporter au moins 1 caractère
Règle: Le sujet d'un scrutin doit comporter au plus 142 caractères

Règle: Un scrutin requiert au moins deux (2) propositions
# Discuss: https://framagit.org/limaju/limaju-server-symfony/-/issues/9
Règle: Un scrutin accepte au plus ??? (?) propositions

Règle: Un scrutin requiert au moins deux (2) mentions
Règle: Un scrutin accepte au plus seize (16) mentions


Scénario: Créer un scrutin au jugement majoritaire
  Étant donné un citoyen surnommé Chinao
#      Sachant qu'il ne devrait y avoir aucun scrutin au jugement majoritaire dans la base de données
        Quand Chinao crée un scrutin au jugement majoritaire comme suit:
          """
          sujet: Repas de samedi
          propositions:
            - Barbecue vegan
            - Lasagnes
            - Aubergines à la japonaise
          mentions:
            - Non, merci
            - Mouais
            - Oui
            - Oui, oui, oui!
          """
#           Et Chinao affiche la transaction
        Alors il devrait maintenant y avoir un scrutin au jugement majoritaire dans la base de données
           Et le scrutin intitulé "Repas de samedi" devrait avoir trois propositions
           Et le scrutin intitulé "Repas de samedi" devrait avoir quatre mentions



Scénario: Échouer à créer un scrutin avec un sujet vide
  Étant donné une citoyenne surnommée Alouette
        Quand Alouette tente de créer un scrutin au jugement majoritaire comme suit:
          """
          sujet: ""
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Mention B
            - Mention A
          """
        Alors Alouette devrait échouer
#           Et Alouette affiche la transaction
           Et il devrait toujours n'y avoir aucun scrutin dans la base de données



Scénario: Échouer à créer un scrutin avec un sujet trop long
  Étant donné une citoyenne surnommée Bavarde
        Quand Bavarde tente de créer un scrutin au jugement majoritaire comme suit:
          """
          sujet: |
            Un sujet de plus de cent quarante caractères, c'est un peu fort de café !
            Ça fait quand même deux bonnes lignes, et de la place pour une URL !
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Mention B
            - Mention A
          """
        Alors Bavarde devrait échouer
#           Et Bavarde affiche la transaction
           Et il devrait toujours n'y avoir aucun scrutin dans la base de données




Scénario: Échouer à créer un scrutin avec trop peu de propositions
  Étant donné une citoyenne surnommée Pofi
        Quand Pofi tente de créer un scrutin au jugement majoritaire comme suit:
          """
          sujet: Scrutin biaisé
          propositions:
            - Mon Favori
          mentions:
            - Bien
            - Excellent
          """
        Alors Pofi devrait échouer
#           Et Pofi affiche la transaction
           Et il devrait toujours n'y avoir aucun scrutin dans la base de données



Scénario: Échouer à créer un scrutin avec trop peu de mentions
  Étant donné une citoyenne surnommée Paresse
        Quand Paresse tente de créer un scrutin au jugement majoritaire comme suit:
          """
          sujet: Mes activités favorites
          propositions:
            - Dormir
            - Faire la sieste
          mentions:
            - Accepter
          """
        Alors Paresse devrait échouer
#           Et Paresse affiche la transaction
           Et il ne devrait encore y avoir aucun scrutin dans la base de données



Scénario: Échouer à créer un scrutin avec trop de mentions (17 mentions)
  Étant donné une citoyenne enthousiaste surnommée Perle
        Quand Perle tente de créer un scrutin comme suit:
          """
          sujet: Scrutin trop précis
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Mention Q
            - Mention P
            - Mention O
            - Mention N
            - Mention M
            - Mention L
            - Mention K
            - Mention J
            - Mention I
            - Mention H
            - Mention G
            - Mention F
            - Mention D
            - Mention E
            - Mention C
            - Mention B
            - Mention A
          """
        Alors Perle devrait échouer
#           Et Perle affiche la transaction
           Et il devrait toujours n'y avoir aucun scrutin dans la base de données



Scénario: Créer un scrutin avec date de début
  Étant donné un citoyen nommé Organisateur
        Quand Organisateur crée un scrutin au jugement majoritaire comme suit:
          """
          sujet: Assemblée Générale 2025
          propositions:
            - Motion A
            - Motion B
            - Motion C
          mentions:
            - Contre
            - Abstention
            - Pour
          date_debut: 2025-06-15T09:00:00Z
          """
        Alors Organisateur devrait réussir
           Et le scrutin intitulé "Assemblée Générale 2025" devrait avoir une date de début

Scénario: Créer un scrutin avec date de fin
  Étant donné une citoyenne nommée Planificatrice
        Quand Planificatrice crée un scrutin au jugement majoritaire comme suit:
          """
          sujet: Vote pour le lieu de la fête
          propositions:
            - Plage
            - Montagne
            - Campagne
          mentions:
            - Pas du tout
            - Peut-être
            - Absolument
          date_fin: 2025-07-01T18:00:00Z
          """
        Alors Planificatrice devrait réussir
           Et le scrutin intitulé "Vote pour le lieu de la fête" devrait avoir une date de fin

Scénario: Créer un scruting avec une date de fin antérieure à la date de début
  Étant donné un citoyen nommé Chrono
        Quand Chrono tente de créer un scrutin au jugement majoritaire comme suit:
          """
          sujet: Scrutin temporel
          propositions:
            - Option 1
            - Option 2
          mentions:
            - Non
            - Oui
          date_debut: 2025-08-01T10:00:00Z
          date_fin: 2025-07-01T18:00:00Z
          """
        Alors Chrono devrait échouer
           Et il devrait toujours n'y avoir aucun scrutin dans la base de données

Scénario: Créer un scruting avec une date de fin antérieure à maintenant
  Étant donné une citoyenne nommée Rétro
        Quand Rétro tente de créer un scrutin au jugement majoritaire comme suit:
          """
          sujet: Scrutin du passé
          propositions:
            - Option A
            - Option B
          mentions:
            - Non
            - Oui
          date_fin: 2020-01-01T00:00:00Z
          """
        Alors Rétro devrait échouer
           Et il devrait toujours n'y avoir aucun scrutin dans la base de données

Scénario: Créer un scrutin avec résultats visibles immédiatement
  Étant donné une citoyenne nommée Claire
        Quand Claire crée un scrutin au jugement majoritaire comme suit:
          """
          sujet: Sondage instantané
          propositions:
            - Option A
            - Option B
          mentions:
            - Pas convaincu
            - Convaincu
          visibilite_resultats: immediat
          """
        Alors Claire devrait réussir
           Et les résultats du scrutin "Sondage instantané" devraient être visibles immédiatement


Scénario: Créer un scrutin avec résultats différés jusqu'à la date de fin
  Étant donné un citoyen nommé Patiente
           Et Patiente a un email vérifié
        Quand Patiente crée un scrutin au jugement majoritaire comme suit:
          """
          sujet: Élection à suspense
          propositions:
            - Candidat Alpha
            - Candidat Beta
          mentions:
            - À rejeter
            - Acceptable
            - Excellent
          date_fin: 2025-12-31T23:59:59Z
          visibilite_resultats: differe
          """
        Alors Patiente devrait réussir
           Et les résultats du scrutin "Élection à suspense" ne devraient pas être visibles avant la date de fin


Scénario: Créer un scrutin avec résultats visibles uniquement par l'administrateur
  Étant donné un citoyen nommé Confidentiel
           Et Confidentiel a un email vérifié
        Quand Confidentiel crée un scrutin au jugement majoritaire comme suit:
          """
          sujet: Scrutin confidentiel
          propositions:
            - Proposition Secrète A
            - Proposition Secrète B
          mentions:
            - Non
            - Oui
          visibilite_resultats: admin_seulement
          """
        Alors Confidentiel devrait réussir
           Et les résultats du scrutin "Scrutin confidentiel" ne devraient être visibles que par l'administrateur


Scénario: Échouer à créer un scrutin avec résultats admin-only sans email vérifié
  Étant donné une citoyenne nommée SansEmail
           Et SansEmail n'a pas d'email vérifié
        Quand SansEmail tente de créer un scrutin au jugement majoritaire comme suit:
          """
          sujet: Tentative scrutin privé
          propositions:
            - Proposition X
            - Proposition Y
          mentions:
            - Non
            - Oui
          visibilite_resultats: admin_seulement
          """
        Alors SansEmail devrait échouer
         Mais SansEmail devrait recevoir un message lui demandant d'avoir un email vérifié


Scénario: Créer un scrutin avec ordre aléatoire des candidats
  Étant donné un citoyen nommé Equitable
        Quand Equitable crée un scrutin au jugement majoritaire comme suit:
          """
          sujet: Scrutin équitable
          propositions:
            - Premier dans la liste
            - Deuxième dans la liste
            - Troisième dans la liste
          mentions:
            - Mauvais
            - Moyen
            - Bon
          ordre_aleatoire_candidats: true
          """
        Alors Equitable devrait réussir
           Et le scrutin "Scrutin équitable" devrait afficher les candidats dans un ordre aléatoire

