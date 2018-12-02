# REFS: http://unageanu.hatenablog.com/entry/20081009/1223549984

files="./*"

# NOTE: Create insertion file
touch trainval.txt

# NOTE: Get all data in current directory
for filepath in $files; do
  if [ -d $filepath ] ; then
    for i in $filepath; do
      for file in `\find $i -maxdepth 1 -name '*.*'`; do
          path=$(basename ${file})
          name=${path%.*}
          echo $name >> trainval.txt
      done
    done
  fi
done
