# README

## Installation

### Avec Docker et  `docker-compose` :

#### Création de base de données

```
docker-compose run app rake db:create && docker-compose run app rake db:migrate
```

#### Démarrage de l'application

```
docker-compose start
```

#### Mise en place des variables d'environnement
Créer un fichier `mailer_env.conf` à la racine du projet et le remplir avec vos
identifiants gmail.
```
ASSESSME_GMAIL_ACCOUNT : <votre adresse gmail>
ASSESSME_GMAIL_PASSWORD : <le mot de passe de votre compte>
```

