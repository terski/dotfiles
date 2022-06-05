#!/bin/sh

WHEN=""
for arg in "$@"
do
  case $arg in
    -t|--tomorrow)
      WHEN="-v +1d"
      ;;
  esac
done

TMP=`mktemp`
echo "## `date $WHEN '+%a %b %d, %Y'`" > $TMP
cat << 'EOF' >> $TMP

| In bed | Asleep | Woke up | Out of bed |
| ------ | ------ | ------- | ---------- |
|        |        |         |            |

### Priorities

1. 

### What am I doing?

| When | What | Feeling |
| ---- | ---- | ------- |
| 10am |      |         |
| 1pm  |      |         |
| 4pm  |      |         |

### Notes

- 


EOF

cat $TMP | pbcopy
rm $TMP
