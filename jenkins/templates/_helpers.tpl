{{- define "jenkins.lables" -}}
app: jenkins
env: {{ .Values.controller.env }}
version: 2.387
{{- end  -}}


{{- define "jenkins.healthchecks"  -}}
startupProbe:
  httpGet:
    path: '/login'
    port: 8080
  initialDelaySeconds: 90
  failureThreshold: 30  
  periodSeconds: 10
  timeoutSeconds: 5
livenessProbe:
  httpGet:
    path: "/login"
    port: 8080
  initialDelaySeconds: 90
  periodSeconds: 10
  timeoutSeconds: 5
  failureThreshold: 5
readinessProbe: 
  httpGet:
    path: "/login"
    port: 8080
  initialDelaySeconds: 90
  periodSeconds: 10
  timeoutSeconds: 5
  failureThreshold: 3
{{- end  -}}