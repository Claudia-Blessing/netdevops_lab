# Net.io — Infrastructure multi-services conteneurisée avec monitoring

---

## Présentation du projet

Ce projet est un laboratoire orienté **Infrastructure et DevOps** ayant pour objectif de simuler une architecture multi-services servant a deployer une application de monitoring d'infrastrucutre avec supervision et observabilité .

Le projet met en œuvre :

- une architecture multi-services,
- une segmentation réseau,
- un reverse proxy,
- une automatisation de déploiement,
- ainsi qu’une stack d’observabilité avec Prometheus et Grafana.

L’objectif était de reproduire, à petite échelle, le fonctionnement d’une infrastructure proche d’un environnement professionnel.


# Architecture du projet

```text
                           ┌──────────────────┐
                           │     Navigateur   │
                           └────────┬─────────┘
                                    │
                                    ▼
                         ┌────────────────────┐
                         │   Nginx Reverse    │
                         │       Proxy        │
                         └────────┬───────────┘
                                  │
                 ┌────────────────┴────────────────┐
                 ▼                                 ▼
      ┌───────────────────┐             ┌───────────────────┐
      │ Frontend Service  │             │  Backend API      │
      │ HTML / CSS        │             │ Node.js / Express │
      └───────────────────┘             └─────────┬─────────┘
                                                   │
                                                   ▼
                                         ┌─────────────────┐
                                         │   PostgreSQL    │
                                         │    Database     │
                                         └─────────────────┘


                    ┌──────────────────────────────────┐
                    │        Monitoring Stack          │
                    ├──────────────────────────────────┤
                    │ Prometheus → Collecte métriques  │
                    │ Grafana   → Visualisation        │
                    └──────────────────────────────────┘


# Architecture réseau Docker

```text

                    ┌────────────────────┐
                    │    frontend_net    │
                    └─────────┬──────────┘
                              │
                    ┌─────────▼─────────┐
                    │ Nginx Reverse     │
                    │ Proxy             │
                    └─────────┬─────────┘
                              │
                    ┌─────────▼─────────┐
                    │ Frontend Service  │
                    └───────────────────┘


                    ┌────────────────────┐
                    │    backend_net     │
                    └─────────┬──────────┘
                              │
          ┌───────────────────┼────────────────────┐
          ▼                   ▼                    ▼
 ┌────────────────┐  ┌────────────────┐  ┌────────────────┐
 │ Backend API    │  │ PostgreSQL DB  │  │ Monitoring     │
 │ Node.js        │  │                │  │ Stack          │
 └────────────────┘  └────────────────┘  └────────────────┘

# Structure du projet

```text

netdevops_lab/
├── ansible/
│   └── playbook.yml
├── backend/
│   └── app.js
├── frontend/
│   └── index.html
├── docker-compose.yml
└── README.md
```

# Commandes d'exécution

```bash
1. Lancement manuel avec Docker Compose

docker compose up --build -d


2. Deploiement automatise avec Ansible
```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yml
```


3. Vérification de l'infrastructure

http://localhost

http://localhost/metrics


```
# Contact

Je recherche actuellement une alternance ou un stage à partir de Septembre 2026 dans les domaines :

Infrastructure
DevOps
Cloud
Administration systèmes & réseaux

mail: claudiablessing.adjafo@gmail.com
