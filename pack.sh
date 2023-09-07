#/bin/bash
abstempdir=`mktemp -d -p $HOME`
cp unpack.sh $abstempdir/
cd ~
cd .config
tar -czf config.tar.gz ./nvim
mv config.tar.gz $abstempdir/

cd ~
cd .local/share
tar -czf share.tar.gz ./nvim
mv share.tar.gz $abstempdir/
echo "---"
cd $abstempdir
touch prehomepath
echo $HOME > prehomepath

tar -czf neovim.tar.gz config.tar.gz config.tar.gz share.tar.gz prehomepath unpack.sh
mv neovim.tar.gz ~/

cd ~
rm -rf $abstempdir

