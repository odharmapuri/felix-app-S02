pipeline {
	agent any
	
	environment {
        app_name = "felix-app"
        docker_repo = "odharmapuri"
	}

    stages{
        /*stage('Git clone'){
            steps {
                script{
                    sh 'rm -rf /var/lib/jenkins/workspace/kiwi-app/*'
                    sh 'git clone -b master https://gitlab.com/odharmapuri1/felix-app.git'
                    sh 'mv /var/lib/jenkins/workspace/kiwi-app/felix-app/* .'
                }
            }
        }*/
        stage('BUILD'){
            steps {
                script{
                    //sh 'cd kiwi-infra/'
                    //sh 'mvn -f kiwi-infra/pom.xml install'
                    sh 'mvn clean install'
                }
            }
            /*post {
                success {
                    #it copies the selected artifacts in the %JENKINS_HOME%/jobs/MY_JOB/builds/... on the master server.
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '** /target/*.war'
                }
            }*/
        }
        stage ('CODE ANALYSIS WITH CHECKSTYLE'){
            steps {
                script{
                    //sh 'mvn -f kiwi-infra/pom.xml checkstyle:checkstyle'
                    sh 'mvn checkstyle:checkstyle'
                }
            }
            post {
                success {
                    echo 'Generated Analysis Result'
                }
            }
        }
        /*stage ('SonarQube Analysis'){
            steps {
            withSonarQubeEnv ('kiwi-sonar') {
            sh 'mvn -f kiwi-infra/pom.xml sonar:sonar'
            }
            }
        }*/
        stage ('Build Docker Image'){
            steps {
                script {
                    sh 'docker build -t ${app_name} .'
                    //docker.build "mycorp/myapp:${env.BUILD_TAG}"
                }
            }
        }
        stage('Tag Docker Image') {
            steps {
                script {
                    sh 'docker tag $app_name ${docker_repo}/${app_name}:${BUILD_ID}'
                    //docker.image("felix-app").tag("felix-app:latest")$BRANCH_NAME$BUILD_ID
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u odharmapuri -p ${dockerhubpwd}'
                    sh 'docker push ${docker_repo}/${app_name}:${BUILD_ID}'
                    }
                }
            }
            post {
                success {
                    build job: 'deploy'
                }
            }
        }
    }
}