import os
import bs4
from flask import *
import pymysql
import re
import nltk
import requests
from werkzeug.utils import secure_filename
from src.classifier import CLASSIFIER
app=Flask(__name__)
app.secret_key="a"
# from src.classifier import *
con=pymysql.connect(host='localhost',user='root',passwd='',port=3306,db='productreview')
cmd=con.cursor()
path1=r"./static/product"

import functools
def login_required(func):
    @functools.wraps(func)
    def secure_function():
        if "loginid" not in session:
            return redirect("/")
        return func()
    return secure_function
@app.route('/logout')
def logout():
    session.clear()
    return render_template("analyze/analyzer.html")
@app.route('/')
def start():
    return render_template("analyze/analyzer.html")
@app.route('/login1')
def login1():
    return render_template("login.html")
@app.route('/srch')
def srch():
    return render_template("analyze/analyzer.html")
@app.route('/srch1')
@login_required
def srch1():
    return render_template("res.html")
# def amazon_review(link):
#     # amazone
#     res1 = requests.get(link)
#     # print(res1.text)
#     resn = []
#     row = []
#
#     # print(res1.text)
#     import re
#     clean = re.compile('<.*?>')
#     result = res1.text.split('<span class="a-size-base">')
#     print(len(result))
#     for i in range(11, len(result) - 1):
#         review = result[i].split('</span>')[0]
#         review = re.sub(clean, "", review).replace("\n", " ")
#         print(review)
#         print("=========================")
#
# def flipkart(link):
#
#
#
#
#
#     # flipkart
#     res1 = requests.get(link)
#     # print(res1.text)
#     resn = []
#     row = []
#
#     # print(res1.text)
#     import re
#     clean = re.compile('<.*?>')
#     result=res1.text.split('<div class="t-ZTKy">')
#     print(len(result))
#     for i in range(1,len(result)):
#         review=result[i].split('</div>')[0]
#         review = re.sub(clean, "", review).replace("\n"," ")
#         print(review)
#         print("=========================")
@app.route('/createacc')
def createacc():
    return render_template("signup.html")
@app.route('/search')
def search():
    cmd.execute("SELECT * FROM product ")
    val=cmd.fetchall()
    return render_template("FORM3.html",car=val)
@app.route('/search1',methods=['post'])
def search1():
    pid=request.form['product']
    cmd.execute("SELECT review.*,product.* FROM review JOIN product ON review.product_id=product.pid WHERE review.product_id='"+str(pid)+"'")
    s=cmd.fetchall()
    cmd.execute("SELECT * FROM product ")
    val = cmd.fetchall()
    return render_template("FORM3.html",car=val,v=s)
@app.route('/productdetails')
def productdetails():
    return render_template("form4.html")
@app.route('/fake')
def fake():
    cmd.execute("SELECT `product`.`product_name`,`fake`.`review` FROM `fake` JOIN `product` ON `product`.`pid`=`fake`.pid WHERE `fake`.`status`='Fake Review'")
    s=cmd.fetchall()
    return render_template("fakes.html",v=s)
@app.route('/updateproduct')
def updateproduct():
    id=request.args.get('id')
    session['pid']=id
    cmd.execute("SELECT * FROM product WHERE pid='"+str(id)+"'")
    res=cmd.fetchone()
    return render_template("form6.html",val=res)
@app.route('/updateproduct1',methods=['post'])
def updateproduct1():
    pname=request.form['textfield']
    description=request.form['textarea']
    quantity=request.form['textfield3']
    price=request.form['textfield2']
    cmd.execute("update product set product_name='"+pname+"',description='"+description+"',quantity='"+quantity+"',price='"+price+"' where pid='"+str(session['pid'])+"'")
    con.commit()
    return redirect('/viewproduct')
@app.route('/deleteproduct')
def deleteproduct():
    return render_template("form7.html")
@app.route('/edit')
def edit():
    return render_template("form7.html")

@app.route('/home')
def home():
    return render_template("home.html")

