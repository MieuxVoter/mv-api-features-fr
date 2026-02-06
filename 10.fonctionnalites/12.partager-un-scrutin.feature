#language: fr
@fr
Fonctionnalité: Partager un scrutin au jugement majoritaire
  Dans le but de décider collectivement
  En tant que collectif démocratique connecté
  Nous souhaitons partager un scrutin au jugement majoritaire



Scénario: Partager un lien court
  Étant donné un visiteur nommé Pierre-Louis
  Étant donné un scrutin au jugement majoritaire comme suit:
          """
          uuid: 6d95c98b-771a-4495-b9f8-75f88d090435
          slug: scrutin-securite
          sujet: La sécurité des scrutins
          propositions:
            - Par session
            - Par invitation seulement
          mentions:
            - Pas sécurisé
            - Peu sécurisé
            - Assez sécurisé
            - Très sécurisé
          """
        Alors il devrait maintenant y avoir un scrutin au jugement majoritaire dans la base de données
           Et le scrutin intitulé "La sécurité des scrutins" devrait avoir deux propositions
           Et le scrutin intitulé "La sécurité des scrutins" devrait avoir quatre mentions
        Quand Pierre-Louis tente de voir le scrutin identifié "6d95c98b-771a-4495-b9f8-75f88d090435"
        Alors Pierre-Louis devrait réussir
        Quand Pierre-Louis tente de voir le scrutin identifié "6d95c98b"
        Alors Pierre-Louis devrait réussir
        Quand Pierre-Louis tente de voir le scrutin identifié "6d9-5c9-8b"
        Alors Pierre-Louis devrait réussir
        Quand Pierre-Louis tente de voir le scrutin identifié "6d9-5c-98b"
        Alors Pierre-Louis devrait réussir
        Quand Pierre-Louis tente de voir le scrutin identifié "scrutin-securite"
        Alors Pierre-Louis devrait réussir
        Quand Pierre-Louis tente de voir le scrutin identifié "00000000"
        Alors Pierre-Louis devrait échouer


Scénario: Générer un QR code pour un scrutin public
  Étant donné un citoyen nommé Organisateur
           Et un scrutin au jugement majoritaire comme suit:
          """
          uuid: a1b2c3d4-e5f6-7890-abcd-ef1234567890
          slug: scrutin-qr-public
          sujet: Scrutin avec QR code public
          propositions:
            - Choix A
            - Choix B
          mentions:
            - Non
            - Oui
          accès: public
          """
        Quand Organisateur génère un QR code pour le scrutin "Scrutin avec QR code public"
        Alors Organisateur devrait réussir
           Et le QR code devrait contenir l'URL du scrutin
           Et le QR code devrait être une image valide au format PNG ou SVG
           Et le QR code devrait pointer vers le scrutin identifié "a1b2c3d4-e5f6-7890-abcd-ef1234567890"


Scénario: Générer un QR code avec lien court
  Étant donné une citoyenne nommée Organisatrice
           Et un scrutin au jugement majoritaire comme suit:
          """
          uuid: b2c3d4e5-f6a7-8901-bcde-f12345678901
          slug: qr-court
          sujet: QR avec lien court
          propositions:
            - Option X
            - Option Y
          mentions:
            - Non
            - Oui
          """
        Quand Organisatrice génère un QR code avec lien court pour le scrutin "QR avec lien court"
        Alors Organisatrice devrait réussir
           Et le QR code devrait contenir l'URL raccourcie "qr-court"
           Et le QR code devrait permettre d'accéder au scrutin


Scénario: Scanner un QR code pour accéder à un scrutin
  Étant donné un scrutin au jugement majoritaire comme suit:
          """
          uuid: c3d4e5f6-a7b8-9012-cdef-123456789012
          slug: scrutin-scannable
          sujet: Scrutin accessible par QR
          propositions:
            - Candidat A
            - Candidat B
          mentions:
            - Non
            - Oui
          """
           Et un QR code généré pour le scrutin "Scrutin accessible par QR"
           Et un visiteur nommé Scanner
        Quand Scanner scanne le QR code
        Alors Scanner devrait être redirigé vers le scrutin "Scrutin accessible par QR"
           Et Scanner devrait pouvoir voir les détails du scrutin


Scénario: Générer un QR code pour un scrutin privé avec invitation
  Étant donné un citoyen nommé Organisateur
           Et Organisateur crée un scrutin comme suit:
          """
          sujet: Scrutin privé avec QR
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Non
            - Oui
          accès: privé
          """
           Et Organisateur génère 10 invitations pour le scrutin de "Scrutin privé avec QR"
        Quand Organisateur génère un QR code pour l'invitation N°1
        Alors Organisateur devrait réussir
           Et le QR code devrait contenir le lien d'invitation unique
           Et le QR code devrait permettre à un participant d'accepter l'invitation et de voter


Scénario: Télécharger un QR code dans différents formats
  Étant donné une citoyenne nommée Organisatrice
           Et un scrutin au jugement majoritaire comme suit:
          """
          sujet: Scrutin multi-format
          propositions:
            - Option 1
            - Option 2
          mentions:
            - Non
            - Oui
          """
        Quand Organisatrice génère un QR code au format PNG pour le scrutin "Scrutin multi-format"
        Alors Organisatrice devrait réussir
           Et le fichier devrait être une image PNG valide
        Quand Organisatrice génère un QR code au format SVG pour le scrutin "Scrutin multi-format"
        Alors Organisatrice devrait aussi réussir
           Et le fichier devrait être une image SVG valide
