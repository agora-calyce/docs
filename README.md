# Documentation de la console d'Agora Calyce

Documentation des bonnes pratiques et procédures pour les déploiements et migrations sur la console d'Agora Calyce.

Documentation et guide d'utilisation pour la [console d'Agora Calycé](https://console.agoracalyce.net), créer par [Zensical](https://zensical.org/)

## Developpement

```bash
python3 -m venv .venv
source .venv/bin/activate # or .venv\Scripts\activate on Windows
pip install zensical
zensical build -f zensical.toml
zensical serve -f zensical.toml # serve at http://localhost:8000
```

## Configuration

Le site est configuré en utilisant le fichier de configuration `zensical.toml`.