@app.route('/viewfeedback')
@login_required
def viewfeedback():
    cmd.execute("SELECT registration.name,feedback.* FROM registration JOIN feedback ON registration.lid=feedback.lid ")
    s=cmd.fetchall()
    return render_template("viewfeedback.html",val=s)

@app.route('/highrated')
def highrated():
    cmd.execute("SELECT `product`.`product_name`,product.fliplink,product.amazonlink,AVG(`review`.`rating`) AS rating  FROM `product` JOIN `review` ON `product`.`pid`=`review`.`product_id` GROUP BY product.pid HAVING rating>2.5 ORDER BY rating DESC")
    s=cmd.fetchall()
    return render_template("highrated.html",val=s)
@app.route('/highrated1')
def highrated1():
    cmd.execute("SELECT `product`.`product_name`,product.fliplink,product.amazonlink,AVG(`review`.`rating`) AS rating  FROM `product` JOIN `review` ON `product`.`pid`=`review`.`product_id` GROUP BY product.pid HAVING rating>2.5 ORDER BY rating DESC")
    s=cmd.fetchall()
    return render_template("highrated1.html",val=s)
@app.route('/addproduct')
def addproduct():
    return render_template("addproduct.html")
@app.route('/changeimage')
def changeimage():
    return render_template("Changeimage.html")
@app.route('/complaint')
@login_required
def complaint():
    return render_template("complaint.html")
@app.route('/feedback')
@login_required
def feedback():
    return render_template("form5.html")
@app.route('/graph')
@login_required
def graph():
    import numpy as np
    import matplotlib.pyplot as plt
    # Fecthing Data From mysql to my python progame
    cmd.execute("SELECT `product_url`.`product`,AVG(`review`.`rating`) AS rating  FROM `product_url` JOIN `review` ON `product_url`.`id`=`review`.`product_id` where product_url.uid='"+str(session['loginid'])+"' GROUP BY product_url.id ")
    result = cmd.fetchall()
    PRODUCTS = []
    RATING = []
    for i in result:
        PRODUCTS.append(i[0])
        RATING.append(i[1])
    print("PRODUCTS = ", PRODUCTS)
    print("RATING = ", RATING)
    # Visulizing Data using Matplotlib
    plt.ylim(0,5)
    plt.bar(PRODUCTS, RATING)
    plt.xlabel("PRODUCTS ---------------------------> x-axis")
    plt.ylabel("RATING ----------------------------> Y-axis")
    plt.title("GRAPH")
    plt.show()
    return redirect('/userhome')
@app.route('/graph1')
@login_required
def graph1():
    import numpy as np
    import matplotlib.pyplot as plt
    # Fecthing Data From mysql to my python progame
    cmd.execute("SELECT `product_url`.`product`,AVG(`review`.`rating`) AS rating  FROM `product_url` JOIN `review` ON `product_url`.`id`=`review`.`product_id` where product_url.uid=0 GROUP BY product_url.id ")
    result = cmd.fetchall()
    PRODUCTS = []
    RATING = []
    for i in result:
        PRODUCTS.append(i[0])
        RATING.append(i[1])
    print("PRODUCTS = ", PRODUCTS)
    print("RATING = ", RATING)
    # Visulizing Data using Matplotlib
    plt.ylim(0,5)
    plt.bar(PRODUCTS, RATING)
    plt.xlabel("PRODUCTS ---------------------------> x-axis")
    plt.ylabel("RATING ----------------------------> Y-axis")
    plt.title("GRAPH")
    plt.show()
    return redirect('/home')
@app.route('/login',methods=['post'])
def login():
    uname=request.form['textfield']
    passwd=request.form['textfield2']
    cmd.execute("SELECT * FROM `login` WHERE `username`='"+uname+"' AND `password`='"+passwd+"'")
    res=cmd.fetchone()
    if res is None:
        return '''<script>alert('Invalid username or password');window.location='/login1'</script>'''
    elif res[3]=='admin':
           return redirect('/home')
    elif res[3]=='user':
            session['loginid']=res[0]
            return redirect('/userhome')
    else:
        return '''<script>alert('Invalid username or password');window.location='/login1'</script>'''
