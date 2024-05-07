# /bin/sh

set -e

if [ $# -eq 0 ]; then
    echo "Please provide a CSV filename as an argument."
    exit 1
fi

input_file="$1"

if [ ! -f "$input_file" ]; then
    echo "File '$input_file' does not exist."
    exit 1
fi

filename=$(basename "$input_file" | cut -d. -f1)

output_file="$filename.sqlite"

sqlite3 $output_file << END
.mode csv
.separator ,
DROP TABLE IF EXISTS transactions;
CREATE TABLE "transactions" (
  "transaction Date" DATETIME,
  "post Date" DATETIME,
  "description" TEXT,
  "category" TEXT,
  "type" TEXT,
  "amount" NUM, 
  "memo" TEXT);
.import --skip 1 $1 transactions
.exit
END

echo "imported into $output_file"
