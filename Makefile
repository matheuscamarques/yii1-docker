all: 
	echo "Migration" && sudo docker-compose exec app php ./yii/projetos/testdrive/protected/yiic migrate up --interactive=0