@app.route('/addproduct1',methods=['post'])
def addproduct1():
    pname=request.form['textfield']
    image=request.files['file']
    img=secure_filename(image.filename)
    image.save(os.path.join(path1,img))
    description=request.form['textarea']
    quantity=request.form['textfield3']
    price=request.form['textfield2']
    fliplink=request.form['textfield4']
    amazonlink=request.form['textfield5']
    cmd.execute("INSERT INTO product VALUES(null,'"+pname+"','"+img+"','"+quantity+"','"+description+"','"+price+"','"+fliplink+"','"+amazonlink+"')")
    pid=con.insert_id()
    # amazon_review(amazonlink,pid)
    # flipkart(fliplink,pid)
    con.commit()
    return '''<script>alert('Product Entered Successfully');window.location='/viewproduct'</script>'''
@app.route('/viewproduct')
def viewproduct():
    cmd.execute("select * from product")
    res=cmd.fetchall()
    return render_template("form7.html",val=res)
@app.route('/changeimage1')
def changeimage1():
    id = request.args.get('id')
    session['pid2'] = id
    print(session['pid2'])
    return render_template("changeimage.html")
@app.route('/updateimage',methods=['post'])
def updateimage():
    image = request.files['file']
    img = secure_filename(image.filename)
    image.save(os.path.join(path1, img))
    cmd.execute("UPDATE product SET image='"+img+"' WHERE  pid='"+str(session['pid2'])+"'")
    con.commit()
    return redirect('/viewproduct')
@app.route('/deleteproduct1')
def deleteproduct1():
    id = request.args.get('id')
    cmd.execute("DELETE FROM `product` WHERE `product`.`pid`='"+str(id)+"'")
    con.commit()
    return redirect('/viewproduct')
@app.route('/register',methods=['post'])
def register():
  try:
    name=request.form['textfield']
    email=request.form['textfield2']
    phone=request.form['textfield3']
    setpassword=request.form['textfield4']
    confirm=request.form['textfield5']
    if setpassword==confirm:
        cmd.execute ("INSERT INTO login VALUES(null,'"+email+"','"+setpassword+"','user')")
        id=con.insert_id()
        cmd.execute("INSERT INTO registration VALUES(null,'"+str(id)+"','"+name+"','"+phone+"','"+email+"')")
        con.commit()
        return '''<script>alert(' Registered Successfully');window.location='/'</script>'''
    else:
        return '''<script>alert(' Invalid Entry');window.location='/'</script>'''
  except:
      return '''<script>alert(' Username already Exists');window.location='/createacc'</script>'''
@app.route('/userhome')
@login_required
def userhome():
    return render_template('analyzer1.html')
@app.route('/comprply')
@login_required
def comprply():
    cmd.execute("select * from complaint")
    s=cmd.fetchall()
    return render_template('view complaint1.html',val=s)
@app.route('/history')
@login_required
def history():
    cmd.execute("select * from product_url where uid='"+str(session['loginid'])+"'")
    s=cmd.fetchall()
    return render_template('history.html',val=s)
@app.route('/complaint1',methods=['post'])
@login_required
def complaint1():
    complaint=request.form['textarea']
    cmd.execute ("INSERT INTO complaint VALUES(null,'"+str(session['loginid'])+"','"+complaint+"',curdate(),'pending')")
    con.commit()
    return '''<script>alert(' Complaint Entered Successfully');window.location='userhome'</script>'''
@app.route('/feedback1',methods=['post'])
@login_required
def feedback1():
    feedback=request.form['textarea']
    cmd.execute ("INSERT INTO feedback VALUES(null,'"+str(session['loginid'])+"','"+feedback+"',curdate())")
    con.commit()
    return '''<script>alert(' Thank You For Your Feedback');window.location='userhome'</script>'''
@app.route('/viewcomplaint')
@login_required
def viewcomplaint():
    cmd.execute("SELECT registration.name,complaint.complaint,complaint.date,complaint.c_id FROM registration JOIN complaint ON registration.lid=complaint.lid WHERE complaint.reply='pending' ")
    x=cmd.fetchall()
    return render_template("view complaint.html",val=x)
