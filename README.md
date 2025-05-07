# Ansible Playbooks Repository

Welcome to the **Ansible Playbooks Repository**! This repository provides a centralized collection of Ansible playbooks to automate provisioning, configuration, and deployment tasks across a variety of environments and scenarios.

## Overview

Each branch in this repository represents a different operational scenario or environment. By branching for specific use cases, you can maintain clean separation of playbooks tailored to your infrastructure needs:

* **master**: Documentation and high-level overview of the repository’s purpose and structure.
* **develop**: Latest integration branch for testing new playbooks before release.
* **production**: Stable, production-ready playbooks for deploying live services.
* **staging**: Playbooks for staging/testing environments that mirror production.
* \**feature/* or scenario/\*\*: Branches for specialized use cases (e.g., `scenario/docker-setup`, `scenario/aws-bootstrapping`).

## Branch Strategy

| Branch Name       | Description                                         |
| ----------------- | --------------------------------------------------- |
| `master`          | Repository documentation and roadmap                |
| `develop`         | Integration of new playbooks and testing            |
| `production`      | Production-grade playbooks                          |
| `staging`         | Playbooks for staging/testing environments          |
| `scenario/<name>` | Scenario-specific playbooks (e.g., database, cloud) |

## Structure

```text
├── inventories/        # Host inventory files per environment
│   ├── production/
│   └── staging/
├── playbooks/          # Main playbook definitions
│   ├── site.yml        # Entry point playbook
│   ├── roles/          # Reusable roles
│   └── group_vars/     # Group variables
├── roles/              # Shared role directory (if not in playbooks/)
├── docs/               # Additional documentation
└── README.md           # This overview document
```

## Usage

1. **Checkout** the branch corresponding to your environment or scenario:

   ```bash
   git checkout production
   ```
2. **Install requirements** (if using `requirements.yml` for roles):

   ```bash
   ansible-galaxy install -r requirements.yml
   ```
3. **Run a playbook** against an inventory:

   ```bash
   ansible-playbook -i inventories/production/hosts.ini playbooks/site.yml
   ```


