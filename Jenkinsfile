pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
		}
	post {
	   success {
	      archiveArtifacts artifacts: "target/**/*.jar, fingerprint: true"
		}
            }
        }
        stage('Create Docker Image'){
                docker.build("test-java-image:${env.BUILD_NUMBER}")
		}

	stage('Test image'){
		sh "docker run test-java-image:${env.BUILD_NUMBER}"
		}
	}        
    }

