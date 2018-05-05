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
    def render_template(self, tpl, context):
        template = ENV.get_template(tpl)
        self.write(template.render(**context))


class PageHandler(TemplateHandler):
    def get(self, page):
        page = page + '.html'
        self.set_header(
          'Cache-Control',
          'no-store, no-cache, must-revalidate, max-age=0')

        conn = psycopg2.connect("dbname=d68rkgeo1f7evn user=tecxzujvjhtuqa password=5bcd1cc1608e591b0902b121c51e59107fc0070321324547528309e67db18aca host=ec2-107-20-249-68.compute-1.amazonaws.com")
        cur = conn.cursor()
        cur.execute("""
                SELECT first_name, last_name, phone, policy_number FROM crm.customer
                JOIN crm.policy_customer on customer_id = crm.customer.id
                JOIN crm.policy on crm.policy.id = crm.policy_customer.policy_id""")
        data = cur.fetchall()
        names = []
        for d in data:
            names.append({'FirstName':d[0],'LastName': d[1], 'PhoneNumber':d[2], 'PolicyNumber':d[3]})
        cur.execute("""
        SELECT c.first_name || ' ' || c.last_name as name, c.phone, round(cast(date_part('day',p.effective_date) as integer),0) as day, cast(p.effective_date as date) as inception_date,
          case when pp.status = 'P' then 'PAID' else 'UNPAID' end as paid, round(p.premium_amt,2) as premium, n.note, co.name as carrier, p.policy_number  FROM crm.customer c
        JOIN crm.note n on n.customer_id = c.id
        JOIN crm.policy_customer pc on pc.customer_id = c.id
        JOIN crm.policy p on p.id = pc.policy_id
        JOIN crm.company co on co.id = p.carrier_id
        JOIN (
          SELECT policy_id, status FROM crm.policy_payment pp
            WHERE date_part('month',payment_date) = date_part('month', now()) and date_part('year',payment_date) = date_part('year', now())
            and status <> 'C') pp on pp.policy_id = p.id
        WHERE pc.active_flag = 1 and pc.primary_flag = TRUE
        ORDER BY date_part('day',p.effective_date);
        """)
        landingquery = cur.fetchall()
        self.render_template(page, {'data': names,'query':landingquery})
        cur.close()
        conn.close()


class FormHandler(TemplateHandler):
    def get(self, page='form'):
      page = page + '.html'
      self.render_template(page, {})


    def post(self):
        fname = self.get_body_argument("first_name", "")
        lname = self.get_body_argument("last_name", "")
        conn = psycopg2.connect("dbname=d68rkgeo1f7evn user=tecxzujvjhtuqa password=5bcd1cc1608e591b0902b121c51e59107fc0070321324547528309e67db18aca host=ec2-107-20-249-68.compute-1.amazonaws.com")
        cur = conn.cursor()

        # here is the money money money bitches!!!!
        # cur.execute("INSERT INTO security.users VALUES (DEFAULT,%s, %s, %s)",(username, hashed_pass.decode('utf-8'), role))

        cur.execute("INSERT INTO crm.customer VALUES (%(first_name)s, %(last_name)s,%s,%s)", (fname,lname, now(), now())
        conn.commit()
        print(fname, lname)
        self.render_template('form-success.html',{})
        success_msg = u"?success=" + tornado.escape.url_escape("Registered customer Successfully")
        self.redirect(u"/success" + success_msg)
        cur.close()
        conn.close()


class frm_submit(TemplateHandler):
    def post(self, data):
        form = self.request.body_arguments
        self.render_template("success.html", {'form': form})


def make_app():
    return tornado.web.Application([
        (r"/static/(.*)", tornado.web.StaticFileHandler, {'path': 'static'}),
        # (r"/(login)", LoginHandler),
        # (r"/(loginsuccess)", LoginHandler),
        # (r"/(register)", RegisterHandler),
        (r"/(tempsearch)", PageHandler),
        (r"/(index)", PageHandler),
        (r"/(form)", FormHandler),
        (r"/(customer)", PageHandler),
        (r"/(success)", frm_submit)
      ], autoreload=True)


if __name__ == "__main__":
    tornado.log.enable_pretty_logging()

    app = make_app()
    PORT = int(os.environ.get('PORT', '8080'))
    app.listen(PORT)
    tornado.ioloop.IOLoop.current().start()