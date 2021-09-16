{{ define "newline" }}
{{ end }}

{{- define "sequence" -}}
{{- (list "one" "two") | toYaml -}}
{{- end -}}