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
MAILER_GMAIL_USERNAME=<YOUR GMAIL ADDRESS>
MAILER_GMAIL_PASSWORD=<YOUR GMAIL PASSWORD>
```

## Membres du groupe

+ Loïc Souverain
+ Simon Wietrich
