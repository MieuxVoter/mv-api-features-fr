#language: fr
@fr
Fonctionnalité: Voir les scrutins publics
  Dans le but de découvrir des opinions et de partager les miennes
  En tant que visiteur
  Je souhaite voir les scrutins publics



Scénario: Voir les scrutins publics
  Étant donné un citoyen nommé Curieux
           Et un scrutin au jugement majoritaire comme suit:
          """
          accès: public
          sujet: Scrutin A
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Non
            - Oui
          """
        Quand Curieux liste les scrutins publics
        Alors Curieux devrait réussir
           Et Curieux devrait voir un scrutin



Scénario: Ne pas voir les scrutins non-listés
  Étant donné un citoyen nommé Curieux
           Et un scrutin au jugement majoritaire comme suit:
          """
          accès: non-listé
          sujet: Scrutin A
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Non
            - Oui
          """
        Quand Curieux liste les scrutins publics
        Alors Curieux devrait réussir
         Mais Curieux ne devrait voir aucun scrutin



Scénario: Ne pas voir les scrutins privés
  Étant donné un citoyen nommé Curieux
           Et un scrutin au jugement majoritaire comme suit:
          """
          accès: privé
          sujet: Scrutin A
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Non
            - Oui
          """
        Quand Curieux liste les scrutins publics
        Alors Curieux devrait réussir
         Mais Curieux ne devrait voir aucun scrutin


Scénario: Ne voir que 30 scrutins à la fois (pagination)
