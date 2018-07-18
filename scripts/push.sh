#!/bin/sh

setup_git() {
  git config --global user.email "ahire.pawan@gmail.com"
  git config --global user.name "PawanAhire"
}

commit_website_files() {
  git add .
  git commit -m "Travis build"
}

upload_files() {
  git remote add release "https://${GH_TOKEN}@github.com/PawanAhire/ProgressDemo.git"
  git push -d release latest
  
}

setup_git
commit_website_files
upload_files
