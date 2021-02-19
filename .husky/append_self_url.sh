#!/bin/zsh
# origin	git@gecgithub01.walmart.com:wren1/git-hooks-demo.git (fetch)
echo "test"
repo_url=`git remote -v | grep "origin" | grep "(fetch)" | cut -f2 -d"@" | cut -f1 -d" "| tr : /`
repo_url=https://${repo_url}
echo ${repo_url}
git status --porcelain | grep -v '^[ |??]' | sed -e 's/[A-Z] *//' | grep -E ".txt$|.js$" | while read line; do
  file_url=${repo_url}/$line
  exist_count=`grep "${file_url}" $line | wc -l | xargs`
  echo ${exist_count}
  if [ ${exist_count} = "0" ]; then
    echo "inside if"
    echo -e "\n"${file_url} >> $line;
    git add $line
  fi
done