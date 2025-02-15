#!/bin/bash
# decay mycelium.alifeee.net

file="index.html"
decay_number=10

echo ""
date

git status

echo "all things must decay"

echo "especially ${file}"

chars=$(cat "${file}" | wc -c)

if [[ $chars -gt 32767 ]]; then
  echo "more characters (>32767) than \$RANDOM supports!"
  exit 1
fi

for i in `seq 1 ${decay_number}`; do
    chars=$(cat "${file}" | wc -c)
    printf " chars: ${chars}"
    if [[ $chars -lt 10 ]]; then
      echo "refusing to cut lower than 10 characters"
      exit 1
    fi
    remove=$(($RANDOM % chars))
    range="-$(($remove-1)),$(($remove+1))-"
    printf " … cutting $range"

    cat index.html | cut -z -c "${range}" | sponge index.html

    echo " … cut from ${file} :]"
done | column -s"…" -t

git add index.html
git commit -m "all things must decay"
GIT_SSH_COMMAND="ssh -i ./keycelium" git push

echo "done, maybe"
