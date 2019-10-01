#language: fr
@fr
@wip
Fonctionnalité: Dépouiller un scrutin au jugement majoritaire (liquide)
  Dans le but de connaître les résultats d'un scrutin
  En tant que démocrate
  Je souhaite procéder à son dépouillement



Règle: On ne peut pas dépouiller un scrutin sans aucun vote
Règle: La mention par défaut est "à rejeter"
Règle: Dans le cas d'un nombre pair de votes, on prend la "pire" médiane



Scénario: Dépouillement d'un scrutin sans aucun vote
  Étant donné un citoyen nommé Fantôme
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: Lieux déserts à hanter
          options:
            - La Lune
            - Le Parlement
            - Mon Imagination
          """
        Quand Fantôme tente de dépouiller le scrutin titré "Lieux déserts à hanter"
        Alors Fantôme devrait échouer



Scénario: Dépouillement à tout instant
  Étant donné un citoyen nommé R2D2
           Et un citoyen nommé C3PO
           Et une citoyenne nommée Rey
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: La Saga Star Wars
          options:
            - Épisode IV
            - Épisode V
            - Épisode VI
            - Disney
          """
        Quand R2D2 vote sur le scrutin au jugement majoritaire titré "La Saga Star Wars":
          """
          Épisode IV : excellent
          Épisode V  : très bon
          Épisode VI : très bon
          """
        # … TODO
        Quand R2D2 dépouille le scrutin titré "La Saga Star Wars"
        Alors R2D2 devrait réussir
