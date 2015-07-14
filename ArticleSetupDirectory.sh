#! /bin/zsh

echo "Setting up for article writing in directory $PWD."
projectname=`basename "$PWD"`

## Not needed when adharticle is installed
# echo "Getting adharticle class..."
# ln -s ~/Projects/LaTeXClasses/adharticle.cls $PWD/.
# ln -s ~/Projects/LaTeXClasses/adhsymbols.sty $PWD/.
# echo "Done"

echo "Getting Theology.bib..."
ln -s ~/Projects/WritingTools/Theology.bib $PWD/.
echo "Done"

echo "Copying Makefile..."
cp ~/Projects/WritingTools/ArticleMakefile $PWD/Makefile
echo "Editing Makefile..."
sed -i "s#myfile#$projectname#gi" Makefile
sed -i 's#mybib#Theology#gi' Makefile
echo "Done"

echo "Copying Guardfile..."
cp ~/Projects/WritingTools/ArticleGuardfile $PWD/Guardfile
echo "Editing Guardfile"
sed -i "s#myfile#$projectname#gi" Guardfile
echo "Done"

echo "Create markdown file"
# touch $projectname.md
make touch
echo "Done"

echo "Project setup complete."
