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

{{- define "load.template" -}}
{{- $dictionary := dict "ignored" "ignored" -}}
{{- if .values -}}
{{- $config = tpl .values . | fromYaml -}}
{{- end -}}
{{- end -}}

{{- define "load.items.values" -}}
{{- $defaultValues := .Files.Get (printf "collection/items/%s/values.yaml" .itemName) -}}
{{- $defaultConfig := dict "ignored" "ignored" -}}
{{- if $defaultValues -}}
{{- $defaultConfig = tpl $defaultValues . | fromYaml -}}
{{- end -}}
{{- $envValues := .Files.Get (printf "collection/items/%s/values.%s.yaml" .itemName .env) -}}
{{- $envConfig := dict "ignored" "ignored" -}}
{{- if $envValues -}}
{{- $envConfig = tpl $envValues . | fromYaml -}}
{{- end -}}
{{- merge $defaultConfig $envConfig | toYaml -}}
{{- end -}}

{{ define "generate.item" }}
- itemName: {{ .itemName }}
  name: {{ (index . .itemName).content.name }}
  displayName: {{ (index . .itemName).content.displayName }}
{{- end }}