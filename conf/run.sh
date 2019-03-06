#!/usr/bin/env bash

<<<<<<< HEAD
nohup java -jar BlockParser.jar --Node-list 127.0.0.1 --intial-block 1 -end -1 --event-server http://127.0.0.1:8060 --secret-key TNSpckEZhGfZ4ryidHG2fYWMARLpZ6U139 > /dev/null 2>&1 &
=======
source ./.env
>>>>>>> parent of bec8e0c... Simplifying run.sh

STARTBLOCK=-1

if [[ $TRONEVENTS == "" ]]; then
  TRONEVENTS=http://127.0.0.1:8060
fi

if [[ $NODEHOST == "" ]]; then
  NODEHOST=127.0.0.1
fi

if [[ $1 != "" ]]; then
  STARTBLOCK=$1
fi

ENDBLOCK=-1

if [[ $2 != "" ]]; then
  ENDBLOCK=$2
fi

nohup java -jar BlockParser.jar --Node-list $NODEHOST --intial-block $STARTBLOCK -end $ENDBLOCK --event-server $TRONEVENTS  --secret-key $SECRETKEY  >/dev/null 2>&1 &

#if [[ $3 == "" ]]; then
#  tail -f logs/tron.log
#fi

echo $TRONEVENTS > currentNodeHost