[📁 Once Specification GitHub](/cerulean-circle-unlimited-2cu/product/development/once/once-specification.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/once/once-specification/technical-debt.md) | [🌐 Index Structure local SymLink](./technical-debt.entry.md)

# Technical Debt

- Use UcpComponent as a model for another UcpComponent with MVC support
  - eg. DefaultFilter and CustomFilterViews
  - JavaScriptObject and DefaultOverview
- Joi is not a Std OSS Licence and owend by Wallmart  
ONCE must not be dependant on it
  - Replace by MDA MOF principles (Big thing)
- Server Side Parallel Security Context can conflict
- Interceptor chain pattern
- IOR & Network Action
- Cleanup Repository and size
- ONCE Origin needs to be known in ONCE (extend isOwnOrigin)
