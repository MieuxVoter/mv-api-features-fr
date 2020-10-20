#language: fr
@fr
@wip
Fonctionnalité: Verrouiller un scrutin par invitations
  Dans le but de "sécuriser" mon scrutin
  En tant qu'organisateur⋅e
  Je veux le rendre accessible sur invitation seulement
  Je veux pouvoir distribuer une liste de jetons d'invitation
  Je veux pouvoir restreindre la participation au scrutin à cette seule liste de jetons.
  Je peux générer une liste de jeton : par email/par twitter (sic)/par sms


#  En tant que visiteur, je suis titulaire d'un jeton d'invitation à participer à un scrutin.
#  Ce jeton doit me permettre de retrouver le scrutin.
#  Ce jeton protégé par une passphrase doit me permettre de consulter/modifier mon vote.


Scénario: Verrouiller un scrutin par (jetons d') invitations
  Étant donné un citoyen nommé Jean-Luc
           Et une citoyenne nommée Marianne
        Quand Jean-Luc crée un scrutin comme suit:
          """
          sujet: La Primaire 2022 de la France Insoumise
          propositions:
          - Jean-Luc Mélenchon
          - Manon Aubry
          - Adrien Quatennens
          - Caroline Fiat
          - François Ruffin
          - Danièle Obono
          - Jean-Hughes Ratenon
          - Clémentine Autain
          - Ugo Bernalicis
          - Charlotte Girard
          - Charles Pasqua
          - …
          mentions:
          - Insuffisant
          - Passable
          - Bien
          - Très Bien
          - Excellent
          accès: privé
          """
        Alors Jean-Luc devrait réussir
           Et Jean-Luc affiche la transaction
        Quand Marianne tente de voter sur le scrutin de "La Primaire 2022 de la France Insoumise":
          """
          Jean-Luc Mélenchon: Très Bien
          """
        Alors Marianne devrait échouer
           Et Jean-Luc ne devrait avoir aucune invitation
        Quand Jean-Luc génère 10 invitations pour le scrutin de "La Primaire 2022 de la France Insoumise"
        Alors Jean-Luc devrait réussir
           Et Jean-Luc devrait avoir 10 invitations
        # …
        # Au choix!
        Quand Marianne accepte l'invitation N°1 de Jean-Luc
        Quand Marianne tente de voter sur le scrutin de "La Primaire 2022 de la France Insoumise":
          """
          Jean-Luc Mélenchon: Très Bien
          """
        Alors Marianne devrait réussir
#        Quand Jean-Luc donne à Marianne l'invitation N°1
        # …
#        Quand Marianne tente de voter sur ce scrutin avec l'invitation N°1 de Jean-Luc:
#        """
#        Jean-Luc Mélenchon: Très Bien
#        """


Scénario: Limiter le nombre d'invitations générables (cent? mille?)
  Étant donné un citoyen nommé Jean-Luc
           Et Jean-Luc crée un scrutin comme suit:
          """
          sujet: La Primaire FI 2022
          propositions:
          - Jean-Luc Mélenchon
          - Manon Aubry
          - Adrien Quatennens
          - Caroline Fiat
          - François Ruffin
          - Danièle Obono
          - Jean-Hughes Ratenon
          - Clémentine Autain
          - Ugo Bernalicis
          - Charlotte Girard
          mentions:
          - Insuffisant
          - Passable
          - Bien
          - Très Bien
          - Excellent
          accès: privé
          """
        Quand Jean-Luc génère dix invitations pour le scrutin de "La Primaire FI 2022"
        Alors Jean-Luc devrait réussir
           Et Jean-Luc devrait avoir dix invitations
        Quand Jean-Luc génère cent invitations pour le scrutin de "La Primaire FI 2022"
        Alors Jean-Luc devrait réussir
         Mais Jean-Luc devrait avoir cent invitations
        # Car les dix premières invitations sont les mêmes
        Quand Jean-Luc génère deux cent invitations pour le scrutin de "La Primaire FI 2022"
        Alors Jean-Luc devrait réussir
         Mais Jean-Luc ne devrait avoir que cent invitations



Scénario: Participer à un scrutin par invitation
Scénario: Distribuer des invitations à un scrutin
Scénario: Échouer à participer à un scrutin par invitation

#Fonctionnalité: Création d'un compte
#
#En tant que visiteur, lorsque je participe à un scrutin.
#Il m'est proposé de créer un compte.
#
#---->Si je crée mon compte après la soumission d'un vote, il m'est proposé de lier mon vote à mon compte.
#
#
#Fonctionnalité: Dépouillement


