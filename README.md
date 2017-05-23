# README

## Installation

```
$ git clone git@github.com:ComicScrip/Projet-IPW.git
$ cd marx-manager
$ bundle install
```

#### Mise en place des variables d'environnement
Creer un fichier `config/local_env.yml` avec le contenu suivant :
```
# Identifiants Gmail qui seront utilisés pour l'envoi de mails à partir de l'application
MAILER_GMAIL_ACCOUNT : <VOTRE ADRESSE GMAIL>
MAILER_GMAIL_PASSWORD : <VOTRE MOT DE PASSE GMAIL>

```


### (Optionel) Avec Docker et  `docker-compose` :

#### Mise en place de la base de données Postgres
```
$ docker-compose run app rake db:create && docker-compose run app rake db:migrate
```

#### Mise en place des variables d'environnement
Créer un fichier `mailer_env.conf` à la racine du projet et le remplir avec vos
identifiants gmail.
```
MAILER_GMAIL_USERNAME=<VOTRE ADRESSE GMAIL>
MAILER_GMAIL_PASSWORD=<VOTRE MOT DE PASSE GMAIL>
```

#### Démarrage de l'application
```
$ docker-compose start
```



## Membres du groupe
+ Loïc Souverain
+ Simon Wietrich
