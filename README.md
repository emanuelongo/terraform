Para que pruebes lo que ya hay:

1. Installa Terraform con Chocolatey:
1.1. Desde Powershell como administrador.
1.2. Ejecuta esto:
   
   choco install terraform -y
   
1.3. terraform -version 

2. Abre Docker Desktop y comprueba de que esté corriendo.
3. Abre la terminal desde VSCode y ejecute:
   
3.1. terraform init

3.2. terraform apply -auto-approve

4. Con eso ya habrás levantado el contenedor y podrás abrir esta URL para ver la app funcionando:
   
4.1. http://localhost:8080
