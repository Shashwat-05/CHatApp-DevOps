pipeline {
    agent any

    stages{
        stage("cloning") {
            steps{
                sh 'git clone https://github.com/Shashwat-05/opslyft-assesment.git'
                sh 'cd /var/lib/jenkins/workspace/opslyft-assesment_master/'
            }

        }
        stage("test") {
            steps {
            echo "testing the flask application ..."
            echo "linting the flask app ..."
            sh 'pylint app.py'
            
            }
        }
        stage("build and push"){
            steps{
                script{

            docker.withRegistry('https://index.docker.io/v1/', 'dockerid') {

            def customImage = docker.build("shashwatpp/basic-flask:${env.BUILD_ID}")

            customImage.push()
                }
            }

            }
        }
        stage("deploy"){
            steps{
                script{
                    withKubeConfig([credentialsId: 'k8sid', serverUrl: 'https://192.168.29.244:6443']) {
                    sh "kubectl apply -f deploy-files/flask-deploy.yaml"
                    sh "kubectl apply -f deploy-files/flask-service.yaml"
                    sh "kubectl set image deployments/flask-deployment flask-hello=shashwatpp/basic-flask:${env.BUILD_ID}"
                    echo "application running on -> http://192.168.29.244:30036"
                }

            
            }
        }
    }
}
}
