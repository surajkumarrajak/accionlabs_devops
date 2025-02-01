#Build a Deployment Pipeline
#Set up a streamlined build and deployment pipeline for the nginx application using GitHub Actions or an equivalent CI/CD tool. Ensure the pipeline covers building the Docker image, running security checks, and deploying to a Kubernetes cluster.

#Written in jenkins

pipeline {
  agent {
    node=any
  }
  environment_variables {
  aws_account = "testacount123"
  region = "us-west-2"
  ecr = "testapp"
}

Stages {

  stage "git checkout" {
        script  {
            git pull https://github.com/surajkumarrajak/accionlabs_devops/new/master
        }
}

  stage "docker build" {
        script {
          docker build -t nginx_testapp ./ --no-cache
        }
  }

stage "docker scan" {
        script {
          aquasec trivy -u testuser -p pass -i nginx_testapp -o=report.json 
        }
  }

stage "docker push" {
        script {
          docker push ${aws_account}-${region}-${ecr}:nginx_testapp
        }
  }

stage "k8s deploy" {
        script {
          docker pull ${aws_account}-${region}-${ecr}:nginx_testapp
          echo `docker images`
          kubectl apply -f k8s_statefulset.yaml
        }
  }

}
}




