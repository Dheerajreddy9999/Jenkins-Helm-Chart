{{- define "jenkins.lables" -}}
app: jenkins
env: {{ .Values.controller.env }}
version: 2.387
{{- end  -}}


{{- define "jenkins.securityContext"  -}}
securityContext:
      fsGroup: {{ .Values.controller.securityContext.fsGroup }}
      runAsUser: {{ .Values.controller.securityContext.runAsUser }}
      runAsNonRoot: {{ .Values.controller.securityContext.runAsNonRoot }}
{{- end -}}

{{- define "jenkins.healthchecks"  -}}
startupProbe:
  httpGet:
    path: '/login'
    port: {{ .Values.controller.startupProbe.httpGet.port }}
  initialDelaySeconds: {{ .Values.controller.startupProbe.initialDelaySeconds }}
  failureThreshold: {{ .Values.controller.startupProbe.failureThreshold }}
  periodSeconds: {{ .Values.controller.startupProbe.periodSeconds }}
  timeoutSeconds: {{ .Values.controller.startupProbe.timeoutSeconds }}
livenessProbe:
  httpGet:
    path: "/login"
    port: {{ .Values.controller.livenessProbe.httpGet.port }}
  initialDelaySeconds: {{ .Values.controller.livenessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.controller.livenessProbe.periodSeconds }}
  timeoutSeconds: {{ .Values.controller.livenessProbe.timeoutSeconds }}
  failureThreshold: {{ .Values.controller.livenessProbe.failureThreshold }}
readinessProbe: 
  httpGet:
    path: "/login"
    port: {{ .Values.controller.readinessProbe.httpGet.port }}
  initialDelaySeconds: {{ .Values.controller.readinessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.controller.readinessProbe.periodSeconds }}
  timeoutSeconds: {{ .Values.controller.readinessProbe.timeoutSeconds }}
  failureThreshold: {{ .Values.controller.readinessProbe.failureThreshold }}
{{- end  -}}