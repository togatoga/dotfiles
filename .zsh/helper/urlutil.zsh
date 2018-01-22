# Encode a URL
function urlencode() {

	local url=$1

	if [[ $url == "" ]]; then
		echo "A string is needed to encode"
		return
	fi

	python -c "import urllib.parse as u; print(u.quote('$url'));"
}

# Decode a string that may have been URL encoded
function urldecode() {

	local string=$1

	if [[ $string == "" ]]; then
		echo "A string is needed to decode"
		return
	fi

	python -c "import urllib.parse as u; print(u.unquote('$string'));"
}
