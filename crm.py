#Clone hjs-crm
import tornado.ioloop
import tornado.web
import tornado.log
import os

import queries

from jinja2 import \
  Environment, PackageLoader, select_autoescape

ENV = Environment(
  loader=PackageLoader('myapp', 'templates'),
  autoescape=select_autoescape(['html', 'xml'])
)

class TemplateHandler(tornado.web.RequestHandler):
  def initialize(self):
    self.session = queries.Session(os.environ.get('DATABASE_URL', 'postgresql://postgres@localhost:5432/kappa'))
    
  def render_template (self, tpl, context):
    template = ENV.get_template(tpl)
    self.write(template.render(**context))

class MainHandler(TemplateHandler):
  def get(self):
    self.set_header(
      'Cache-Control',
      'no-store, no-cache, must-revalidate, max-age=0')
    self.render_template("index.html", {})

class PageHandler(TemplateHandler):
  def get(self, page):
   
    page = page + '.html'
    self.set_header(
      'Cache-Control',
      'no-store, no-cache, must-revalidate, max-age=0')
    self.render_template(page,{})

#handler for web form post into db
class MyHandler(TemplateHandler):
  def post(self):
    fname  = self.get_body_argument("first_name", "")
    lname = self.get_body_argument("last_name","")
    
    print(self.request.body_arguments)
#  .... code for updating DB
    #for loop
    self.session.query("INSERT INTO crm.customer (first_name, last_name,created_date, updated_date) VALUES (%(first_name)s, %(last_name)s, now(), now());", {'first_name': fname, 'last_name': lname})
    print(fname, lname)
    self.render_template('form-success.html',{})

def make_app():
  return tornado.web.Application([
    (r"/static/(.*)" ,tornado.web.StaticFileHandler, {'path': 'static'}),
    (r"/", MainHandler),
    (r"/(form)", PageHandler),
    (r"/submit", MyHandler),
    #(r"/(cinfo)", PageHandler),
    (r"/(index)", PageHandler)
  ], autoreload=True)

if __name__ == "__main__":
  tornado.log.enable_pretty_logging()

  app = make_app()
  PORT=int(os.environ.get('PORT', '8080'))
  app.listen(PORT)
  tornado.ioloop.IOLoop.current().start()
