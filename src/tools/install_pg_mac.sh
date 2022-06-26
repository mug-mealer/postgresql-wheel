if [[ $1 =~ refs/tags/([0-9]+\.[0-9]+).*$ ]];
then
    VERSION=${BASH_REMATCH[1]}
    echo "Building ${VERSION}"
else
    VERSION=13.4
fi

curl -L -o postgresql-14.4-1-osx-binaries.zip https://sbp.enterprisedb.com/getfile.jsp?fileid=1258117
unzip -q postgresql-14.4-1-osx-binaries.zip
for dirname in bin lib include share; do
  mv  -v ./pgsql/$dirname ./src/postgresql/
done