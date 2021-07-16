# Overview

Please, navigate to the current folder and run the following command:

```
helm template . --output-dir .dist/ --set "global.env=int"
```

This example creates an output file that uses an environment-specific configuration specified as a user-supplied file.