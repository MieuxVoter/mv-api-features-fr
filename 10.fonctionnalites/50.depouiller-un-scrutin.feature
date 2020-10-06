#language: fr
@fr
Fonctionnalité: Dépouiller un scrutin au jugement majoritaire
  Dans le but de connaître les résultats d'un scrutin
  En tant que participante ou organisatrice
  Je souhaite procéder à son dépouillement



Règle: On ne peut pas dépouiller un scrutin sans aucun vote
Règle: La mention par défaut est la "pire" mention
Règle: Dans le cas d'un nombre pair de votes, on prend la "pire" médiane



Scénario: Dépouillement d'un scrutin sans aucun vote
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
