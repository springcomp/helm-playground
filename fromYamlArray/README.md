# Overview

Please, navigate to the current folder and run the following command:

```
helm template . --output-dir .dist/ --set "global.env=int"
```

This example illustrates the `fromYamlArray` function to deserialize lists (aka arrays).