#language: fr
@fr
Fonctionnalité: Protéger un scrutin privé
  Dans le but de "sécuriser les votes"
  En tant qu'application
  Je dois refuser l'accès aux scrutins privés, sauf invitation



Scénario: Échouer à participer à un scrutin privé
  Étant donné une visiteuse nommée Tricheuse
           Et un scrutin au jugement majoritaire comme suit:
          """
          accès: privé
          sujet: Le Confort des Serveurs Git
          propositions:
            - Github
            - Gitlab
            - Gitea
          mentions:
            - Ne sait pas
            - Enfer
            - Dame de Fer
            - Chaise sans Paille
            - Duvet Mœlleux
            - Paradis
          """
        Quand Tricheuse tente de voter sur le scrutin sur "Le Confort des Serveurs Git":
          """
          Github: Enfer
          Gitlab: Duvet Mœlleux
          Gitea:  Paradis
          """
        Alors Tricheuse devrait échouer


Scénario: Les votes ne sont pas retournés dans l'ordre de soumission
  Étant donné un citoyen nommé Organisateur
           Et un citoyen nommé Premier
           Et une citoyenne nommée Deuxième
           Et un citoyen nommé Troisième
           Et une citoyenne nommée Quatrième
           Et Organisateur crée un scrutin comme suit:
          """
          accès: privé
          sujet: Scrutin anonyme
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Non
            - Oui
          """
           Et Organisateur génère 4 invitations pour le scrutin de "Scrutin anonyme"
           Et Premier accepte l'invitation N°1 de Organisateur
           Et Deuxième accepte l'invitation N°2 de Organisateur
           Et Troisième accepte l'invitation N°3 de Organisateur
           Et Quatrième accepte l'invitation N°4 de Organisateur
        Quand Premier vote sur le scrutin "Scrutin anonyme":
          """
          Proposition A: Oui
          Proposition B: Non
          """
           Et Deuxième vote sur le scrutin "Scrutin anonyme":
          """
          Proposition A: Non
          Proposition B: Oui
          """
           Et Troisième vote sur le scrutin "Scrutin anonyme":
          """
          Proposition A: Oui
          Proposition B: Oui
          """
           Et Quatrième vote sur le scrutin "Scrutin anonyme":
          """
          Proposition A: Non
          Proposition B: Non
          """
           Et Organisateur consulte les votes du scrutin "Scrutin anonyme"
        Alors l'ordre des votes retournés ne devrait pas correspondre à l'ordre de soumission
           Et l'ordre des votes ne devrait pas correspondre à l'ordre de la liste d'émargement


Scénario: Impossible de corréler un vote à un électeur spécifique
  Étant donné un citoyen nommé Organisateur
           Et une citoyenne nommée Alice
           Et un citoyen nommé Bob
           Et Organisateur crée un scrutin comme suit:
          """
          accès: privé
          sujet: Vote secret
          propositions:
            - Candidat X
            - Candidat Y
          mentions:
            - Contre
            - Pour
          """
           Et Organisateur génère 2 invitations pour le scrutin de "Vote secret"
           Et Alice accepte l'invitation N°1 de Organisateur
           Et Bob accepte l'invitation N°2 de Organisateur
        Quand Alice vote sur le scrutin "Vote secret":
          """
          Candidat X: Pour
          Candidat Y: Contre
          """
           Et Bob vote sur le scrutin "Vote secret":
          """
          Candidat X: Contre
          Candidat Y: Pour
          """
           Et Organisateur tente de consulter quel participant a voté pour quel candidat
        Alors Organisateur devrait échouer
           Et le système ne devrait pas permettre d'associer un vote à un participant spécifique
           Et seul le dépouillement agrégé devrait être disponible


Scénario: Les jugements sont mélangés lors de la consultation des résultats
  Étant donné un citoyen nommé Organisateur
           Et trois citoyens nommés Participant1, Participant2, Participant3
           Et Organisateur crée un scrutin comme suit:
          """
          accès: privé
          sujet: Scrutin avec mélange
          propositions:
            - Proposition Alpha
            - Proposition Beta
          mentions:
            - Mauvais
            - Moyen
            - Bon
          """
           Et Organisateur génère 3 invitations pour le scrutin de "Scrutin avec mélange"
           Et Participant1 accepte l'invitation N°1 de Organisateur
           Et Participant2 accepte l'invitation N°2 de Organisateur
           Et Participant3 accepte l'invitation N°3 de Organisateur
           Et Participant1 vote sur le scrutin "Scrutin avec mélange":
          """
          Proposition Alpha: Bon
          Proposition Beta: Mauvais
          """
           Et Participant2 vote sur le scrutin "Scrutin avec mélange":
          """
          Proposition Alpha: Moyen
          Proposition Beta: Bon
          """
           Et Participant3 vote sur le scrutin "Scrutin avec mélange":
          """
          Proposition Alpha: Mauvais
          Proposition Beta: Moyen
          """
        Quand Organisateur consulte les jugements individuels du scrutin "Scrutin avec mélange"
        Alors les jugements devraient être présentés dans un ordre aléatoire
           Et il ne devrait pas être possible de déterminer l'ordre de vote original


# Do we even want this?  Really not sure.
#Scénario: Échouer à accéder à un scrutin privé
#  Étant donné une visiteuse nommée Tricheuse
#           Et un scrutin au jugement majoritaire comme suit:
#          """
#          accès: privé
#          sujet: Le Confort des Serveurs Git
#          propositions:
#            - Github
#            - Gitlab
#            - Gitea
#          mentions:
#            - Ne sait pas
#            - Enfer
#            - Dame de Fer
#            - Chaise sans Paille
#            - Duvet moelleux
#            - Paradis
#          """
#        Quand Tricheuse tente d'accéder au scrutin sur "Le Confort des Serveurs Git"
#        Alors Tricheuse devrait échouer
