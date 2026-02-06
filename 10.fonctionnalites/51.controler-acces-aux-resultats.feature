#language: fr
@fr
Fonctionnalité: Contrôler l'accès aux résultats d'un scrutin
  Dans le but de protéger la confidentialité ou éviter l'influence
  En tant qu'organisateur⋅ice d'un scrutin
  Je souhaite contrôler qui peut voir les résultats et quand


Règle: Un scrutin avec résultats "différés" ne peut être dépouillé qu'après la date de fin
Règle: Un scrutin avec résultats "admin_seulement" ne peut être dépouillé que par son auteur
Règle: Un scrutin avec résultats "immediat" peut être dépouillé par tout participant à tout instant
Règle: Pour activer les options "admin_seulement" ou "differe", l'auteur doit avoir un email vérifié


Scénario: Dépouiller immédiatement un scrutin avec résultats visibles en temps réel
  Étant donné un citoyen nommé Auteur
           Et une citoyenne nommée Participante
           Et Auteur crée un scrutin comme suit:
          """
          sujet: Scrutin en temps réel
          propositions:
            - Option A
            - Option B
          mentions:
            - Non
            - Oui
          visibilite_resultats: immediat
          """
           Et Participante vote sur le scrutin "Scrutin en temps réel":
          """
          Option A: Oui
          Option B: Non
          """
        Quand Participante dépouille le scrutin titré "Scrutin en temps réel"
        Alors Participante devrait réussir
           Et les résultats devraient être visibles


Scénario: Ne pas pouvoir dépouiller un scrutin avec résultats différés avant la date de fin
  Étant donné un citoyen nommé Organisateur
           Et Organisateur a un email vérifié
           Et une citoyenne nommée Votante
           Et Organisateur crée un scrutin comme suit:
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
           Et Votante vote sur le scrutin "Élection à suspense":
          """
          Candidat Alpha: Excellent
          Candidat Beta: Acceptable
          """
           Et la date actuelle est 2025-06-15T12:00:00Z
        Quand Votante tente de dépouiller le scrutin titré "Élection à suspense"
        Alors Votante devrait échouer
         Mais Votante devrait recevoir un message indiquant que les résultats sont différés


Scénario: Pouvoir dépouiller un scrutin avec résultats différés après la date de fin
  Étant donné un citoyen nommé Organisateur
           Et Organisateur a un email vérifié
           Et une citoyenne nommée Votante
           Et Organisateur crée un scrutin comme suit:
          """
          sujet: Élection terminée
          propositions:
            - Candidat Alpha
            - Candidat Beta
          mentions:
            - À rejeter
            - Acceptable
            - Excellent
          date_fin: 2025-06-20T23:59:59Z
          visibilite_resultats: differe
          """
           Et Votante vote sur le scrutin "Élection terminée":
          """
          Candidat Alpha: Excellent
          Candidat Beta: Acceptable
          """
           Et la date actuelle est 2025-06-21T08:00:00Z
        Quand Votante dépouille le scrutin titré "Élection terminée"
        Alors Votante devrait réussir
           Et les résultats devraient être visibles


Scénario: L'auteur peut toujours voir les résultats d'un scrutin avec résultats différés
  Étant donné un citoyen nommé Auteur
           Et Auteur a un email vérifié
           Et une citoyenne nommée Participante
           Et Auteur crée un scrutin comme suit:
          """
          sujet: Scrutin avec aperçu auteur
          propositions:
            - Proposition X
            - Proposition Y
          mentions:
            - Mauvais
            - Bon
          date_fin: 2025-12-31T23:59:59Z
          visibilite_resultats: differe
          """
           Et Participante vote sur le scrutin "Scrutin avec aperçu auteur":
          """
          Proposition X: Bon
          Proposition Y: Mauvais
          """
           Et la date actuelle est 2025-06-15T12:00:00Z
        Quand Auteur dépouille le scrutin titré "Scrutin avec aperçu auteur"
        Alors Auteur devrait réussir
           Et les résultats devraient être visibles pour l'auteur


Scénario: Ne pas pouvoir voir les résultats d'un scrutin réservé à l'administrateur (en tant que participant)
  Étant donné un citoyen nommé Administrateur
           Et Administrateur a un email vérifié
           Et une citoyenne nommée Participante
           Et Administrateur crée un scrutin comme suit:
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
           Et Participante vote sur le scrutin "Scrutin confidentiel":
          """
          Proposition Secrète A: Oui
          Proposition Secrète B: Non
          """
        Quand Participante tente de dépouiller le scrutin titré "Scrutin confidentiel"
        Alors Participante devrait échouer
         Mais Participante devrait recevoir un message indiquant que seul l'administrateur peut voir les résultats


Scénario: Voir les résultats d'un scrutin réservé à l'administrateur (en tant qu'auteur)
  Étant donné un citoyen nommé Administrateur
           Et Administrateur a un email vérifié
           Et une citoyenne nommée Participante
           Et Administrateur crée un scrutin comme suit:
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
           Et Participante vote sur le scrutin "Scrutin confidentiel":
          """
          Proposition Secrète A: Oui
          Proposition Secrète B: Non
          """
        Quand Administrateur dépouille le scrutin titré "Scrutin confidentiel"
        Alors Administrateur devrait réussir
           Et les résultats devraient être visibles pour l'administrateur


Scénario: Un modérateur peut voir les résultats d'un scrutin réservé à l'administrateur
  Étant donné un citoyen nommé Auteur
           Et Auteur a un email vérifié
           Et une citoyenne nommée Participante
           Et un modérateur nommé Modérateur
           Et Auteur crée un scrutin comme suit:
          """
          sujet: Scrutin modéré
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Non
            - Oui
          visibilite_resultats: admin_seulement
          """
           Et Participante vote sur le scrutin "Scrutin modéré":
          """
          Proposition A: Oui
          Proposition B: Non
          """
        Quand Modérateur dépouille le scrutin titré "Scrutin modéré"
        Alors Modérateur devrait réussir
           Et les résultats devraient être visibles pour le modérateur


Scénario: Un administrateur système peut voir tous les résultats
  Étant donné un citoyen nommé Auteur
           Et Auteur a un email vérifié
           Et une citoyenne nommée Participante
           Et un administrateur système nommé Admin
           Et Auteur crée un scrutin comme suit:
          """
          sujet: Scrutin système
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Non
            - Oui
          visibilite_resultats: admin_seulement
          """
           Et Participante vote sur le scrutin "Scrutin système":
          """
          Proposition A: Oui
          Proposition B: Non
          """
        Quand Admin dépouille le scrutin titré "Scrutin système"
        Alors Admin devrait réussir
           Et les résultats devraient être visibles pour l'administrateur système


Scénario: Ne pas pouvoir activer les résultats différés sans email vérifié
  Étant donné un citoyen nommé SansEmail
           Et SansEmail n'a pas d'email vérifié
        Quand SansEmail tente de créer un scrutin comme suit:
          """
          sujet: Tentative différée
          propositions:
            - Option X
            - Option Y
          mentions:
            - Non
            - Oui
          date_fin: 2025-12-31T23:59:59Z
          visibilite_resultats: differe
          """
        Alors SansEmail devrait échouer
         Mais SansEmail devrait recevoir un message lui demandant d'avoir un email vérifié
