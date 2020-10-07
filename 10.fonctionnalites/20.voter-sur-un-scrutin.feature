#language: fr
@fr
Fonctionnalité: Voter sur un scrutin au jugement majoritaire
  Dans le but d'exercer mon devoir
  Ainsi que de préserver mes droits
  Ou simplement de participer à un choix collectif
  En tant que citoyen⋅ne participant⋅e
  Je souhaite parfois décider avec un scrutin au jugement majoritaire


Règle: Chaque participant⋅e PEUT donner UNE mention à chaque proposition du scrutin


# La liste des mentions est sujette à débat:
# https://forum.mieuxvoter.fr/t/terminologie-mieuxvoter/42/76
#Règle: La première et meilleure mention est "excellent⋅e", "excellente" ou "excellent"
#Règle: La seconde mention est "très bien"
#Règle: La troisième mention est "bien"
#Règle: La quatrième mention est "assez bien"
#Règle: La cinquième mention est "passable"
#Règle: La sixième mention est "insuffisant", "insuffisante" ou "insuffisant⋅e"
#Règle: La septième et pire mention est "à rejeter"
# La "liste des mentions" pourrait-elle être nommée "Gradation" ?

# La liste des mentions doit être paramétrable
# Un scrutin doit avoir une liste de mentions par défaut (?!)

Règle: Dans le cas d'un nombre pair de votes, on prend la "pire" médiane



Scénario: Voter au jugement majoritaire
  Étant donné un citoyen nommé Rida
           Et un citoyen nommé Michel
           Et une citoyenne nommée Maria
           Et une citoyenne nommée Chloé
           Et un scrutin au jugement majoritaire comme suit:
          """
          sujet: Les modes de scrutin
          propositions:
            - Uninominal à un tour
            - Uninominal à deux tours
            - Vote par liste
            - Jugement Majoritaire
          mentions:
            - à rejeter
            - insuffisant
            - passable
            - assez bien
            - bien
            - très bien
            - excellent
          """
        Quand Rida vote sur le scrutin assujettissant "Les modes de scrutin":
          """
          Uninominal à un tour:    à rejeter
          Uninominal à deux tours: insuffisant
          Vote par liste:          passable
          Jugement Majoritaire:    excellent
          """

#           Et Rida affiche la transaction
        Alors Rida devrait avoir quatre votes sur le scrutin intitulé "Les modes de scrutin"

        Alors le dépouillement standard du scrutin assujettissant "Les modes de scrutin" devrait être:
          """
          Uninominal à un tour:    à rejeter
          Uninominal à deux tours: insuffisant
          Vote par liste:          passable
          Jugement Majoritaire:    excellent
          """

        Quand Michel vote sur le scrutin au jugement majoritaire intitulé "Les modes de scrutin":
          """
          Uninominal à un tour:    à rejeter
          Uninominal à deux tours: à rejeter
          Vote par liste:          assez bien
          Jugement Majoritaire:    excellent
          """

        Alors le dépouillement standard du scrutin au jugement majoritaire intitulé "Les modes de scrutin" devrait être:
          """
          Uninominal à un tour:    à rejeter
          Uninominal à deux tours: à rejeter
          Vote par liste:          passable
          Jugement Majoritaire:    excellent
          """

        Quand Maria vote sur le scrutin au jugement majoritaire intitulé "Les modes de scrutin":
          """
          Uninominal à un tour:    à rejeter
          Uninominal à deux tours: à rejeter
          Vote par liste:          assez bien
          Jugement Majoritaire:    excellent
          """

        Alors le dépouillement standard du scrutin au jugement majoritaire intitulé "Les modes de scrutin" devrait être:
          """
          Uninominal à un tour:    à rejeter
          Uninominal à deux tours: à rejeter
          Vote par liste:          assez bien
          Jugement Majoritaire:    excellent
          """



Scénario: Nombre pair de votant⋅e⋅s
  Étant donné un citoyen surnommé Stup
           Et un citoyen surnommé Flip
           Et un scrutin au jugement majoritaire comme suit:
          """
          sujet: Le travail des croix du crou
          propositions:
            - croix de bois
            - croix de fer
          mentions:
            - chômage
            - gratin dauphinois
            - comme pour un album d'Astérix
          """
        Quand Stup vote sur le scrutin au jugement majoritaire assujettissant "Le travail des croix du crou":
          """
          croix de bois: chômage
          croix de fer:  comme pour un album d'Astérix
          """
        Quand Flip vote sur le scrutin au jugement majoritaire assujettissant "Le travail des croix du crou":
          """
          croix de bois: gratin dauphinois
          croix de fer:  gratin dauphinois
          """
        Alors le dépouillement standard du scrutin assujettissant "Le travail des croix du crou" devrait être:
          """
          croix de bois:
            position: 2
            mention: chômage
          croix de fer:
            position: 1
            mention: gratin dauphinois
          """



