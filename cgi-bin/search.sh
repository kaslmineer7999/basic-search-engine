#!/usr/bin/bash
#Author: kaslmineer7999
IFS=$'\n'
db="../db.txt"
q="${QUERY_STRING#q=*}"
q="$(busybox httpd -d "$q")"
echo -e "Content-type: text/html\n\n"
echo "<style>
html {
	background-color:#404040;
}
.logo {
	font-size:1.3rem;
	color:white;
	margin-top:1.2rem;
}
a {
	color:#00a3ff;
}
a:visited {
	color:#7500ff;
}
a:active {
	color:#ff5600;
}
a.go-back {
	color:white;
	text-decoration:none;
}
a.go-back:visited {
	color:white;
}
a.go-back:active {
	color:white;
}
form {
	display:inline;
}
form > button {
	cursor:pointer;
	border-radius:1.25rem;
	padding:0.625rem;
	background-color:#808080;
	color:white;
	font-size:15px;
}
form > input {
	border-radius:1.25rem;
	padding:0.625rem;
	font-size:15px;
}
form > button > img {
	width:20px;
	position:absolute;
	transform:translate(-30%, -10%)
}
</style>"
echo "
<span class=\"logo\"><strong><a href=\"/\" class=\"go-back\">basic-search-engine</a></strong></span>
<form action=\"/cgi-bin/search.sh\" method=\"GET\">
<input type=\"text\" name=\"q\" placeholder=\"enter search query here....\" value=\"$q\">
<button type=\"submit\"><img src=\"/search-icon.png\" alt=\"search icon\">&nbsp;&nbsp;&nbsp;&nbsp;search</button>
</form>"
for result in $(grep "$q" "$db")
do
	echo "<h2><a href=\"$(echo "$result"|cut -d\| -f2)\">$(echo "$result"|cut -d\| -f1)</a></h2>"
done
