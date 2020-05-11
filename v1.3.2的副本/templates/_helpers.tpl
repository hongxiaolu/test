{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "tenant.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tenant.fullname" -}}
{{- $name := default "configmap" .Values.nameOverride -}}
{{- printf "%s-%s-%s" .Values.deployEnv .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

#自定义
{{/* Helm required labels */}}
{{- define "tenant.labels" -}}
heritage: {{ .Release.Service }}
release: {{ .Release.Name }}
chart: {{ .Chart.Name }}
{{- end -}}

{{/* matchLabels */}}
{{- define "tenant.matchLabels" -}}
release: {{ .Release.Name }}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "tenant.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


