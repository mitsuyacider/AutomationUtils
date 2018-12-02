files="./*"

# NOTE: Get all data in current directory
for filePath in $files; do
  # NOTE: Extrude only directories
  if [ -d $filePath ] ; then
    for i in $filePath; do
      for file in `\find $i -maxdepth 1 -name '*.xml'`; do
        base=${file%.*}
        replaceFile=$base".xml"
        sed -i -e '3s/\([0-9]\{4\}\)/\1.jpg/g' $replaceFile

        # NOTE: Delete xml-e file which is created after replacing.
        deleteFile=$base".xml-e"
        rm -f $deleteFile
      done
    done
  fi
done