@app.route('/replycomp')
@login_required
def replycomp():
    id=request.args.get('id')
    session['id']=id
    return render_template("replycomp.html")

@app.route('/sendreply',methods=['post'])
@login_required
def sendreply():
    reply=request.form['textfield']
    cmd.execute("UPDATE complaint SET reply='"+reply+"' WHERE c_id='"+str(session['id'])+"'")
    con.commit()
    return '''<script>alert('  Replied to Complaint');window.location='viewcomplaint'</script>'''

# def amazon_review(amazonlink,pid):
#   try:
#     # amazone
#     res1 = requests.get(amazonlink)
#     print(res1)
#     # print(res1.text)
#     resn = []
#     row = []
#     # print(res1.text)
#     import re
#     clean = re.compile('<.*?>')
#     result = res1.text.split('<span class="a-size-base">')
#     print(len(result))
#     for i in range(11, len(result) - 1):
#         review = result[i].split('</span>')[0]
#         review = re.sub(clean, "", review).replace("\n", " ")
#         print(review)
#         print("=========================")
#     from nltk.sentiment.vader import SentimentIntensityAnalyzer
#     pstv = 0
#     ngtv = 0
#     ntl = 0
#     sid = SentimentIntensityAnalyzer()
#     ss = sid.polarity_scores(review)
#     a = float(ss['pos'])
#     b = float(ss['neg'])
#     c = float(ss['neu'])
#     rating = 2.5
#     if (ss['neu'] > ss['pos'] and ss['neu'] > ss['neg']):
#         pass
#     if (ss['neg'] > ss['pos']):
#         negva = 5 - (5 * ss['neg'])
#         if negva > 2.5:
#             negva = negva - 2.5
#         rating = negva
#     else:
#         negva = 5 * ss['pos']
#         if negva < 2.5:
#             negva = negva + 2.5
#         rating = negva
#     cmd.execute("INSERT INTO review values(null, '"+str(pid)+"','"+review+"','"+str(rating)+"')")
#     con.commit()
#     return 'ok'
#   except:
#       return ''
@app.route('/flipkart1',methods=['post'])
def flipkart1():
 pid=0
 try:
    cl = CLASSIFIER()
    fake = 0
    pc = 0
    cnt = 0
    avgrating = []
    # flipkart
    amazonlink = request.form['url']
    pname=request.form['pname']
    print(amazonlink,"ressssssssssssssssssssssssss")
    cmd.execute("INSERT INTO `product_url` VALUES(NULL,'"+pname+"','"+amazonlink+"','0')")
    pid=con.insert_id()
    res1 = requests.get(amazonlink)
    print(res1)
    # print(res1.text)
    resn = []
    row = []
    # print(res1.text)
    import re
    clean = re.compile('<.*?>')
    result=res1.text.split('<div class="t-ZTKy">')
    print(len(result),"=============")
    lis=[]
    cnt=0

    for i in range(1,len(result)):
        try:
            review=result[i].split('</div>')[0]
            review = re.sub(clean, "", review).replace("\n"," ")
            print(review,"===========================================")
            lis.append(review)
            cnt=cnt+len(lis)
            print(cnt,"cnttt*******************************************")
            from nltk.sentiment.vader import SentimentIntensityAnalyzer
            pstv = 0
            ngtv = 0
            ntl = 0
            sid = SentimentIntensityAnalyzer()
            ss = sid.polarity_scores(review)
            a = float(ss['pos'])
            b = float(ss['neg'])
            c = float(ss['neu'])
            rating = 2.5
            if (ss['neu'] > ss['pos'] and ss['neu'] > ss['neg']):
                pass
            if (ss['neg'] > ss['pos']):
                negva = 5 - (5 * ss['neg'])
                if negva > 2.5:
                    negva = negva - 2.5
                rating = negva
            else:
                negva = 5 * ss['pos']
                if negva < 2.5:
                    negva = negva + 2.5
                rating = negva
            if rating>=2.5:
                pc=pc+1
            avgrating.append(rating)
            resultt=cl.run(review)
            print(resultt,"++++++++++++++++++")
            if resultt=="fake":
                print("hiiiiiiiiiiiiiiiiiiiiii")
                fake=fake+1
            import re
            cll = re.compile('\W')
            review = re.sub(cll, "", review)
            cmd.execute(
                "INSERT INTO `review` VALUES(NULL,'" + str(pid) + "','" + str(review) + "','" + str(rating) + "')")
            con.commit()
        except Exception as e:
            print("looooooooooooooooooooo++++++++++++++++++++++++", e)
    for ii in range(2,10):
        res1 = requests.get(amazonlink+"&page="+str(ii))
        print(res1)
        # print(res1.text)
        resn = []
        row = []
        # print(res1.text)
        import re
        clean = re.compile('<.*?>')
        result = res1.text.split('<div class="t-ZTKy">')
        print(len(result), "=============")
        lis = []
        cl = CLASSIFIER()

        for i in range(1, len(result)):
            try:
                review = result[i].split('</div>')[0]
                review = re.sub(clean, "", review).replace("\n", " ")
                print(review, "===========================================")
                lis.append(review)
                cnt =cnt+ len(lis)
                print(cnt, "cnttt*******************************************")
                from nltk.sentiment.vader import SentimentIntensityAnalyzer
                pstv = 0
                ngtv = 0
                ntl = 0
                sid = SentimentIntensityAnalyzer()
                ss = sid.polarity_scores(review)
                a = float(ss['pos'])
                b = float(ss['neg'])
                c = float(ss['neu'])
                rating = 2.5
                if (ss['neu'] > ss['pos'] and ss['neu'] > ss['neg']):
                    pass
                if (ss['neg'] > ss['pos']):
                    negva = 5 - (5 * ss['neg'])
                    if negva > 2.5:
                        negva = negva - 2.5
                    rating = negva
                else:
                    negva = 5 * ss['pos']
                    if negva < 2.5:
                        negva = negva + 2.5
                    rating = negva
                if rating >= 2.5:
                    pc = pc + 1
                avgrating.append(rating)
                resultt = cl.run(review)
                print(resultt, "++++++++++++++++++")
                if resultt == "fake":
                    print("hiiiiiiiiiiiiiiiiiiiiii")
                    fake = fake + 1
                else:
                    import re
                    cll = re.compile('\W')
                    review = re.sub(cll, "", review)
                    cmd.execute(
                        "INSERT INTO `review` VALUES(NULL,'" + str(pid) + "','" + str(review) + "','" + str(rating) + "')")
                    con.commit()
            except Exception as e:
                print("looooooooooooooooooooo++++++++++++++++++++++++", e)
    cmd.execute("SELECT `product_url`.`product`,ROUND(AVG(`review`.`rating`)) AS rating  FROM `product_url` JOIN `review` ON `product_url`.`id`=`review`.`product_id` WHERE `product_url`.id='"+str(pid)+"' GROUP BY product_url.id ")
    rate=cmd.fetchone()
    cmd.execute(
        "SELECT `product_url`.`product` FROM `product_url` JOIN `review` ON `product_url`.`id`=`review`.`product_id` WHERE `product_url`.id='" + str(
            pid) + "'")
    rr = cmd.fetchall()
    cnt = len(rr)
    return render_template('res1.html',count=cnt,pos=pc,neg=cnt-pc,rate=rate[1],prod=pname,spam=fake)
 except Exception as e:
     print("hiiiiiiiiiiiiiiiiiiiiii++++++++++++++++++++++++",e)
     cmd.execute(
         "SELECT `product_url`.`product`,ROUND(AVG(`review`.`rating`)) AS rating  FROM `product_url` JOIN `review` ON `product_url`.`id`=`review`.`product_id` WHERE `product_url`.id='" + str(
             pid) + "' GROUP BY product_url.id ")
     rate = cmd.fetchone()
     return render_template('res1.html', count=cnt, pos=pc, neg=cnt-pc, rate=0, prod=pname, spam=fake)

