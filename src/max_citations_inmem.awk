#!/usr/bin/env awk

# This awk program finds the maximum citations a paper has and prints the id, name and authors details of the paper.

BEGIN{ 
    FS="qwqw"
    dosort="LC_ALL=C sort -n -k2"
}

$8>50000 && $8 !~ /null/{
    a[$1] = $8
}

END{
    for (key in a)
        print key ,a[key] |& dosort
    
    close(dosort, "to")

    while ((dosort |& getline line) > 0)
        print line

    close(dosort)
}
