#!/bin/bash
# Una sola vez: gh auth login   (elige GitHub.com, HTTPS, login por navegador)
set -e
cd "$(dirname "$0")"
REPO_NAME="simulador-prestamo-cronograma"

if ! gh auth status &>/dev/null; then
  echo "→ Primero inicia sesión en GitHub CLI:"
  echo "    gh auth login"
  exit 1
fi

if git remote get-url origin &>/dev/null; then
  echo "→ Remote ya existe; haciendo push..."
  git push -u origin main
else
  echo "→ Creando repo vquevedor-creator/${REPO_NAME} y subiendo código..."
  gh repo create "$REPO_NAME" --public --source=. --remote=origin --push \
    --description "Simulador cronograma préstamo comercial BBVA"
fi

echo ""
echo "Listo. Activa Pages: repo → Settings → Pages → Deploy from branch → main / (root)"
echo "URL del sitio: https://vquevedor-creator.github.io/${REPO_NAME}/"
