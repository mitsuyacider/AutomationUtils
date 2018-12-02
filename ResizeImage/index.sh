# REFS: http://unageanu.hatenablog.com/entry/20081009/1223549984

files="./*"

# NOTE: Set width
fixWidth=640

for filepath in $files; do
  if [ -d $filepath ] ; then
    for i in $filepath; do
      dir=$i"/resized"; [ ! -e $dir ] && mkdir -p $dir
      # NOTE: Pay attention to the file extention
      for file in `\find $i -maxdepth 1 -name '*.jpg'`; do
          name=$(basename ${file})
          output=$dir"/"$name
          # NOTE: Resize the file size, keeping the aspect ratio.
          ffmpeg -i ${file} -vf "scale="$fixWidth":-1" -q 2 $output
      done
    done
  fi
done
