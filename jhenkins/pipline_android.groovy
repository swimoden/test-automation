#!/usr/bin/env groovy
def DEVICE
pipeline {
    agent any
    parameters {
            string(defaultValue: 'Samsung Galaxy A51', description: 'Device name', name: 'DevicesName', trim: true)
            string(defaultValue: 'Samsung Galaxy A51', description: 'Device name', name: 'SecondDevicesName', trim: true)
            string(defaultValue: 'bs://2238307a6683691e7b08935312becd60e290e885', description: 'URL Application', name: 'AppUrl', trim: true)
            string(defaultValue: '10.0', description: 'Operating System version', name: 'os_version', trim: true)
            string(defaultValue: 'Android_en_callback_brand', description: 'Test Execution', name: 'tags', trim: true)
    }
    stages {
        stage('pre requise install') {
            steps {
                sh 'python3.8 -m pip install -r requirements.txt'
                sh 'python3.8 -m pip freeze'
                script {
                      DEVICE = params.DevicesName.replaceAll(' ', ' ')
                }
            }
        }
        stage('Connect to browserstack') {
            steps {
                browserstack('3aac3daa-8942-481b-9716-c75251d9aa7c') {
                }
            }
        }
        stage('Execute tests with robot with first phone') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "python3.8 -m robot  -v BUILD:${env.BUILD_TAG} -v DEVICE:${DEVICE} -v OS_VERSION:${params.os_version} -v REMOTE_BUILD:True  -v APP:${params.AppUrl}  -i ${params.tags} ."
                }
            }
        }
        stage('Execute tests with robot with second phone') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "python3.8 -m robot  -v BUILD:${env.BUILD_TAG} -v DEVICE:${SecondDevicesName} -v OS_VERSION:${params.os_version} -v REMOTE_BUILD:True  -v APP:${params.AppUrl}  -i ${params.tags} ."
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