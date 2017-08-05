# Unify Archivo family vertical metrics

rm -r ../fonts
mkdir ../fonts

ALLFONTS=$(ls ./*.ttf)

cp -R $ALLFONTS ../fonts

cd ../fonts
ALLFONTS=$(ls ./*.ttf)


echo "Updating vertical metrics"
for font in $ALLFONTS
do  
    fontbakery fix-vertical-metrics -a=878 -d=-210 -l=0 -aw=1035 -dw=312 $font 
done


# replace .ttf --> .ttf.fix 
rm -R *.ttf
ALLFONTS=$(ls *.ttf.fix)
for font in $ALLFONTS
do
    mv $font "${font%.*}"
done

NORMALFONTS=$(ls Archivo-*)
NARROWFONTS=$(ls ArchivoNarrow-*)
BLACKFONTS=$(ls ArchivoBlack-*)


echo "Updating version numbers"
# Update Archivo
for font in $NORMALFONTS
do
    fontbakery update-version $font 1.002 1.003
done

# Update Archivo Narrow
for font in $NARROWFONTS
do
      fontbakery update-version $font 1.009 1.010
done  

# Update Archivo Black
for font in $BLACKFONTS
do
      fontbakery update-version $font 1.005 1.006
done  
echo done!


# replace .ttf.fix --> .ttf
rm -R *.ttf
ALLFONTS=$(ls *.ttf.fix)
for font in $ALLFONTS
do
    mv $font "${font%.*}"
done
