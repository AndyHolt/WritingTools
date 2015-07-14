#! /bin/zsh

echo "Setting up for sermon in directory $PWD."
projectname=`basename "$PWD"`

## Not needed when adharticle is installed
# echo "Getting adharticle class..."
# ln -s ~/Projects/LaTeXClasses/adharticle.cls $PWD/.
# ln -s ~/Projects/LaTeXClasses/adhsymbols.sty $PWD/.
# echo "Done"

echo "Copying Makefile..."
cp ~/Projects/WritingTools/SermonMakefile $PWD/Makefile
echo "Editing Makefile..."
sed -i "s#myfile#$projectname#gi" Makefile
echo "Done"

echo "Copying Guardfile..."
cp ~/Projects/WritingTools/SermonGuardfile $PWD/Guardfile
echo "Editing Guardfile"
sed -i "s#myfile#$projectname#gi" Guardfile
echo "Done"

echo "Creating user files"
# touch $projectname.md
make touch
echo "Done"

echo "Project setup complete."
