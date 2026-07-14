- [ ] take a look at nvim `:help write-compiler-plugin` --> different ways to utilize quickfix lists

- [ ] take a look at these tool calls claude seems to make every time i call /implement. could this be compacted?

```
Bash gh issue list --state open --limit 50 2>&1 | head -60
Bash git remote -v 2>&1; echo "---BRANCH---"; git branch --show-current; echo "---STATUS---"; git status --short
Bash gh issue view 1 2>&1
Bash gh issue view 4 2>&1
Bash gh issue view 3 --json number,title,state,labels 2>&1
Bash for n in 5 6 7; do echo "=== ISSUE #$n ==="; gh issue view $n --json number,title,labels,body -q '.number, .title, (.labels|map(.name)|join(",")), .body' 2>&1; echo; done
Bash git log --oneline origin/main -5 2>&1; echo "---"; git log --oneline main -5 2>&1; echo "--- feat/session-store vs main ---"; git rev-list --count main..feat/session-store 2>&1; echo "commits ahead of main"; echo "--- PRs ---"; gh pr list --state all --limit 10 2>&1
Bash git fetch origin 2>&1; echo "--- origin/main log ---"; git log --oneline origin/main -6 2>&1; echo "--- is feat/session-store merged into origin/main? ---"; git branch -r --contains feat/session-store 2>&1 | head; echo "--- local main vs origin/main ---"; git rev-list --count main..origin/main 2>&1
Bash git checkout main 2>&1 && git merge --ff-only origin/main 2>&1; echo "--- tree of src ---"; find src -type f 2>/dev/null | sort; echo "--- test files ---"; find . -path ./node_modules -prune -o -name '*.test.ts*' -print 2>/dev/null | sort
Read null
Read null
Read null
Read null
Read null
Read null
Bash cat docs/adr/0001-abs-api-client-architecture.md 2>&1 | head -120
Bash grep -n "auth/refresh\|x-refresh-token\|refreshToken\|accessToken" src/types/abs-api.d.ts | head -40
Read null
Bash grep -n "postAuthRefresh" src/types/abs-api.d.ts
Read null
Read null
Bash grep -n "LoginResponse:" src/types/abs-api.d.ts
```
