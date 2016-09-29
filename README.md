SBIF API
===================


This gem is a wrapper for the SBIF in Chile, an institution in charge of overseeing the operation of banks and financial institutions.

----------


Getting Started
-------------

First install the gem by typing:

```shell
gem install sbifapi
```

Initialize a SBIF object:

```ruby
require 'sbif'
sbif = SBIF.new(<your_api_key>)
```

Get UF value:

```ruby
sbif.uf

Response:
{:Valor=>"26.224,30"}
```

Get USD value:

```ruby
sbif.dolar

Response:
{:Valor=>"662,27"}
```

Get Euro value:

```ruby
sbif.euro

Response:
{:Valor=>"742,04"}
```

Get IPC value:

```ruby
sbif.ipc

Response:
{:Valor=>"0,0"}
```

Get UTM value:

```ruby
sbif.utm

Response:
{:Valor=>"45,999"}
```

Get TMC value:

```ruby
sbif.tmc

Response:
Array with all the maximum conventional rates.
```
