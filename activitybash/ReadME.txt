Classico BASH

./github-activity.sh <username>

esempio

./github-activity.sh dbehelitate


ALTERNATIVA
gh api users/nilbuild/events --jq '.[:10] | .[] | if .type == "PushEvent" then "- Pushed " + (.payload.commits | length | tostring) + " commit(s) to " + .repo.name elif .type == "IssuesEvent" then "- " + (.payload.action | ascii_upcase[0:1] + .payload.action[1:]) + " an issue in " + .repo.name elif .type == "WatchEvent" then "- Starred " + .repo.name elif .type == "ForkEvent" then "- Forked " + .repo.name elif .type == "CreateEvent" then "- Created " + .payload.ref_type + " in " + .repo.name else "- " + (.type | sub("Event$"; "")) + " in " + .repo.name end'


SET ALIAS:

gh alias set gossip-activity 'api users/$1/events --jq ".[:10] | .[] | if .type == \"PushEvent\" then \"- Pushed \" + (.payload.commits | length | tostring) + \" commit(s) to \" + .repo.name elif .type == \"IssuesEvent\" then \"- \" + (.payload.action | ascii_upcase[0:1] + .payload.action[1:]) + \" an issue in \" + .repo.name elif .type == \"WatchEvent\" then \"- Starred \" + .repo.name elif .type == \"ForkEvent\" then \"- Forked \" + .repo.name elif .type == \"CreateEvent\" then \"- Created \" + .payload.ref_type + \" in \" + .repo.name else \"- \" + (.type | sub(\"Event$\"; \"\")) + \" in \" + .repo.name end"'

ALIAS:
gh gossip-activity nilbuild





