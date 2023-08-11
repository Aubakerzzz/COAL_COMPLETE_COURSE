.model small
.stack 100h

;Question 01

.data

name1  DB 'Abubaker','$'
field DB "Software Engineer$"
line Db   "To pursue a challenging career in Artificial Intelligence$"
email DB "abubakerajazz@gmail.com$"
address DB "islamabad, Pakistan$"
phoneNumber DB "03039620098$"
linkdein DB "linkedin.com/in/abubaker------$"
mediumm DB "medium.com/@abubaker----$"
github DB "github.com/Abubakerzzz"

edu DB "EDUCATION$"
degree DB "Bachelors Computer Science FAST National University of Computer and Emerging Sciences, Islamabad$"
present DB "08/2021$"

work DB "WORK EXPERIENCE$"
machine DB "Machine Learning Intern$"
company DB "Red-Buffer$"

seo DB "SEO Specialist Intern Beacon Investment$"
achivement DB "Worked on improving their website rank on Google using Basic & Advanced SEO techniques$"

web DB "Web Developer Intern$"
comp DB "Beacon Investment$"
task  dB "Worked on improving their website design and reducing landing page time$"

skillz DB " WordPress , PHP, JavaScript, HTML, CSS, SQL, BootStrap, SEO, PhotoShop, SWI-Prolog,Java,Python,Go ,C/C++, OLAP, PL/SQL, R ,MATLAB ,Assembly$"
Projects DB "PERSONAL PROJECTS$"
Torcsnames DB "TORCS Game Controller Made a controller for car racing using machine learning$"
gymManagement DB " Gym Management System Made a gym management system using Html, CSS, PHP and SQL$"
dodgeEm DB "Dodge'Em Made a game in C++ using OpenGL$"

Mario DB " Super Mario Made a game in Assembly Language$"

newtworkSystem DB "Distributed Network using Distributed Hash Tables Made a network system using data structures in C++$"

Ludo DB "Ludo Made a game in C++ using SFML and Multi-threading$"

certificates DB "CERTIFICATES$"
machineLearning DB" Supervised Machine Learning: Regression and Classification , By DeepLearning.AI and Stanford University and offered through Coursera$"
javaProgramming DB "Java Programming: Solving Problems with Software By Duke University and offered through Coursera$"
Python DB " Python 3 Programming Specialization By University of Michigan and offered through Coursera$"


.code
mov ax, @data
mov ds, ax
mov ax, 0



;String output
lea dx, name1
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, field
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, line
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, email
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h

	
;String output
lea dx, address
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, phoneNumber
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h

	
;String output
lea dx, linkdein
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, mediumm
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, github
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, edu
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h

;String output
lea dx, degree
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, present
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, work
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, machine
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h

;String output
lea dx, company
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h

;String output
lea dx, seo
mov ah, 09h
int 21h



;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, achivement
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, web
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, comp
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, task
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, skillz
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, Projects
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h

;String output
lea dx, Torcsnames
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, gymManagement
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, dodgeEm
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, Mario
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, newtworkSystem
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h

;String output
lea dx, Ludo
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, certificates
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h



;String output
lea dx, machineLearning
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h

;String output
lea dx, javaProgramming
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


;String output
lea dx, Python
mov ah, 09h
int 21h

;newline
mov ah, 02h
mov dl, 10 ; ascii of enter
int 21h


mov ah , 4ch
int 21h
end

	


