#! /bin/bash

read -p 'New repo name: ' reponame
read -p 'GitHub Username: ' user

curl -s -u "$user" https://api.github.com/user/repos -d "{\"name\":\"$reponame\"}" > /dev/null

echo "# $reponame" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:$user/$reponame.git
git push -u origin master
