
{{/*
Create the Service Account name __NAME__ should use
*/}}
{{- define "__GLOBAL__.__NAME__serviceAccountName" -}}
{{- if .Values.__CONFIG__.__NAME__.create -}}
    {{ default (printf "%s_%s" (include "__GLOBAL__.fullname" . ) "__NAME__") .Values.__CONFIG__.__NAME__.name }}
{{- else -}}
    {{ default "default" .Values.__CONFIG__.__NAME__.name }}
{{- end -}}
{{- end -}}


