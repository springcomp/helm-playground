{{ define "generate" }}
environment: {{ .env }}
template: 
{{ range $key, $value := .Template -}}
- {{ $key }}: {{ $value }}
{{ end -}}
files:
{{ range $path, $key := .Files.Glob "**" -}}
- {{ $path }}
{{ end }}
{{- end -}}