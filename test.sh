#!/bin/bash
function create() {
    curl -X POST -H "Content-type: application/json" -d "{\"id\": ${1}, \"name\": \"${2}\"}" https://flask-sample-$(whoami).herokuapp.com/v1/user 2>/dev/null
}


function read() {
    curl "https://flask-sample-$(whoami).herokuapp.com/v1/user?id=${1}" 2>/dev/null
}


function update() {
    curl -X PUT -H "Content-type: application/json" -d "{\"id\": ${1}, \"name\": \"${2}\"}" https://flask-sample-$(whoami).herokuapp.com/v1/user 2>/dev/null
}


function delete() {
    curl -X DELETE "https://flask-sample-$(whoami).herokuapp.com/v1/user?id=${1}" 2>/dev/null
}

delete 1 >> /dev/null 2>&1
delete 2 >> /dev/null 2>&1
delete 3 >> /dev/null 2>&1

echo case: create 1 mike
if [ "$(create 1 mike)" != "{\"message\":\"success\"}" ]; then
 echo error; exit 1
fi
echo case: create 2 mike
if [ "$(create 2 ken)" != "{\"message\":\"success\"}" ]; then
 echo error; exit 1
fi
echo case: create 3 mike
if [ "$(create 3 ben)" != "{\"message\":\"success\"}" ]; then
 echo error; exit 1
fi

echo case: read 1
if [ "$(read 1)" != "{\"id\":1,\"message\":\"success\",\"name\":\"mike\"}" ]; then
 echo error; exit 1
fi
echo case: read 2
if [ "$(read 2)" != "{\"id\":2,\"message\":\"success\",\"name\":\"ken\"}" ]; then
 echo error; exit 1
fi
echo case: read 3
if [ "$(read 3)" != "{\"id\":3,\"message\":\"success\",\"name\":\"ben\"}" ]; then
 echo error; exit 1
fi
echo case: read 4
if [ "$(read 4)" != "{\"message\":\"fail\"}" ]; then
 echo error; exit 1
fi

echo case: update 1
if [ "$(update 1 hiro)" != "{\"message\":\"success\"}" ]; then
 echo error; exit 1
fi
echo case: update 4
if [ "$(update 4 hiro)" != "{\"message\":\"fail\"}" ]; then
 echo error; exit 1
fi

echo case: read 1
if [ "$(read 1)" != "{\"id\":1,\"message\":\"success\",\"name\":\"hiro\"}" ]; then
 echo error; exit 1
fi
echo case: read 2
if [ "$(read 2)" != "{\"id\":2,\"message\":\"success\",\"name\":\"ken\"}" ]; then
 echo error; exit 1
fi
echo case: read 3
if [ "$(read 3)" != "{\"id\":3,\"message\":\"success\",\"name\":\"ben\"}" ]; then
 echo error; exit 1
fi

echo case: delete 1
if [ "$(delete 1)" != "{\"message\":\"success\"}" ]; then
 echo error; exit 1
fi
echo case: delete 2
if [ "$(delete 2)" != "{\"message\":\"success\"}" ]; then
 echo error; exit 1
fi
echo case: delete 3
if [ "$(delete 3)" != "{\"message\":\"success\"}" ]; then
 echo error; exit 1
fi
echo case: delete 4
if [ "$(delete 3)" != "{\"message\":\"fail\"}" ]; then
 echo error; exit 1
fi

echo case: read 1
if [ "$(read 1)" != "{\"message\":\"fail\"}" ]; then
 echo error; exit 1
fi
echo case: read 2
if [ "$(read 2)" != "{\"message\":\"fail\"}" ]; then
 echo error; exit 1
fi
echo case: read 3
if [ "$(read 3)" != "{\"message\":\"fail\"}" ]; then
 echo error; exit 1
fi

echo "Sucess!"
