The `windows` and `linux` branches serve each respective OS. The `main` branch serves files common to both.

Both OSes use [chezmoi](https://www.chezmoi.io/). The `chezmoi.toml` for both include `mode = "symlink"`. `chezmoi data` will give the expected path to `chezmoi.toml`.
