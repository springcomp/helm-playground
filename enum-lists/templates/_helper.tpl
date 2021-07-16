{{ define "newline" }}
{{ end }}

{{- define "generate" -}}
name: {{ .global.name }}
environment: {{ .env }}
template: 
{{ range $key, $value := .Template -}}
- {{ $key }}: {{ $value }}
{{ end -}}
files:
{{ range $path, $_ := .Files.Glob "**" -}}
- {{ $path }}
{{ end }}
{{- end -}}