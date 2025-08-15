[📁 Shift Gmbh Development GitHub](/cerulean-circle-unlimited-2cu/product/development/2cu-custom-development/shift-gmbh-development.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/2cu-custom-development/shift-gmbh-development/couch7-code-analysis.entry.md) | [🌐 Index Structure local SymLink](./couch7-code-analysis.entry.entry.md)

# couch7 Code Analysis

**Caching**

1. Codeigniter Caching (Configure but not used)
2. Redis Caching (Configure but not used)

**Geo-code Caching:**

This process is define in 2 different functions in 2 diiferent location

1. File Location: application/libraries/Googlemaps.php
  1. Function Name {`get_lat_long_from_address`()} using table `"geocoding`" ( This is not working as table is missing )
2. File Location: application/models/logging\_model.php
  1. Function Name `{cache_geocodes`()} using table `"geocodes_cache" ( Its not fully functional its just storing the data in table as per analysis done till 14th Sep 2021)`

**Other Issues:**

1. This application is using unstable development version of codeigniter {`3.0-dev`}
2. Multiple library are used to get Geo location
  1. Google API
  2. `ipinfodb`.com
  3. `netip.de`
  4. `where.yahooapis.com`

- [couch7 DB Data (Anonymized)](https://2cu.atlassian.net/wiki/spaces/CCU/pages/674136069/couch7+DB+Data+Anonymized)
- [Reduce Map access for couch7](../../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/726564877/Reduce_Map_access_for_couch7.md)
