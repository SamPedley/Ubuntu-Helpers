#!/bin/bash

read -p -r "What's your projects name? " NAME
#Create the right folders
mkdir -p ~/projects/"${NAME}"
mkdir -p /var/www/"${NAME}"/public
cd ~/projects/"${NAME}" || exit

#Create an empty git folder
git init

HOOK=~/projects/"${NAME}"/.git/hooks/post-commit
#create the post-commit hook
touch "${HOOK}"
echo "#!/bin/bash" >> "${HOOK}"
echo "unset GIT_INDEX_FILE" >> "${HOOK}"
echo "git --work-tree=/var/www/${NAME}/public --git-dir=~/projects/${NAME}/.git checkout -f" >> "${HOOK}"

# Allow the commit hook to write 
chmod +x "${HOOK}"
echo "-----------------------------"
echo "Push to this url :"
IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
echo "${USER}@${IP}:projects/${NAME}"
