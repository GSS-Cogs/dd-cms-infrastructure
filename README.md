- Download and install gcloud from brew
- Install gcloud components install gke-gcloud-auth-plugin
- Login with gcloud to your account using
  gcloud components install gke-gcloud-auth-plugin

  gcloud auth login

- Creating config profile
  gcloud config configurations create config-name

  gcloud config set project [my-project-id]

  gcloud config set account [my-account@example.com]

  gcloud config set compute/region [us-east1]

  gcloud config set compute/zone [us-east1-b]

- Create the cluster
  gcloud container clusters create cc-cms --zone europe-west2-c
- To generate a kubeconfig context for a specific cluster, run the following command:
  gcloud container clusters get-credentials cc-cms

- After this we use kubectl

- Create the plone and volto deployment. Its best if you CD into the folder where this the yaml scripts are.
  Below are the deployment
  kubectl apply -f plone-deployment.yaml
  kubectl apply -f volto-deployment.yaml

  Below for plone proxy
  kubectl apply -f proxy-deployment.yaml

  Get the services deployed
  kubectl apply -f plone-service.yaml
  kubectl apply -f proxy-service.yaml

  Ingress deploy
  kubectl apply -f ccv2-ingress-plone.yaml
  kubectl apply -f ccv2-ingress-volto.yaml

- Pull Docker
  Authenticate gcloud for docker
  gcloud auth configure-docker [europe-west2-docker.pkg.dev]

  pull the latest by
  docker pull europe-west2-docker.pkg.dev/optimum-bonbon-257411/ccv2/plone:latest

- Create and upload image to your private repo

  Creating
  gcloud artifacts repositories create ccv2 --repository-format=docker --location=europe-west2

  Renaming pulled docker images
  docker tag 8dfb6dab638d europe-west2-docker.pkg.dev/rising-field-357509/ccv2/plone:latest

- TODO Ingress - Network issue
- TODO Storage -
- TODO Build / Jenkins
