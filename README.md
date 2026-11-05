# Documentation de la console Agora Calyce

Documentation et guides d'utilisation de la [console Agora Calyce](https://console.agoracalyce.com), générée avec [Zensical](https://zensical.org/).

Site publié : <https://docs.agoracalyce.net>

## Développement local

Avec Docker :

```bash
make serve      # sert le site sur http://localhost:8000
make build      # build le site dans site/ (échoue en cas d'avertissement)
make lint-md    # vérifie le formatage Markdown
make format-md  # corrige le formatage Markdown
```

Sans Docker :

```bash
python3 -m venv .venv
source .venv/bin/activate  # .venv\Scripts\activate sous Windows
pip install zensical
zensical serve             # sert le site sur http://localhost:8000
```

## Ajouter ou modifier une page

1. Créer ou modifier le fichier Markdown sous `docs/`.
2. Pour une nouvelle page, l'ajouter dans `nav` du fichier `zensical.toml`.
3. Vérifier le rendu avec `make serve`, puis `make lint-md` et `make build`.

Voir [CONTRIBUTING.md](CONTRIBUTING.md) pour plus de détails.

## Structure

- `docs/` : contenu de la documentation (Markdown, images)
- `overrides/` : surcharges du thème (bandeau d'annonce)
- `zensical.toml` : configuration du site et navigation
