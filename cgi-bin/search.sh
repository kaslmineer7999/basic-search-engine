#!/usr/bin/bash
#Author: kaslmineer7999
db="../db.txt"
q="${QUERY_STRING#q=*}"
q="$(busybox httpd -d "$q")"
echo -e "Content-type: text/html\n\n"
echo "<h1>search results for \"$q\"</h1>
<form action=\"/cgi-bin/search.sh\" method=\"GET\"><input type=\"text\" name=\"q\" placeholder=\"enter search query here....\" value=\"$q\"><br><button type=\"submit\">search</button></form>"
for result in $(grep "$q" "$db")
do echo "<h2><a href=\"$(echo "$result"|cut -d\| -f2)\">$(echo "$result"|cut -d\| -f1)</a></h2>"
done
