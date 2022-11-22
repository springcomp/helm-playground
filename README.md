# Overview

This repository is a playground for testing [Helm](https://helm.sh) as a templating tool.
It can serve as the basis for learning step by step.

- [minimal/](minimal): contains minimally valid helm template files.
- [static/](static): contains generation of a static output file.
- [template-dict/](template-dict): illustrates passing parameters to a template as a dictionary.
- [template-values/](template-values): illustrates passing parameters to a template as an object.
- [template-values-yaml/](template-values): illustrates passing parameters as an object coming from a third-party file.
- [baseline/](baseline): contains a minimal parameterized generation of an output file.
- [indent/](indent): demonstrates simple YAML identation.
- [env-overrides/](env-overrides): merges configurations from user-supplied env-specific file.
- [enum-lists/](enum-lists): demonstrates enumerating a list of items in a collection.
- [enum-dicts/](enum-dicts): demonstrates enumerating items in a map.
- [nested-templates/](nested-templates): uses and manipulates user-supplied nested templates.
- [nested-templates/](nested-templates): uses and manipulates user-supplied nested templates.
- [processing-files/](processing-files): read and process files.

Other templates:

- [fromYamlArray](fromYamlArray): illustrates `fromYamlArray` function.
- [booleans](booleans): illustrates logical comparisons.