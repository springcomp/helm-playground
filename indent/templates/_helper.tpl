{{- define "generate" }}
environment: {{ .env }}
{{/* no indent */}}
{{ .global.object | toYaml }}
_z1:
{{- /* two spaces */}}
{{ .global.object | toYaml | indent 2 }}
  _z2:
{{- /* four spaces */}}
{{ .global.object | toYaml | indent 4 }}
    _z3:
{{- /* six spaces */}}
{{ .global.object | toYaml | indent 6 }}
{{ end -}}