@app.route('/flipkart2', methods=['post'])
@login_required
def flipkart2():
     try:
         # flipkart
         amazonlink = request.form['url']
         pname = request.form['pname']
         print(amazonlink, "ressssssssssssssssssssssssss")
         cmd.execute("INSERT INTO `product_url` VALUES(NULL,'" + pname + "','" + amazonlink + "','"+str(session['loginid'])+"')")
         pid = con.insert_id()

         lis = []
         cl = CLASSIFIER()
         fake = 0
         pc = 0
         cnt = 0
         avgrating = []

         pstv = 0
         ngtv = 0
         ntl = 0

         res1 = requests.get(amazonlink)
         print(res1)
         # print(res1.text)
         resn = []
         row = []

         # print(res1.text)
         import re
         clean = re.compile('<.*?>')
         result = res1.text.split('<div class="t-ZTKy">')
         print(len(result), "=============")

         for i in range(1, len(result)):
             try:
                 review = result[i].split('</div>')[0]
                 review = re.sub(clean, "", review).replace("\n", " ")
                 print(review, "===========================================")
                 lis.append(review)
                 cnt =cnt+ len(lis)
                 print(cnt, "cnttt*******************************************")
                 from nltk.sentiment.vader import SentimentIntensityAnalyzer

                 sid = SentimentIntensityAnalyzer()
                 ss = sid.polarity_scores(review)
                 a = float(ss['pos'])
                 b = float(ss['neg'])
                 c = float(ss['neu'])
                 rating = 2.5
                 if (ss['neu'] > ss['pos'] and ss['neu'] > ss['neg']):
                     pass
                 if (ss['neg'] > ss['pos']):
                     negva = 5 - (5 * ss['neg'])
                     if negva > 2.5:
                         negva = negva - 2.5
                     rating = negva
                 else:
                     negva = 5 * ss['pos']
                     if negva < 2.5:
                         negva = negva + 2.5
                     rating = negva
                 if rating >= 2.5:
                     pc = pc + 1
                 avgrating.append(rating)
                 resultt = cl.run(review)
                 print(resultt, "++++++++++++++++++")
                 if resultt == "fake":
                     print("hiiiiiiiiiiiiiiiiiiiiii")
                     fake = fake + 1
                 import re
                 cll = re.compile('\W')
                 review = re.sub(cll, " ", review)
                 cmd.execute(
                     "INSERT INTO `review` VALUES(NULL,'" + str(pid) + "','" + str(review) + "','" + str(rating) + "')")
                 con.commit()
             except Exception as e:
                 print("looooooooooooooooooooo++++++++++++++++++++++++", e)

         for ii in range(2,10):
             res1 = requests.get(amazonlink+"&page="+str(ii))
             print(res1)
             # print(res1.text)
             resn = []
             row = []

             # print(res1.text)
             import re
             clean = re.compile('<.*?>')
             result = res1.text.split('<div class="t-ZTKy">')
             print(len(result), "=============")

             for i in range(1, len(result)):
                 try:
                     review = result[i].split('</div>')[0]
                     review = re.sub(clean, " ", review).replace("\n", " ")
                     print(review, "===========================================")
                     lis.append(review)
                     cnt = cnt + len(lis)
                     print(cnt, "cnttt*******************************************")
                     from nltk.sentiment.vader import SentimentIntensityAnalyzer

                     sid = SentimentIntensityAnalyzer()
                     ss = sid.polarity_scores(review)
                     a = float(ss['pos'])
                     b = float(ss['neg'])
                     c = float(ss['neu'])
                     rating = 2.5
                     if (ss['neu'] > ss['pos'] and ss['neu'] > ss['neg']):
                         pass
                     if (ss['neg'] > ss['pos']):
                         negva = 5 - (5 * ss['neg'])
                         if negva > 2.5:
                             negva = negva - 2.5
                         rating = negva
                     else:
                         negva = 5 * ss['pos']
                         if negva < 2.5:
                             negva = negva + 2.5
                         rating = negva
                     if rating >= 2.5:
                         pc = pc + 1
                     avgrating.append(rating)
                     resultt = cl.run(review)
                     print(resultt, "++++++++++++++++++")
                     if resultt == "fake":
                         print("hiiiiiiiiiiiiiiiiiiiiii")
                         fake = fake + 1
                     import re
                     cll = re.compile('\W')
                     review = re.sub(cll, " ", review)
                     cmd.execute(
                         "INSERT INTO `review` VALUES(NULL,'" + str(pid) + "','" + str(review) + "','" + str(
                             rating) + "')")
                     con.commit()
                 except Exception as e:
                     print("looooooooooooooooooooo++++++++++++++++++++++++", e)
         cmd.execute(
             "SELECT `product_url`.`product`,ROUND(AVG(`review`.`rating`)) AS rating  FROM `product_url` JOIN `review` ON `product_url`.`id`=`review`.`product_id` WHERE `product_url`.id='" + str(
                 pid) + "' GROUP BY product_url.id ")
         rate = cmd.fetchone()

         cmd.execute("SELECT * FROM  `review` WHERE `product_id`=" + str(
                 pid) + "")
         rr=cmd.fetchall()
         cnt=len(rr)
         return render_template('res.html', count=cnt, pos=pc, neg=cnt - pc, rate=rate[1], prod=pname, spam=fake)
     except Exception as e:
         print("hiiiiiiiiiiiiiiiiiiiiii++++++++++++++++++++++++", e)
         # cmd.execute(
         #     "SELECT `product_url`.`product`,ROUND(AVG(`review`.`rating`)) AS rating  FROM `product_url` JOIN `review` ON `product_url`.`id`=`review`.`product_id` WHERE `product_url`.id='" + str(
         #         pid) + "' GROUP BY product_url.id ")
         # rate = cmd.fetchone()
         cmd.execute(
             "SELECT * FROM  `review` WHERE `product_id`=" + str( pid) + "")
         rr = cmd.fetchall()
         cnt = len(rr)
         return render_template('res.html', count=cnt, pos=pc, neg=cnt - pc, rate=0, prod=pname, spam=fake)
