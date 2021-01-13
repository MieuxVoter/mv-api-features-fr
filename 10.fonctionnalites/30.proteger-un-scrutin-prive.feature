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
