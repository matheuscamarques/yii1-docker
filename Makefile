all: 
	echo "Migration testdrive" && sudo docker-compose exec app php ./yii/projetos/testdrive/protected/yiic migrate up --interactive=0
	echo "Migration xeroxsys" && sudo docker-compose exec app php ./yii/projetos/xeroxsys/protected/yiic migrate up --interactive=0