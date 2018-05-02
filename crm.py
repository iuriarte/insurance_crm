import tornado.ioloop
import tornado.web
import tornado.log

import os
import bcrypt
import psycopg2
import json

from jinja2 import \
  Environment, PackageLoader, select_autoescape

ENV = Environment(
  loader=PackageLoader('myapp', 'templates'),
  autoescape=select_autoescape(['html', 'xml'])
)

class TemplateHandler(tornado.web.RequestHandler):
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
    
    conn = psycopg2.connect("dbname=Kappa user=postgres")
    cur = conn.cursor()
    cur.execute("SELECT name FROM customerstemp")
    data = cur.fetchall()
    names = []
    for d in data:
      names.append(d[0])
    print(names)
    self.render_template(page, {'data': names})
    cur.close()
    conn.close()


class LoginHandler(TemplateHandler):
  def get(self, page='login'):
    page = page + '.html'
    self.render_template(page, {})

  def post(self):
    username = self.get_body_argument('username', None)
    password = self.get_body_argument("password", None)
    conn = psycopg2.connect("dbname=Kappa user=postgres")
    cur = conn.cursor()
    cur.execute("SELECT username, password FROM users WHERE username = %s", [username])
    user = cur.fetchone()
    print(user[1].encode('utf-8'))
    # hashed_pass = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    if user and user[1] and bcrypt.checkpw(password.encode('utf-8'), user[1].encode('utf-8')):
      # self.set_current_user(username)
      self.render_template('loginsuccess.html', {})
    else:
      error_msg = u"?error=" + tornado.escape.url_escape("Login incorrect.")
      self.redirect(u"/login" + error_msg)

    cur.close()
    conn.close()

  # def set_current_user(self, user):
  #   print("setting "+user)
  #   if user:
  #     self.set_secure_cookie("user", tornado.escape.json_encode(user))
  #   else:
  #     self.clear_cookie("user")


class RegisterHandler(LoginHandler):
  def get(self, page='register'):
    page = page + '.html'
    self.render_template(page, {})

  def post(self, err):
    username = self.get_body_argument('username', None)
    role = self.get_body_argument('role', None)
    conn = psycopg2.connect("dbname=Kappa user=postgres")
    cur = conn.cursor()
    cur.execute("SELECT username, password FROM users WHERE username = %s", [username])
    already_taken = cur.fetchone()
    if already_taken:
      error_msg = u"?error=" + tornado.escape.url_escape("Login name already taken")
      self.redirect(u"/login" + error_msg)
    else:
      password = self.get_body_argument("password", None)
      password_string = str(password)
      hashed_pass = bcrypt.hashpw(password_string.encode('utf-8'), bcrypt.gensalt(12))
      print(hashed_pass.decode('utf-8'))
      # bcrypt.checkpw(password.encode('utf-8'), hashed_password.encode('utf-8'))
      cur.execute("INSERT INTO users VALUES (DEFAULT,%s, %s, %s)",(username, hashed_pass.decode('utf-8'), role))
      conn.commit()
      success_msg = u"?success=" + tornado.escape.url_escape("Registered User Successfully")
      self.redirect(u"/register" + success_msg)
      cur.close()
      conn.close()
class frm_submit(TemplateHandler):
  def post(self, data):
    
    form = self.request.body_arguments
    self.render_template("success.html", {'form': form})

  # def get(self, page):
  #   page = page +'.html'
  #   self.set_header(
  #     'Cache-Control',
  #     'no-store, no-cache, must-revalidate, max-age=0')
  
  



# class PageHandler(TemplateHandler):
#   def get(self, page):
   
#     page = page + '.html'
#     self.set_header(
#       'Cache-Control',
#       'no-store, no-cache, must-revalidate, max-age=0')
#     self.render_template(page,{})

def make_app():
  return tornado.web.Application([
    (r"/static/(.*)" ,tornado.web.StaticFileHandler, {'path': 'static'}),
    (r"/(login)", LoginHandler),
    (r"/loginsuccess", LoginHandler),
    (r"/(register)", RegisterHandler),
    (r"/", MainHandler),
    (r"/(tempsearch)", PageHandler)
    (r"/(form)", PageHandler),
    (r"/(index)", PageHandler),
    (r"/(success)", frm_submit)
  ], autoreload=True)

if __name__ == "__main__":
  tornado.log.enable_pretty_logging()

  app = make_app()
  PORT=int(os.environ.get('PORT', '8888'))
  app.listen(PORT)
  tornado.ioloop.IOLoop.current().start()
