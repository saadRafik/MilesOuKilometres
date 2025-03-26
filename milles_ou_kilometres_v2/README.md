
# 📏 Miles ou Kilomètres

Une application Flutter simple permettant de convertir des distances entre **miles** et **kilomètres**, avec une interface claire et responsive. Ce projet est compatible avec l'exécution **web**, mais ne fonctionne actuellement pas sur un émulateur Android à cause d’un souci Gradle (voir détails plus bas).

---

## 🚀 Fonctionnalités

- Conversion instantanée entre miles et kilomètres.
- Interface utilisateur minimaliste.
- Compatible avec le Web via Flutter.
- Code entièrement écrit en Dart avec le framework Flutter.

---

## 📁 Structure du projet

```
MilesOuKilometres/
├── android/              # Configuration Android (ne fonctionne pas pour l’instant)
├── assets/               # Répertoires pour ressources (images, etc.)
├── ios/                  # Configuration iOS
├── lib/
│   └── main.dart         # Fichier principal de l'application
├── test/                 # Tests unitaires
├── web/                  # Support pour l’exécution web
├── pubspec.yaml          # Dépendances et métadonnées
└── ...
```

---

## ⚙️ Prérequis

Avant de lancer le projet, assure-toi d’avoir :

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installé (version 3.13+ recommandée)
- Dart SDK
- Un éditeur comme VS Code ou Android Studio
- Un navigateur compatible Web (Chrome, Edge, etc.)

---

## ▶️ Exécution Web

L’application fonctionne parfaitement sur navigateur. Voici comment l'exécuter :

### 1. Cloner le projet

```bash
git clone <https://github.com/saadRafik/MilesOuKilometres.git>
cd MilesOuKilometres
```

### 2. Installer les dépendances

```bash
flutter pub get
```

### 3. Lister les appareils disponibles

```bash
flutter devices
```

Assure-toi que `Chrome` ou un autre navigateur est listé.

### 4. Lancer l'application dans le navigateur

```bash
flutter run -d chrome
```

---

## ⚠️ Problème avec l'émulateur Android

L’exécution via un émulateur Android ne fonctionne pas actuellement. Voici l’erreur rencontrée :

```bash
FAILURE: Build failed with an exception.

* Where:
  Settings file '.../settings.gradle.kts' line: 19

* What went wrong:
  Plugin [id: 'com.android.application', version: '8.7.0', apply: false] was not found in any of the following sources:
  
  - Gradle Core Plugins (plugin is not in 'org.gradle' namespace)
  - Included Builds (No included builds contain this plugin)
  - Plugin Repositories (could not resolve plugin artifact 'com.android.application:com.android.application.gradle.plugin:8.7.0')
    Searched in the following repositories:
      Google
      MavenRepo
      Gradle Central Plugin Repository

BUILD FAILED in 1s
```

### 🛠️ Explication

L'erreur provient du fichier `settings.gradle.kts`, qui utilise une version de plugin Gradle (`com.android.application:8.7.0`) introuvable dans les repositories configurés (Google, Maven Central, etc.). Cela empêche l'exécution sur l’émulateur Android.

### 🔧 Solutions potentielles (non implémentées)

- Remplacer le fichier `settings.gradle.kts` par un fichier `settings.gradle` en Groovy.
- Modifier la version du plugin Android (par exemple, `8.1.0` ou `7.4.2`).
- Vérifier la configuration des repositories dans tous les fichiers Gradle.

---

## 📄 Licence

Ce projet est open-source et libre d’utilisation pour les étudiants, les développeurs et les curieux.
