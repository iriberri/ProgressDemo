#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"
}

commit_website_files() {
  git add .
  git commit -m "Travis build"
}

upload_files() {
  #git remote add origin "https://${GH_TOKEN}@github.com/PawanAhire/ProgressDemo.git"
  #git remote -v
  git push -u origin master
  #git push -d release latest
}

setup_git
commit_website_files
upload_files
