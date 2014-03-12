# Tell Swag where to look for partials
Swag.Config.partialsPath = '../views/templates/'
Swag.registerHelpers()

# Put your handlebars.js helpers here.
Handlebars.registerHelper 'trunc', (str) ->
    if (str.length > 200)
        return str.replace(/<(?:.)*?>/gm, '').substring(0, 200) + '...';
    return str