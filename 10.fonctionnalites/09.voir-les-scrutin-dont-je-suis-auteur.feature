#language: fr
@fr
Fonctionnalité: Voir les scrutins dont je suis l'auteure
  Dans le but de présenter les derniers scrutins que j'ai créé
  En tant qu'utilisateure
  Je souhaite voir les scrutins dont je suis l'auteure



Scénario: Voir mon seul propre scrutin
  Étant donné un utilisateur nommé Ftok
           Et un scrutin au jugement majoritaire comme suit:
          """
          auteur: Ftok
          accès: privé
          sujet: Les techniques de Doctrine
          propositions:
            - findBy
            - queryBuilder
          mentions:
            - Argh
            - Meh
            - Oui
          """
        Quand Ftok liste ses propres scrutins
        Alors Ftok devrait réussir
           Et Ftok devrait voir un scrutin



Scénario: Voir mes propres scrutins
  Étant donné un utilisateur nommé Eban
  Étant donné un utilisateur nommé Ftok
  Et un scrutin au jugement majoritaire comme suit:
          """
          auteur: Eban
          accès: privé
          sujet: Comment réutiliser le même lien
          propositions:
            - Éditer un seul scrutin
            - Lister mes derniers scrutins
          mentions:
            - Défavorable
            - Favorable
          """
           Et un scrutin au jugement majoritaire comme suit:
          """
          auteur: Eban
          accès: privé
          sujet: L'administration système sous…
          propositions:
            - Linux
            - Windows
            - Mac
          mentions:
            - Défavorable
            - Balek
            - Favorable
          """
           Et un scrutin au jugement majoritaire comme suit:
          """
          auteur: Ftok
          accès: privé
          sujet: Les techniques de Doctrine
          propositions:
            - findBy
            - queryBuilder
          mentions:
            - Argh
            - Meh
            - Oui
          """
        Quand Eban liste ses propres scrutins
        Alors Eban devrait réussir
           Et Eban devrait voir seulement deux scrutins
        Quand Ftok liste ses propres scrutins
        Alors Ftok devrait réussir
           Et Ftok devrait voir seulement un scrutin


