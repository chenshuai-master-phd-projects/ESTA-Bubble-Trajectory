lnum1=0
fd1=open('./trajectory/trajectory.txt','r')
fd2=open('tmp.txt','w')
for line in fd1:
	lnum1 +=1;
	if(lnum1>=8):
		fd2.write(line)
fd1.close()
fd2.close()

fd3=open('./trajectory/acceleration.dat','r')
fd4=open('tmpa.dat','w')
for line in fd3:
	fd4.write(line)
fd3.close()
fd4.close()



