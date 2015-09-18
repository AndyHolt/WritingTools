#! /bin/zsh

echo "Setting up for article writing in directory $PWD."

# ensure WritingTools directory exists, else error and exit
if [[ -d ~/Projects/WritingTools ]]; then
    WTS=~/Projects/WritingTools
else
    echo "Directory ~/Projects/WritingTools not found. Aborting." 1>&2
    exit 1
fi

projectname=`basename "$PWD"`

# get operating system type
# different sed syntax for linux and mac
if [[ `uname` == 'Linux' ]]; then
    export LINUX=1
else
    export LINUX=0
fi
if [[ `uname` == 'Darwin' ]]; then
    export OSX=1
else
    export OSX=0
fi

## Not needed when adharticle is installed
# echo "Getting adharticle class..."
# ln -s ~/Projects/LaTeXClasses/adharticle.cls $PWD/.
# ln -s ~/Projects/LaTeXClasses/adhsymbols.sty $PWD/.
# echo "Done"

echo "Getting Theology.bib..."
ln -s $WTS/Theology.bib $PWD/.
echo "Done"

echo "Copying Makefile..."
cp $WTS/ArticleMakefile $PWD/Makefile
echo "Editing Makefile..."
if [[ $LINUX -eq 1 ]]; then
    sed -i "s#myfile#$projectname#gi" Makefile
    sed -i 's#mybib#Theology#gi' Makefile
elif [[ $OSX -eq 1 ]]; then
    sed -i '' -e "s#myfile#$projectname#g" Makefile
    sed -i '' -e 's#mybib#Theology#g' Makefile
fi
echo "Done"

echo "Copying Guardfile..."
cp $WTS/ArticleGuardfile $PWD/Guardfile
echo "Editing Guardfile"
if [[ $LINUX -eq 1 ]]; then
    sed -i "s#myfile#$projectname#gi" Guardfile
elif [[ $OSX -eq 1 ]]; then
    sed -i '' -e "s#myfile#$projectname#g" Guardfile
fi
echo "Done"

echo "Copying markdownlint style file"
cp $WTS/article.rb $PWD/article.rb
echo "Done"

echo "Create markdown file"
# touch $projectname.md
make touch
echo "Done"

echo "Project setup complete."
