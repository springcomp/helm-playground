# Overview

Please, navigate to the current folder and run the following command:

```
helm template . --output-dir .dist/ --set "global.env=int"
```

This example outlines how to access and process files.
In particular, it explains that:

- Communication between custom templates must use serialized output
	- Use `toYaml` before emitting output from a custom template
	- Use `fromYaml` or `fromYamlArray` as appropriate on the output of a custom template
	- `.File.Get` on a YAML file
	- `.Files.Get` on a Helm template retrieves an internal in-memory opaque structure.
		- That structure can be serialized using `toYaml`
		- That structure may be evaluated using `tpl` (this requires the `.Template` property)
			- The result of applying `tpl` is a YAML string that can be emitted without redundant serialization
			- Use `fromYaml` before processing the result of applying `tpl`