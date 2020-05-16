case "$1" in
  "dev")
    docker-compose -f docker/docker-compose-dev.yml up -d
    docker-compose -f docker/docker-compose-dev.yml exec web bash
    docker-compose -f docker/docker-compose-dev.yml down
    ;;
  "demo")
    docker-compose -f docker/docker-compose.yml up -d
    ;;
  "down")
    docker-compose -f docker/docker-compose.yml down
    ;;
  "build")
    docker build -t insta-api-sample-server -f app/Dockerfile .
    ;;
  "barusu")
    cd docker
    docker-compose down --rmi all --volumes
    ;;
  *) echo "undefined";;
esac

