# Prestashop Mi Última Voluntad

## Pasos para intstalar

Los requisitos para que funcione el sitio de prestashop, antes de configurarlo son:

1. Crear una red para agregar los diferentes contenedores

    ```bash
    docker network create prestashop-net
    ```

2. Instalar mysql

    ```bash
    docker run -ti --name mysql --network prestashop-net -e MYSQL_ROOT_PASSWORD=admin -p 3307:3306 -d mysql:5.7
    ```

    Este comando crea un contenedor Docker con una base de datos MySQL lista para ser utilizada, y dentro de la red prestashop-net

3. (Opcional) PhpMyAdmin

    ```bash
    docker run --name phpmyadmin --network prestashop-net -d --link mysql:db -p 8084:80 phpmyadmin
    ```

    Si se desea ver la base de MySQL de forma interactiva, podemos instalar esta imagen de PhpMyAdmin para ver las tablas, datos, etc.

---

Una vez instalada la base de MySQL, se procede a correr el archivo **docker-compose.yml** con el comando, desde el directorio raíz

```bash
docker compose up    
```

El archivo dockerfile crea dos contenedores de Docker, uno para una base de datos PostgreSQL y otro para una herramienta de administración de bases de datos PgAdmin, y los conecta a la red "prestashop-net".

---

Posteriormente creamos construimos la imagen para prestashop con el archivo Dockerfile en el directorio raíz. 

```bash
mkdir src/
docker build -t prestashop-psql .
```

Este comando construye una imagen de Docker para PrestaShop que es compatible con diferentes arquitecturas de procesadores.

---

Finalmente corremos el contenedor de prestashop

```bash
docker run --name presta-v4 --network prestashop-net -v $(pwd)/src:/var/www/html  -p 9090:80 prestashop-psql
```

Esperar unos minutos en lo que se agregan los archivos de instalación.
