｛｛/*
- name: shared-tmp 
  mountPath: /tmp/pod
*/}}
{{- define "container.volumeMounts" -}} 
volumeMounts:
{{- range $mount := .Values.container.volumeMounts }}
- name: {{ $mount.name }}-volumne
  mountPath: {{ $mount. mountPath }}
  {{- if $mount.subPath }}
  subPath: {{ $mount.subPath }}
  {{- end }}
  {{- if $mount.readOnly }}
  readOnly: {{ $mount.readOnly }}
  {{- else }}
  readOnly: true
  {{- end }}
{{- end }}
{{- end - }}

{{- define "container.command" -}}
command:
{{- range $cmd := .Values.container.command }}
- {{ $cmd }}
{{- end }}
{{- end =}}

{{- define "container.args" - }}
args:
{{- range $arg := .Values.container.args }}
- {{ $arg }}
{{- end }}
({- end -}}

{{- define "container.securityContext" -}}
securityContext:
  runAsUser: {{ default 1001 .Values.container.runAs.user }}
  runAsGroup: {{ default 1001 .Values.container.runAs.group }}
  runAsNonRoot: true
{{- end -}}

{{/*
Base Deployment
*/}}
{{- define "container.env" - }}
env:
  {{- toYaml .Values.container.env | nindent 0 - }}
  {{- if .Values.container.envAddons }}
   {{- toYaml .Values.container.envAddons | nindent 0 - }}
  {{- end -}}
{{- end -}}

{{- define "container.ports" - }}
{{- if.Values.container.ports -}}
ports:
{{- range .Values.container.ports }}
- containerPort: {{.}} 
  protocol: TCP
{{- end }}
{{- else }}
ports:

- containerPort: 8080
  protocol: TCP
{{- end }}
{{- end -}}

{{- define "deployment.serviceAccount" - }}
{{- if .Values.deployment.serviceAccountName }}
serviceAccountName: {{ Values.deployment.serviceAccountName }}
{{- else - }}
  {{- if .Values.serviceAccount }}
    {{- if .Values.serviceAccount.name J
serviceAccountName: {{.Values.serviceAccount.name }}{{ include "app.slotsuffix" . }}
    {{- else }}
serviceAccountName: {{ include "app.nameSlot" . }}
    {{- end })
  {{- end j}
{{- end - }}
{{- end -}}

{{- define "deployment. restartPolicy" -}}
  {{- if Values.deployment.restartPolicy 3)
restartPolicy: {{ .Values.deployment.restartPolicy | trim }}
  {{- else }}
restartPolicy: Always
  {{- end }}
{{- end -}}

{{- define "deployment.affinity" -}}
affinity:
  podAntiAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
    - labelSelector:
        matchExpressions:
                - kеу: арр
                  operator: In
                  values:
                    - {{ include "app.name" . }}
                {{- if .Values.helmArgs.releaseSlot }}
                - key: slot
                  operator: In
                  values:
                    - {{.Values.helmArgs.releaseSlot }}
                {{- end }}
       topologyKey: "kubernetes.io/nodes"
     preferredDuringSchedulingIgnoredDuringExecution:
     - weight: 100
       podAffinityTerm:
         labelSelector:
           matchExpressions:
           - key: app
             operator: In
             values:
               - {{ include "app.name" . }}
           {{- if .Values.helmArgs.releaseSlot }}
           - key:_slot
             operator: In
             values:
               - {{-Values.helmArgs.releaseSlot }}
           {{- end }}
        topologyKey: "topology kubernetes.io/zone"
{{- end -}}