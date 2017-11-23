elm make "src/Main.elm" --output app.js

$publishDir = './publish'

Remove-Item $publishDir -Recurse
New-Item -Path $publishDir -ItemType Directory

@(  
    './img/';
    './app.js';
    './index.html';
    './styles.css';
) | Copy-Item -Destination $publishDir -Recurse -Force

Set-Location $publishDir

git init
git checkout -b gh-pages
git remote add origin https://github.com/ian-moore/spacebear.git
git add .
git commit -m "publish"
git push -f origin gh-pages

Set-Location '..'
