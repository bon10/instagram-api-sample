case "$1" in
  "start")
    export $(cat .env | grep -v ^# | xargs)
    bundle exec rails s -b 0.0.0.0
    ;;
  *) echo "undefined";;
esac
