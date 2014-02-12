# Polyglot for Discourse

* Specify a default locale for each domain name
* Add current locale as preference when user registers

Install
-------
```
$ cd plugins
$ git clone https://github.com/joallard/discourse-polyglot.git polyglot
```

Restart your server.

There will be a new setting in "polyglot", `domain_locales`. This
contains a YAML hash of which domains should be in which language.

Config
------
### Example 1: Simple bilingual site
It is assumed your main language is the default locale.

For the other domain, you can then write:

    forum.enfrancais.ca: fr

### Example 2: Two other languages

    {aqui.espanol.mx: es, portuguese.endpoint.br: pt}


I recommend you try parsing your YAML before using it as config:

```irb
$ irb -ryaml

irb(main):001:0> YAML.load 'forum1.com: fr, forum2.com: es'
Psych::SyntaxError: (<unknown>): mapping values are not allowed in this context at line 1 column 27
    from /.rbenv/versions/2.0.0-p247/lib/ruby/2.0.0/psych.rb:205:in `parse'
    from /.rbenv/versions/2.0.0-p247/lib/ruby/2.0.0/psych.rb:205:in `parse_stream'
    from /.rbenv/versions/2.0.0-p247/lib/ruby/2.0.0/psych.rb:153:in `parse'
    from /.rbenv/versions/2.0.0-p247/lib/ruby/2.0.0/psych.rb:129:in `load'
    from (irb):1
    from /.rbenv/versions/2.0.0-p247/bin/irb:12:in `<main>'

irb(main):002:0> YAML.load '{forum1.com: fr, forum2.com: es}'
=> {"forum1.com"=>"fr", "forum2.com"=>"es"}
```

