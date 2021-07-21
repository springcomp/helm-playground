{{- define "generate" -}}
{{- /* notice that root scope is lost */ -}}
{{- . | toYaml -}}
{{- end -}}