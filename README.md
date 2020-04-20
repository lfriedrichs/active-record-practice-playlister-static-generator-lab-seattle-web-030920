# Static Playlister on ActiveRecord

## Welcome to the Web

In this lab, you're going to make some sweet static websites.  Static means no
server is needed, so you're not using Rails or Sinatra.  You're going to use
ActiveRecord and [ERB][] to generate regular html web pages.

[ERB]: http://ruby-doc.org/stdlib-2.1.2/libdoc/erb/rdoc/ERB.html

Using ActiveRecord and ERB you'll create [ERB
template](http://www.stuartellis.eu/articles/erb/) files that end in `.html.erb`
where you can call your ActiveRecord models - `Artist`, `Genre`, and `Song` - to
access all the information stored in your database.

## ActiveRecord Associations

In this lab, you'll be recreating the basic functionality of Playlister using
[ActiveRecord associations][]. The point of your association is to let your
program know that an artist has many songs and therefore those songs belong to
that artist. An artist will also have many genres, which it will know of through
songs, so `artist.genres` will return all of the artist's genres.

[ActiveRecord associations]: http://guides.rubyonrails.org/association_basics.html

You'll have three models: `Artist`, `Song`, and `Genre`. The `Artist` and
`Genre` models will each know about its associated songs and each other.  To
create these [associations][] you will need to write proper migrations as well
as ActiveRecord macros, which are special methods created by ActiveRecord's DSL.

[associations]: http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association

The model tests will be calling methods that your models will have by default
if your associations are correctly defined. You do not need to write those
methods. Once your associations are defined you can run `rake db:seed` to
seed your database with sample data.

#### Creating Your Associations

- Create your models in `app/models`
- Your models will need an instance method called `to_slug` for making urls
  - ex. `an_artist.to_slug #=> kanye-west`
- Write migrations for your models and associations in `db/migrations`

## ERB and Static HTML Sites

Embedded Ruby (ERB) is a way of running Ruby in non `.rb` files. You'll be
making your own generator that will read an html.erb file to generate many
static pages.

### Folder structure

Your template files will be in the following structure:

```text
app/views
├── artists
│   ├── index.html.erb
│   └── show.html.erb
├── genres
│   ├── index.html.erb
│   └── show.html.erb
├── index.html.erb
└── songs
    ├── index.html.erb
    └── show.html.erb
```

Your processed files will be in the following structure:

```text
_site
├── artists
│   └── index.html
├── genres
│   └── index.html
├── index.html
└── songs
    └── index.html
```

#### Index Pages

There will be index pages for the top level as well as for each model; the index pages
for the models will list all instances of that model

- Your index pages should be called `index.html.erb`
- The index page for the top level of `app/views/` should have a link to each model and 
a count of total instances
    - ex. `Artists -  42`
- Each model will have an index page in its appropriate folder in the `app/views` directory 
which lists every instance and links to each instance's show page

#### Show Pages

Each model will have a show page in `app/views/<model>/` that renders information specific to that instance.

- The show pages should be called `show.html.erb`
- `Artist` show pages will have the instance's name and will list and link to its genres and songs.
- `Genre` show pages will have the instance's name and will list and link to its artists and songs.
- `Song` show pages will state the instance's name and the names of and links to its artist and genre.

#### Site Generator

You will need a class whose sole purpose is generating the static pages.

- It should accept a path upon initialize that indicates where the files it generates will be saved
- It should use the ERB files from `app/views/` to generate all static pages
- It will live in `lib/support`

## Helpful Rake Tasks

This lab provides you with several Rake tasks to help you along the way.

- `rake db:migrate` will automatically create the database and run your migrations; all you need to do is write the migrations
- `rake db:seed` will automatically parse the songs and seed your database; no work is required beyond migrations
- `rake console` will load a pry session with your environment loaded to play with the database
- `rake generate` will run the `generate` method of your site generator once it is made

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/playlister-static-generator-with-ar' title='Static Playlister on ActiveRecord'>Static Playlister on ActiveRecord</a> on Learn.co and start learning to code for free.</p>
