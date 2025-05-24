read -p "Commit message: " commit
git add .
git commit -am "$commit"
git push
