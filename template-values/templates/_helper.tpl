{{- define "generate" }}
greetings:
- hello: {{ .greetings.hello }}
- good-bye: {{ .greetings.salutations }}
{{- end -}}