[📁 Rair Development](../rair-development.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000026/data-validation-layer.md) | [🌐 Page Structure local SymLink](./data-validation-layer.page.md)

# Data validation layer

For each endpoint, where will be expected some data for processing, should use a validation mechanism.

The validation should be implemented as middleware and which will control received data (expected fields, field types, etc). In case of data is invalid - will return an error and the server will not be crushed.

The data structure will describe in validation schemas similar to JSON.

Concept:

![](./attachments/Data%20validation%20layer.png)
