all: 
	echo "Migration" && sudo docker-compose exec app php ./yii-blog/blog/testdrive/protected/yiic migrate up --interactive=0
