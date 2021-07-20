{{- define "generate" -}}
greetings:
- hello: {{ .hello }}
- good-bye: {{ .salutations }}
{{- end -}}