# DataController

!!! info ""
   **extends:** BaseController

## Description

This model can connect to datastores and handle the data.

## Usage

## Properties

### dataStoreName

!!! quote ""
    Name of the main datastore. Can be set with SetDataStore().

### dataStores

!!! quote ""
    Dictionary with all the datastore in it.


## Functions

### `#!lua function SetDataStore(datastore)` { data-toc-label="SetDataStore()" }

!!! quote ""
    Sets the name of the datastore.

    **Parameters**

    | Parameter | Type   | Description               |
    |-----------|--------|---------------------------|
    | datastore | string | The name of the datastore |

### `#!lua function SetScope(scope)` { data-toc-label="SetScope()" }

!!! quote ""
    Add a scope to the scopes dictionary.

    **Parameters**

    | Parameter | Type   | Description           |
    |-----------|--------|-----------------------|
    | scope     | string | The name of the scope |

### `#!lua function Set(scope,key,value)` { data-toc-label="Set()" }

!!! quote ""
    Sets data in a datastore.

    **Parameters**

    | Parameter | Type                | Description                                 |
    |-----------|---------------------|---------------------------------------------|
    | scope     | string              | The name of the scope where to set the data |
    | key       | string/integer      | The key of the entry                        |
    | value     | string/integer/bool | The value to set                            |

### `#!lua function Get(scope,key)` { data-toc-label="Get()" }

!!! quote ""
    Get data from the datastore

    **Parameters**

    | Parameter | Type                | Description                                 |
    |-----------|---------------------|---------------------------------------------|
    | scope     | string              | The name of the scope where to get the data |
    | key       | string/integer      | The key of the entry                        |
