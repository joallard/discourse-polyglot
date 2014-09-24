# Polyglot for Discourse
This plugin allows you to set a locale for each domain your forum is
hosted on. For example, you might want to have a French locale by
default on your French domain; and an English default locale on your
main domain.

It also sets the user-preferred locale as the present one when the user
registers.

Install
-------
Restart your server.

There will be a new setting in "polyglot", `domain_locales`. This
contains a YAML hash of which domains should be in which language.

### Docker
Add the git-clone command in the after-code hooks in
`containers/app.yml`. It should look like this:

```yml
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
          - git clone https://github.com/joallard/discourse-polyglot.git  # This one
```

### Naked setup (in Rails dir)
```
$ cd plugins
$ git clone https://github.com/joallard/discourse-polyglot.git polyglot
```

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

