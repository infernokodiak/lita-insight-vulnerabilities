# lita-insight

**lita-insight** is a handler plugin for [Lita](https://www.lita.io/) that lists [CloudInsight](https://www.alertlogic.com/products-services/cloudinsight/) vulnerabilities.

## Installation

This project is not gem as its still in development.  But that doesn't mean you can't use it.  
* Start the [lita development environment](https://github.com/litaio/development-environment).
* Clone the repository into your newly generated project. ` git@github.com:infernokodiak/lita-insight-vulnerabilities.git lita-insight `
* Bundle and Start lita
` bundle install `
` bundle exec lita `

## Configuration


### Required Attributes
` username ` (string) - The username for your cloudinsight account
` password ` (string) - The password for your cloudinsight account

### Example

add the following

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

## Testing

Modify the config.yml file with your credentials.  The specs use the ` config.username ` and ` config.password ` from that file within the Insight class.

` bundle exec rspec spec `

## Troubleshooting

When creating a new handler using the generator, I ran into an issue.  The resolution was that git needed to be installed.

```
sudo su -
apt-get install git
apt-get install vim
```
