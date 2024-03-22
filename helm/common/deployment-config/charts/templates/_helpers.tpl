{{- define "app.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
create chart name, version which will be required by chart lable
*/}}
{{- define "app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
selectors labels to configure custom labels
*/}}
{{- define "app.selectorLables" -}}
app: {{ include "app.name" . }}
{{- end -}}

{{/*
common labels
*/}}
{{- define "app.labels"-}}
helm.sh/kishalay/chart: {{ include "app.chart" }}
{{ include "app.selectorLables" . }}
{{- if .Values.labels -}}
{{ toYaml .Values.labels }}
{{- end -}}
{{- end -}}

{{/*
resources
*/}}
{{- define "container.resources" -}}
limits:
    cpu: {{ default "500m" ((.Values.container.resources).limits).cpu | quote }}
    memory: {{ default "100Mi" ((.Values.container.resources).limits).memory | quote }}
requests:
    cpu: {{ default "5m" ((.Values.container.resources).requests).cpu | quote }}
    memory: {{ default "10Mi" ((.Values.container.resources).requests).memory | quote }}
{{- end -}}

{{/*
Liveness Probes
*/}}
{{- define "container.livenessProbe" -}}
{{- if .Values.container.livenessProbe -}}
livenessProbe:
    httpGet:
        path: {{ .Values.container.livenessProbe.path }}
        port: {{ default 8080 .Values.container.livenessProbe.port }}
        scheme: {{ default "HTTP" .Values.container.livenessProbe.scheme | upper }}
    initialDelaySeconds: {{ default 30 .Values.container.livenessProbe.initialDelaySeconds }}
    timeoutSeconds: {{ default 3 .Values.container.livenessProbe.timeoutSeconds }}
    periodSeconds: {{ default 5 .Values.container.livenessProbe.periodSeconds }}
    successThreshold: {{ default 1 .Values.container.livenessProbe.successThreshold }}
    failureThreshold: {{ default 10 .Values.container.livenessProbe.failureThreshold }}
{{- end -}}
{{- end -}}

{{/*
Readiness Probes
*/}}
{{- define "container.readinessProbe" -}}
{{- if .Values.container.readinessProbe -}}
readinessProbe:
    httpGet:
        path: {{ .Values.container.readinessProbe.path }}
        port: {{ default 8080 .Values.container.readinessProbe.port }}
        scheme: {{ default "HTTP" .Values.container.readinessProbe.scheme | upper }}
    initialDelaySeconds: {{ default 35 .Values.container.readinessProbe.initialDelaySeconds }}
    timeoutSeconds: {{ default 3 .Values.container.readinessProbe.timeoutSeconds }}
    periodSeconds: {{ default 5 .Values.container.readinessProbe.periodSeconds }}
    successThreshold: {{ default 1 .Values.container.readinessProbe.successThreshold }}
    failureThreshold: {{ default 10 .Values.container.readinessProbe.failureThreshold }}
{{- end -}}
{{- end -}}

{{/*
volumes
*/}}
{{- define "container.volumes" -}}
volumes:
{{- range $mount := .Values.container.volumeMounts -}}
- name: {{ $mount.name }}-volume
  {{- if eq "secret" $mount.type -}}
  secret:
    secretName: {{ include "app.nameSlot" $ }}{{ $mount.name | replace $.Chart.Name "" }}
    defaultMode: {{ default 292 $mount.defaultMode }}
    {{- if $mount.items -}}
    items:
    {{- range $secret := $mount.items -}}
    - key: {{ $secret.key }}
      path: {{ $secret.path }}
    {{- end -}}
    {{- end -}}
  {{- else if eq "configMap" $mount.type -}}
  configMap:
    secretName: {{ include "app.nameSlot" $ }}{{ $mount.name | replace $.Chart.Name "" }}
    defaultMode: {{ default 292 $mount.defaultMode }}
    {{- if $mount.items -}}
    items:
    {{- range $cm := $mount.items -}}
    - key: {{ $cm.key }}
      path: {{ $cm.path }}
    {{- end -}}
    {{- end -}}
  {{- else if or (eq "pvc" $mount.type) (eq "persistentVolumeClaim" $mount.type) -}}
  persistentVolumeClaim:
    claimName: {{ $mount.name }}
  {{- else -}}
  emptyDir: {}
  {{- end -}}
{{- end -}}
{{- end -}}
