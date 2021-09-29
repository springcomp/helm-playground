{{- define "logical-comparisons" -}}

{{- include "booleans" . -}}
{{- include "wrapped-booleans" . -}}
{{- include "indirect-booleans" . -}}

{{- include "strings" . -}}
{{- include "indirect-strings" . -}}

{{- include "objects" . -}}
{{- include "indirect-objects" . -}}

{{- end -}}

{{- define "booleans" -}}
{{- $true := true -}}
{{- $false := false }}
state: |-
 $true := true
 $false := false
booleans:
- expression: "not $true"
  value: {{ (not $true) }}
- expression: "not $false"
  value: {{ (not $false) }}
- expression: "eq $true true"
  value: {{ (eq $true true) }}
- expression: "eq $true false"
  value: {{ (eq $true false) }}
{{ end -}}

{{- define "wrapped-booleans" -}}
{{- $booleans := dict "truthy" true "falsy" false }}
state: |-
 $booleans := dict "truthy" true "falsy" false
wrapped-booleans:
- expression: "not $booleans.truthy"
  value: {{ (not $booleans.truthy) }}
- expression: "not $booleans.falsy"
  value: {{ (not $booleans.falsy) }}
- expression: "eq $booleans.truthy true"
  value: {{ (eq $booleans.truthy true) }}
- expression: "eq $booleans.falsy false"
  value: {{ (eq $booleans.truthy false) }}
{{ end -}}

{{- define "indirect-booleans" -}}
{{- $booleans := dict "true" true "false" false -}}
{{- include "indirect-booleans-impl" (merge (dict "booleans" $booleans) .) -}}
{{- end -}}

{{- define "indirect-booleans-impl" }}
state: |-
 $booleans := dict "true" true "false" false
 include "indirect-booleans-impl" (merge (dict "booleans" $booleans) .)
indirect-booleans:
- expression: "not .booleans.true"
  value: {{ (not .booleans.true) }}
- expression: "not .booleans.false"
  value: {{ (not .booleans.false) }}
- expression: "eq .booleans.true true"
  value: {{ (eq .booleans.true true) }}
- expression: "eq .booleans.false false"
  value: {{ (eq .booleans.false false) }}
{{ end -}}

{{- define "strings" -}}
{{- $truthy := "ignored" -}}
{{- $falsy := "" }}
state: |-
 $truthy := "ignored"
 $falsy := ""
strings:
- expression: "not $truthy"
  value: {{ (not $truthy) }}
- expression: "not $falsy"
  value: {{ (not $falsy) }}
{{ end -}}

{{- define "indirect-strings" -}}
{{- $strings := dict "truthy" "ignored" "falsy" "" -}}
{{- include "indirect-strings-impl" (merge (dict "strings" $strings) .) -}}
{{- end -}}

{{- define "indirect-strings-impl" }}
state: |-
 $strings := dict "truthy" "ignored" "falsy" ""
 include "indirect-booleans-impl" (merge (dict "strings" $booleans) .) 
indirect-strings:
- expression: "not .strings.truthy"
  value: {{ (not .strings.truthy) }}
- expression: "not .strings.falsy"
  value: {{ (not .strings.falsy) }}
{{ end -}}

{{- define "objects" -}}
{{- $truthy := .Files.Get "truthy.yaml" -}}
{{- $falsy := .Files.Get "falsy.yaml" }}
state: |-
 $truthy := .Files.Get "truthy.yaml"
 $falsy := .Files.Get "falsy.yaml"
strings:
- expression: "not $truthy"
  value: {{ (not $truthy) }}
- expression: "not $falsy"
  value: {{ (not $falsy) }}
{{ end -}}

{{- define "indirect-objects" -}}
{{- $truthy := .Files.Get "truthy.yaml" -}}
{{- $falsy := .Files.Get "falsy.yaml" }}
{{- $objects := dict "truthy" $truthy "falsy" $falsy -}}
{{- include "indirect-objects-impl" (merge (dict "truthy" $truthy "falsy" $falsy) .) -}}
{{- end -}}

{{- define "indirect-objects-impl" }}
state: |-
 $truthy := .Files.Get "truthy.yaml"
 $falsy := .Files.Get "falsy.yaml
 include "indirect-objects-impl" (merge (dict "truthy" $truthy "falsy" $falsy) .)
indirect-objects:
- expression: "not .truthy"
  value: {{ (not .truthy) }}
- expression: "not .falsy"
  value: {{ (not .falsy) }}
{{ end -}}