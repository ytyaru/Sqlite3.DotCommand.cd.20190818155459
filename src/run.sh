SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

# テスト用ファイル作成
mkdir -p ./sql/create
mkdir -p ./sql/insert
echo "create table T(C text);" > ./sql/create/T.sql
echo "insert into T values('A');" > ./sql/insert/T.sql

# SQLファイル作成
echo ".cd ./sql
.read ./create/T.sql
.read ./insert/T.sql
select * from T;" > 0.sql

# SQLファイル実行
for path in `ls -1 | grep .sql | sort`; do
	echo $path
	sqlite3 :memory: < $path
done

