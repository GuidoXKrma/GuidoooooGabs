# Mini Proyecto: Arquitectura monolítica y microservicios
Autor / usuario WSL: GuidoGabrielGG

Proyecto académico con API monolítica, tres microservicios independientes, PostgreSQL, Docker Compose, pruebas Jest/Supertest, GitHub Actions, Kubernetes y métricas Prometheus/Grafana.

## Requisitos
Docker Desktop con WSL2 o Docker Engine + Docker Compose v2.

## Ejecutar
```bash
cp .env.example .env
docker compose up --build
```
- Monolito: http://localhost:3000/health
- Monolito: http://localhost:3000/usuarios, /productos, /pedidos
- Microservicios: http://localhost:3001/usuarios, :3002/productos, :3003/pedidos
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3004 (admin / clave definida en .env)

## Pruebas monolito
```bash
cd monolito && npm install && npm test
```

## Publicar en GitHub
Consulta `SUBIR_A_GITHUB.txt`. Debes crear el repositorio remoto en tu cuenta y hacer `git push`; este paquete no puede publicar directamente sin autorización de tu cuenta.

## Estructura
- `monolito/`: Express con usuarios, productos y pedidos conectados a PostgreSQL.
- `microservicios/`: servicios independientes para usuarios, productos y pedidos.
- `database/init.sql`: esquema y datos de ejemplo.
- `monitoring/`: configuración Prometheus y datasource de Grafana.
- `k8s/`: manifiestos base de Kubernetes.
- `.github/workflows/ci.yml`: integración continua.

Los manifiestos Kubernetes son una base de despliegue; para usar Kubernetes debes construir/publicar imágenes y ajustar los nombres de imagen. Cambia las claves de ejemplo antes de usar fuera de local.
