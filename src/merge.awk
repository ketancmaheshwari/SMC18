BEGIN {
    FS="qwqw"
}

NR==FNR {
    a[$1]=$2;next
}

$3!=0{
  printf("%sqwqw%s\n", $0,a[$1])
}

$3==0{
  printf("%sqwqwnull\n", $0)
}
