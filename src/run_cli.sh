SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# テスト用ファイル作成
mkdir -p ./sql/create
mkdir -p ./sql/insert
echo "create table T(C text);" > ./sql/create/T.sql
echo "insert into T values('A');" > ./sql/insert/T.sql

# .cd実行
sqlite3 :memory: \
".cd ./sql" \
".read ./create/T.sql" \
".read ./insert/T.sql" \
"select * from T;"

