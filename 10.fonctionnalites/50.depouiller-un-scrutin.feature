#language: fr
@fr
Fonctionnalité: Dépouiller un scrutin au jugement majoritaire
  Dans le but de connaître les résultats d'un scrutin
  En tant que participante ou organisatrice
  Je souhaite procéder à son dépouillement



Règle: On ne peut pas dépouiller un scrutin sans aucun vote
Règle: La mention par défaut est la "pire" mention
Règle: Dans le cas d'un nombre pair de votes, on prend la "pire" médiane
Règle: Un scrutin peut être dépouillé à tout instant

#
# Règle: Un scrutin peut être configuré pour n'être dépouillable qu'après sa fermeture


Scénario: Échouer à dépouiller un scrutin sans aucun vote
  Étant donné un citoyen nommé Fantôme
           Et un scrutin au jugement majoritaire comme suit:
          """
          sujet: Lieux déserts à hanter
          propositions:
            - La Lune
            - Le Parlement
            - Mon Imagination
          mentions:
            - à rejeter
            - insuffisant
            - passable
            - assez bien
            - bien
            - très bien
            - excellent
          """
        Quand Fantôme tente de dépouiller le scrutin titré "Lieux déserts à hanter"
        Alors Fantôme devrait échouer



Scénario: Dépouillement à tout instant
  Étant donné un citoyen nommé R2D2
           Et un citoyen nommé C3PO
           Et une citoyenne nommée BB8
           Et un scrutin au jugement majoritaire comme suit:
          """
          sujet: La Saga Star Wars
          propositions:
            - Épisode IV
            - Épisode V
            - Épisode VI
            - Disney
          mentions:
            - à rejeter
            - insuffisant
            - passable
            - assez bien
            - bien
            - très bien
            - excellent
          """
        Quand R2D2 vote sur le scrutin au jugement majoritaire titré "La Saga Star Wars":
          """
          Épisode IV : excellent
          Épisode V  : très bien
          Épisode VI : très bien
          Disney     : insuffisant
          """
           Et R2D2 dépouille le scrutin titré "La Saga Star Wars"
        Alors R2D2 devrait réussir
           #Et R2D2 affiche la transaction
           Et ce dépouillement devrait être:
          """
          Épisode IV:
            rang: 1
            mention: excellent
          Épisode V:
            rang: 2
            mention: très bien
          Épisode VI:
            rang: 2
            mention: très bien
          Disney:
            rang: 4
            mention: insuffisant
          """
        Quand C3PO vote sur le scrutin au jugement majoritaire titré "La Saga Star Wars":
          """
          Épisode IV : excellent
          Épisode V  : passable
          Épisode VI : très bien
          Disney     : à rejeter
          """
           Et C3PO dépouille le scrutin titré "La Saga Star Wars"
        Alors C3PO devrait aussi réussir
        Quand C3PO dépouille à nouveau le scrutin titré "La Saga Star Wars"
        Alors C3PO devrait encore réussir
           Et ce dépouillement devrait être:
          """
          Épisode IV:
            rang: 1
            mention: excellent
          Épisode V:
            rang: 3
            mention: passable
          Épisode VI:
            rang: 2
            mention: très bien
          Disney:
            rang: 4
            mention: à rejeter
          """

@wip
Scénario: Dépouiller un scrutin public
  Étant donnée une visiteuse nommée Caro
     Et un scrutin au jugement majoritaire comme suit:
    """
    sujet: Le goût des sucreries
    sujet-proposition: gout de sucrerie
    question: Comment jugez-vous le goût des sucreries suivantes ?
    question-singuliere: Comment jugez-vous le goût de la sucrerie "<X>" ?
    propositions:
      - Caramel dur
      - Truk chimik ki pik
      - Barre de réglisse
    mentions:
      - à rejeter
      - insuffisant
      - passable
      - assez bien
      - bien
      - très bien
      - excellent
    """
    Quand Caro vote sur le scrutin au jugement majoritaire assujettissant "Le goût des sucreries":
    """
    Caramel dur: excellent
    Truk chimik ki pik: très bien
    Barre de réglisse: passable
    """
    Quand Caro dépouille le scrutin assujettissant "Le goût des sucreries"
    Alors Caro devrait réussir
       Et Caro affiche la transaction


# Puisque nos autres scénarios n'utilisent qu'un seul scrutin
@vigil
Scénario: Deux scrutins
  Étant donné une citoyenne nommée Adèle
     Et une citoyenne nommée Brigitte
     Et une citoyenne nommée Clotilde
     Et un scrutin au jugement majoritaire comme suit:
    """
    sujet: Sujet I
    propositions:
      - Proposition A
      - Proposition B
    mentions:
      - à rejeter
      - insuffisant
      - passable
      - assez bien
      - bien
      - très bien
      - excellent
    """
     Et un scrutin au jugement majoritaire comme suit:
    """
    sujet: Sujet II
    propositions:
      - Proposition A2
      - Proposition B2
    mentions:
      - à rejeter
      - insuffisant
      - passable
      - assez bien
      - bien
      - très bien
      - excellent
    """
  Quand Adèle vote sur le scrutin au jugement majoritaire titré "Sujet I":
    """
    Proposition A: excellent
    Proposition B: bien
    """
  Quand Brigitte vote sur le scrutin au jugement majoritaire titré "Sujet I":
    """
    Proposition A: excellent
    Proposition B: très bien
    """
  Quand Clotilde vote sur le scrutin au jugement majoritaire titré "Sujet II":
    """
    Proposition A2: assez bien
    Proposition B2: assez bien
    """
  Quand Brigitte vote sur le scrutin au jugement majoritaire titré "Sujet II":
    """
    Proposition A2: passable
    Proposition B2: excellent
    """
  Quand Adèle dépouille le scrutin au sujet de "Sujet I"
#     Et Adèle affiche la transaction
  Alors Adèle devrait réussir
     Et ce dépouillement devrait être:
    """
    Proposition A:
      rang: 1
      mention: excellent
    Proposition B:
      rang: 2
      mention: bien
    """
  Quand Adèle dépouille le scrutin au sujet de "Sujet II"
#     Et Adèle affiche la transaction
  Alors Adèle devrait encore réussir
     Et ce dépouillement devrait être:
    """
    Proposition B2:
      rang: 1
      mention: assez bien
    Proposition A2:
      rang: 2
      mention: passable
    """