Scénario: Départage de propositions avec mention médiane identique
  Étant donné un citoyen surnommé Ali
           Et un citoyen surnommé Bob
           Et une citoyenne surnommée Cho
           Et une citoyenne surnommée Dia
           Et une citoyenne surnommée Eva
           Et un scrutin au jugement majoritaire comme suit:
          """
          sujet: Scrutin
          propositions:
            - Proposition A
            - Proposition B
            - Proposition C
          mentions:
            - à rejeter
            - insuffisant
            - passable
            - assez bien
            - bien
            - très bien
            - excellent
          """
        Quand Ali vote sur le scrutin au jugement majoritaire intitulé "Scrutin":
          """
          Proposition A: à rejeter
          Proposition B: à rejeter
          Proposition C: à rejeter
          """
        Quand Bob vote sur le scrutin au jugement majoritaire intitulé "Scrutin":
          """
          Proposition A: insuffisant
          Proposition B: bien
          Proposition C: bien
          """
        Quand Cho vote sur le scrutin au jugement majoritaire intitulé "Scrutin":
          """
          Proposition A: bien
          Proposition B: bien
          Proposition C: bien
          """
        Quand Dia vote sur le scrutin au jugement majoritaire intitulé "Scrutin":
          """
          Proposition A: bien
          Proposition B: bien
          Proposition C: bien
          """
        Quand Eva vote sur le scrutin au jugement majoritaire intitulé "Scrutin":
          """
          Proposition A: bien
          Proposition B: bien
          Proposition C: excellent
          """
        Alors le dépouillement standard du scrutin intitulé "Scrutin" devrait être:
          """
          Proposition A:
            mention: bien
            position: 3
          Proposition B:
            mention: bien
            position: 2
          Proposition C:
            mention: bien
            position: 1
          """


Scénario: Départage d'options n'ayant pas le même nombre de votes
  Étant donné une citoyenne nommée Alice
           Et un citoyen nommé Bobby
           Et un scrutin au jugement majoritaire comme suit:
          """
          sujet: Scrutin
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - à rejeter
            - bien
            - excellent
          """
        Quand Alice vote sur le scrutin au jugement majoritaire intitulé "Scrutin":
          """
          Proposition A: bien
          Proposition B: bien
          """
           Et Bobby vote sur le scrutin au jugement majoritaire intitulé "Scrutin":
          """
          Proposition A: bien
          """
           Et Bobby ne donne pas son avis sur l'autre proposition
        Alors le dépouillement standard du scrutin intitulé "Scrutin" devrait être:
          """
          Proposition A:
            mention: bien
            position: 1
          Proposition B:
            mention: à rejeter
            position: 2
          """



# Avoir des options nommées identiquement d'un scrutin à l'autre
# était une des limitations initiales connues de la base de code.
# Comme nous souhaitons enlever cette limitation, nous la testons.
# Comme ce scénario n'est pas très intéressant, mais utile pour développer
# et surtout pour éviter de régresser, il est taggué VIGIL.
#@vigil
#Scénario: Deux scrutins avec des options nommées identiquement
#  Étant donnée une citoyenne nommée A
#           #Et une citoyenne nommée B
#           Et un scrutin au jugement majoritaire comme suit:
#          """
#          titre: Scrutin A
#          candidats:
#            - Proposition 1
#            - Proposition 2
#          """
#           Et un scrutin au jugement majoritaire comme suit:
#          """
#          titre: Scrutin B
#          candidats:
#            - Proposition 1
#            - Proposition 2
#          """
#        Quand A vote sur le scrutin au jugement majoritaire intitulé "Scrutin A":
#          """
#          Proposition 1: à rejeter
#          Proposition 2: bien
#          """
#           Et A vote sur le scrutin au jugement majoritaire intitulé "Scrutin B":
#          """
#          Proposition 1: très bien
#          Proposition 2: excellent
#          """
#        Alors le dépouillement standard du scrutin au jugement majoritaire intitulé "Scrutin A" devrait être:
#          """
#          Proposition 1:
#            mention: à rejeter
#            position: 2
#          Proposition 2:
#            mention: bien
#            position: 1
#          """
#           Et le dépouillement standard du scrutin au jugement majoritaire intitulé "Scrutin B" devrait être:
#          """
#          Proposition 1:
#            mention: très bien
#            position: 2
#          Proposition 2:
#            mention: excellent
#            position: 1
#          """
