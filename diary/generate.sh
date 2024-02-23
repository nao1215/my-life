#!/bin/bash

YEAR=2024

mkdir -p ${YEAR}

touch ${YEAR}/README.md
echo "# ${YEAR}" >>${YEAR}/README.md

for month in {01..12}; do
    mkdir -p "${YEAR}/$month"
    for day in {01..31}; do
        date="${YEAR}$month$day"
        if date -d "$date" >/dev/null 2>&1; then
            filename="${YEAR}/$month/$date.md"
            touch "$filename"
            echo "# $date" >>"$filename"
            prev_date=$(date -d "$date -1 day" +%Y%m%d)
            next_date=$(date -d "$date +1 day" +%Y%m%d)
            echo -e "[前の日]($prev_date.md) | [次の日]($next_date.md)" >>"$filename"
            echo "- [$date]($month/$date.md)" >>${YEAR}/README.md
        fi
    done
done
