pipeline{
    agent{
        node{
            label 'Agent-1'
        }
    }
    options{
        timeout(time:1,unit:'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters{
        string(name:'version', defaultvalue:'', description:'what is ur artifact version?')
        string(name:'environment', defaultvalue:'', description:'what is the environment?')
    }
    stages{
        stage('print version'){
            steps{
                sh"""
                 echo "version:${params.version}"
                 echo "environment:${params.environment}"
                 """
            }
        }
        stage('init'){
            steps{
                sh"""
                 cd terraform
                 terraform init --backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
        }
        stage('plan'){
            steps{
                sh"""
                 cd terraform 
                 terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app-version=${params.version}"
                 """
                }  
        }
        stage('apply'){
            steps{
                sh"""
                 cd terraform
                 terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app-version=${params.version}"
                 """
                }
            }
    }

post{
        always{
            echo "i will always say hello again"
            deleteDir()
        }
        success{
            echo "i will always say hello when pipeline is success"
        }
        failure{
            echo "this is when pipeline failed"
        }
    }
}