#
#
# def deEmojify(lis):
#     regrex_pattern = re.compile(pattern = "["
#         u"\U0001F600-\U0001F64F"  # emoticons
#         u"\U0001F300-\U0001F5FF"  # symbols & pictographs
#         u"\U0001F680-\U0001F6FF"  # transport & map symbols
#         u"\U0001F1E0-\U0001F1FF"  # flags (iOS)
#                            "]+", flags = re.UNICODE)
#     return regrex_pattern.sub(r'',lis)


# def flipkart(fliplink,pid):
#  try:
#     # flipkart
#     res1 = requests.get(fliplink)
#     # print(res1.text)
#     resn = []
#     row = []
#     # print(res1.text)
#     import re
#     clean = re.compile('<.*?>')
#     result=res1.text.split('<div class="t-ZTKy">')
#     print(len(result))
#     for i in range(1,len(result)):
#         review=result[i].split('</div>')[0]
#         review = re.sub(clean, "", review).replace("\n"," ")
#         print(review)
#         print("=========================")
#     from nltk.sentiment.vader import SentimentIntensityAnalyzer
#     pstv = 0
#     ngtv = 0
#     ntl = 0
#     sid = SentimentIntensityAnalyzer()
#     ss = sid.polarity_scores(review)
#     a = float(ss['pos'])
#     b = float(ss['neg'])
#     c = float(ss['neu'])
#     rating = 2.5
#     if (ss['neu'] > ss['pos'] and ss['neu'] > ss['neg']):
#         pass
#     if (ss['neg'] > ss['pos']):
#         negva = 5 - (5 * ss['neg'])
#         if negva > 2.5:
#             negva = negva - 2.5
#         rating = negva
#     else:
#         negva = 5 * ss['pos']
#         if negva < 2.5:
#             negva = negva + 2.5
#         rating = negva
#     cl = CLASSIFIER()
#     session['pid']=pid
#     cl.run(review)
#     # print(res,"********ressssssssssssssssssssssssssssssssss")
#     cmd.execute("INSERT INTO review values(null, '" + str(pid) + "','" + review + "','"+str(rating)+"')")
#     con.commit()
#     return 'ok'
#  except:
#      return 'okkkk'


app.run(debug=True)
