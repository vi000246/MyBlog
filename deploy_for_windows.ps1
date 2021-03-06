# 把副檔名為.bak的檔清掉
Get-ChildItem -Path (Get-Location).path -Include *.bak -File -Recurse | foreach { $_.Delete()}

# Build the project.
# 要將hugo.exe放在c槽底下
set-alias -name hugo C:\hugo\hugo.exe

hugo

# Go to public directory.

Set-Location .\public

# Add changes to git.

git add .

# Create a commit message.

$dateTime = Get-Date -format "yyyy-MM-dd HH:mm:ss K"
$commitMsg = "Site updated: ${dateTime}"

# Commit.

git commit -m $commitMsg

# Push source and build repos.

git push origin master

# Come back to the project root.

Set-Location .\..

git add .

git commit -m $commitMsg

git push origin master

Write-Host "The web page has been updated!" -ForegroundColor "Cyan"