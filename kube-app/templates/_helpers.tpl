{{/*
Sets extra deployment labels
*/}}
{{- define "deployment.labels" -}}
{{- $labels := dict -}}
{{- $chartName := toString .Chart.Name }}
{{- $chartVersion := toString .Chart.Version }}
{{- $labels = merge $labels (dict
  "helm.sh/chart" (printf "%s-%s" $chartName $chartVersion)
  "app.kubernetes.io/name" (include "project.name" .)
  "app.kubernetes.io/instance" .Release.Name
  "app.kubernetes.io/managed-by" .Release.Service
  "app.kubernetes.io/version" .Chart.AppVersion) }}
{{- if .Values.deployment.labels }}
  {{- $tp := typeOf .Values.deployment.labels }}
  {{- if eq $tp "string" }}
    {{- $labels = merge $labels (tpl .Values.deployment.labels . | fromYaml) }}
  {{- else }}
    {{- $labels = merge $labels .Values.deployment.labels }}
  {{- end }}
{{- end }}
{{- toYaml $labels -}}
{{- end -}}

{{/*
Sets extra deployment matchLabels
*/}}
{{- define "deployment.matchLabels" -}}
{{- $matchLabels := dict -}}
{{- $matchLabels = merge $matchLabels (dict
  "app.kubernetes.io/name" (include "project.name" .)
  "app.kubernetes.io/instance" .Release.Name
  "app.kubernetes.io/managed-by" .Release.Service) }}
{{- if .Values.deployment.labels }}
  {{- $tp := typeOf .Values.deployment.labels }}
  {{- if eq $tp "string" }}
    {{- $matchLabels = merge $matchLabels (tpl .Values.deployment.labels . | fromYaml) }}
  {{- else }}
    {{- $matchLabels = merge $matchLabels .Values.deployment.labels }}
  {{- end }}
{{- end }}
{{- toYaml $matchLabels }}
{{- end -}}

{{/*
Sets extra deployment annotations
*/}}
{{- define "deployment.annotations" -}}
  {{- if .Values.deployment.annotations }}
      annotations:
    {{- $tp := typeOf .Values.deployment.annotations }}
    {{- if eq $tp "string" }}
      {{- tpl .Values.deployment.annotations . | nindent 8 }}
    {{- else }}
      {{- toYaml .Values.deployment.annotations | nindent 8 }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/*
Sets the container resources if the user has set any.
*/}}
{{- define "deployment.resources" -}}
  {{- if .Values.deployment.resources -}}
          resources:
{{ toYaml .Values.deployment.resources | indent 12}}
  {{ else }}
          resources:
            requests:
              memory: 256Mi
              cpu: 250m
            limits:
              memory: 256Mi
              cpu: 250m
  {{- end -}}
{{- end -}}


{{/*

*/}}
{{- define "ingress.name" -}}

  {{- $names := dict -}}
  {{ $ingress_name := print .Values.global.projectName "-api-alb" }}
  {{- range $ingress := .Values.deployment.ingress -}}
  {{- if $ingress.additionalNameTag }}
  {{ $ingress_name = print $.Values.global.projectName "-api-alb-" $ingress.additionalNameTag }}
  {{- end }}
  {{- if hasKey $names $ingress_name -}}
  {{- printf "Duplicate ingress name %s" $ingress_name | fail -}}
  {{- else -}}
  {{- $_ := set $names $ingress_name $ingress_name -}}
  {{- end -}}
  {{- end -}}
{{- end -}}

{{/*
Name of project
*/}}
{{- define "project.name" -}}
{{- $.Values.global.projectName -}}
{{- end -}}