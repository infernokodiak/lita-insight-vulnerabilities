# lita-insight

**lita-insight** is a handler plugin for [Lita](https://www.lita.io/) that lists [CloudInsight](https://www.alertlogic.com/products-services/cloudinsight/) vulnerabilities.

## Installation

Add lita-insight to your Lita instance's Gemfile:

``` ruby
gem "lita-insight"
```

## Configuration

### Required Attributes
` username ` (string) - The username for your cloudinsight account
` password ` (string) - The password for your cloudinsught account

### Example

``` ruby
Lita.configure do |config|
  config.handlers.insight.username = "your.email@domain.com"
  config.handlers.insight.password = "your_password"
end
```

## Usage
List All Vulnerabilites

```
Lita: vulnerabilities
```
