#!/usr/bin/env groovy
def DEVICE
pipeline {
    agent any
    parameters {
            string(defaultValue: 'iPhone XS', description: 'Device name', name: 'DevicesName', trim: true)
            string(defaultValue: 'bs://167020785b0914f222af4be7b8f8181fde5f0f26', description: 'URL Application', name: 'AppUrl', trim: true)
            string(defaultValue: '14.0', description: 'Operating System version', name: 'os_version', trim: true)
            string(defaultValue: 'Ios_en_callback_brand', description: 'Test Execution', name: 'tags', trim: true)
    }
    stages {
        stage('pre requise install') {
            steps {
                sh 'pip3 install -r requirements.txt'
                script {
                    DEVICE = params.DevicesName.replaceAll(' ', '_')
                }
            }
        }
        stage('Connect to browserstack') {
            steps {
                browserstack('3aac3daa-8942-481b-9716-c75251d9aa7c') {
                }
            }
        }
        stage('Execute tests with robot') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "robot  -v BUILD:${env.BUILD_TAG} -v DEVICE:${DEVICE} -v OS_VERSION:${params.os_version} -v REMOTE_BUILD:True  -v APP:${params.AppUrl}  -i tags ."
                }
            }
        }
        stage('Publish Robot Framework HTML report') {
            steps {
                robot outputPath: '', passThreshold: 100.0, unstableThreshold: 100.0
            }
        }
        stage('Attache BrowserStack test results') {
            steps {
                browserStackReportPublisher 'app-automate'
            }
        }
    }
}

