#! /bin/sh

if [ "$TRAVIS_BRANCH" = "master" ] && [ "$GH_TOKEN" ]; then
  CI_ENV=/dev/ ./node_modules/.bin/cooking build -c build/cooking.demo.js
  mkdir temp_web
  cd temp_web
  git clone https://$GH_TOKEN@github.com/ElementUI/dev.git && cd dev
  git config user.name "travis"
  git config user.email "travis"
  rm -rf *
  cp -rf ../../examples/element-ui/** .
  git add -A .
  git commit -m "$TRAVIS_COMMIT"
  git push origin master
fi
