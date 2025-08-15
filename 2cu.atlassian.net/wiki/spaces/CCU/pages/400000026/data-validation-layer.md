[📁 Rair Development GitHub](/cerulean-circle-unlimited-2cu/product/development/2cu-custom-development/rair-development.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/2cu-custom-development/rair-development/data-validation-layer.md) | [🌐 Index Structure local SymLink](./data-validation-layer.entry.md)

# Data validation layer

For each endpoint, where will be expected some data for processing, should use a validation mechanism.

The validation should be implemented as middleware and which will control received data (expected fields, field types, etc). In case of data is invalid - will return an error and the server will not be crushed.

The data structure will describe in validation schemas similar to JSON.

Concept:

![](./attachments/Data%20validation%20layer.png)
