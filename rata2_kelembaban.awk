#!/usr/bin/awk -f

NR > 1 {
    total += $3
    count++
}
END {
    print "Rata-rata kelembaban:", total / count
}
