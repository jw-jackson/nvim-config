#!bin/bash
prehomepath=`cat prehomepath`
rm prehomepath

abstempdir=`mktemp -d -p $HOME`

mv share.tar.gz $abstempdir/
mv config.tar.gz $abstempdir/

date=`date +"%m%d%H%M"`
cd $abstempdir

tar -xzf config.tar.gz
mv ~/.config/nvim ~/.config/nvim.bak$date
mv nvim ~/.config/nvim


tar -xzf share.tar.gz
mv ~/.local/share/nvim ~/.local/share/nvim.bak$date
mv nvim ~/.local/share/

cd ~/.local/share/nvim

list=`find . -type l`
for file in $list
do
    srcpath=`readlink $file`
    #echo $srcpath
    if ( echo $srcpath | grep -Eq "^/" )
    then
        #newpath=${srcpath/$prehomepath/$HOME}
        newpath=`echo $srcpath | sed "s|$prehomepath|$HOME|g"`
        echo $newpath
        rm $file
        ln -s $newpath $file
    fi
done
cd ~

rm -rf $abstempdir

