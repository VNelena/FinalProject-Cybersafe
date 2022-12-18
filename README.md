# FinalProject-Cybersafe

Higher Diploma in Science in Computing Cybersecurity - National College of Ireland.

The goal of CyberSafe is to improve the adoption of cybersecure behaviours and best
practices across the National College of Ireland community, regardless of field of study.
CyberSafe is a project led by students, and aims to address one of the top concerns
when we are near completion of our academic education: the lack of practical or “real
world” experience when facing the job market, especially in the case of technical
disciples, such as Computer Science. CyberSafe will create opportunities for
cybersecurity students to become proactive contributors to the safety of the
university’s environment, as well as to apply their knowledge by acting as cybersecurity
consultants or advisors in other students’ projects.
CyberSafe is a social portal that aims to become NCI’s cybersecurity learning hub, the
members of this web application will have the chance to read about cybersecurity best
practices, connect with other members in the community, and request advice from
cybersecurity experts to implement security in their projects, assignments and day-today activities.
CyberSafe will be an opportunity for cybersecurity students to have an impact on the
NCI community and put the knowledge and skills acquired through academic training
into practice.
The objective of the CyberSafe project is to:
1. Apply the knowledge acquired through the H.Dip. in Science in Computing –
Cybersecurity in the development of a cybersecurity-focused social network.
2. Implement cybersecurity principles and features learnt through this degree to
build a safe application.
3. Deliver a functional prototype of CyberSafe that showcases its main features.

# Configuration manual on how to use the application.

A) Install XAMPP:
 1) Visit https://www.apachefriends.org/index.html and select download XAMPP installer in the version that suits your OS (Windows, Linux or OSX) 
Windows installation will be explained:

IMPORTANT: Do not install XAMPP in the C:\Program Files directory, a warning message may appear reminding this when you open the installer. XAMPP must be installed in any other directory other than C:\Program files

 2) Open the installer, click NEXT, select all the default components (PHP, MySQL, phpMyadmin...). Click Next.
 3) Select a folder to install XAMPP, by default C:\xampp should appear, if not, enter this directory. Click Next
 4) Select Language and click next
 5) Agree to install Bitnami and click next
 6) XAMPP installation will begin, XAMPP webpage will open in the browser the meantime. This step can take up to a few minutes.
 7) Click finish when installation is ready, XAMPPs control panel will open automatically.
 8) In the control panel, click Start Apache and Start MySQL
 9) If the steps above were followed correctly, when you type localhost in your browser, XAMPP website should appear.

B)Create a folder called "demo" under the htdocs folder in C:\xampp\htdocs. Download the files in FinalProject-Cybersafe and put them inside that demo folder: C:\xampp\htdocs\demo

C)Create the database
1)In the database folder of this repository, you will find the SQL code to create CyberSafe's database.
2)In the browser, open another tab and enter "localhost/phymyadmin" in the url bar. phpMyadmin should open. If XAMPP's control panel shows that MYSQL is running and this step still doesn't work, try to type "localhost/8080/phymyadmin" in the URL instead.

3) On the left hand side of phpMyadmin, select NEW and give the name "cybersafe" to the new database. ClicK "Create" and the database will be added to your list of databases.

5) Click on the new database cybersafe to open it and select SQL on the horizontal bar.

7) Copy the SQL code from the file cybersafe.sql available under folder "database" in this repository and click Go.

D) Run the application
1) Once the database has been created, you only have to go to localhost/demo/index.php to visit CyberSafe. Remember XAMPP control panel must be running Apache and MySQL.

3) If you are a new user the application should not show the home page, but the registration page localhost/demo/register.ph

5) Go ahead and register an account, alternatively, use my dummy account: elenavelez@ncirl.com, password:12345678

7) Navigation from here is intuitive.


