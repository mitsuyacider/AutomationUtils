# REFS: http://unageanu.hatenablog.com/entry/20081009/1223549984

files="./*"

# NOTE: directory内のコンテンツ一覧を取得する。
for filepath in $files; do
  # NOTE: directoryのみフィルタリング
  if [ -d $filepath ] ; then
    for i in $filepath; do
      # NOTE: 保存用のdirectoryを作成する
      dir=$i"/images"; [ ! -e $dir ] && mkdir -p $dir
      # NOTE: 実行中のファイルに直接上書きすると、正確な秒数で切り取られなかったため、
      #       別ファイルとして保存する（すでにファイルがある場合は強制的に上書き)
      for file in `\find $i -maxdepth 1 -name '*.jpg'`; do
          name=$(basename ${file})
          output=$dir"/"$name
          cp -r $file $output
      done
    done
  fi
done
