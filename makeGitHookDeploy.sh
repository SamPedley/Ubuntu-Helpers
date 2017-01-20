#!/bin/bash

read -p "What's your projects name? " name
#Create the right folders
mkdir -p ~/projects/$name
mkdir -p /var/www/$name/public
cd ~/projects/$name

#Create an empty git folder
git init

#create the post-commit hook
touch ~/projects/$name/.git/hooks/post-commit
echo "#!/bin/bash" >> ~/projects/$name/.git/hooks/post-commit
echo "unset GIT_INDEX_FILE" >> ~/projects/$name/.git/hooks/post-commit
echo "git --work-tree=/var/www/${name}/public --git-dir=~/projects/${name}/.git checkout -f" >> ~/projects/$name/.git/hooks/post-commit

# Allow the commit hook to write 
chmod +x ~/projects/$name/.git/hooks/post-commit
echo "-----------------------------"
echo "Push to this url :"
ExternialIp=`dig +short myip.opendns.com @resolver1.opendns.com`
echo "${USER}@${ExternialIp}:projects/${name}"
