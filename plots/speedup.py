import numpy as np
from matplotlib import pyplot as plt

x,contr,Dd,Ds,Dc,Dcc=np.loadtxt("speedup.dat", skiprows=1).transpose()

l1=2
l2=1

plt.plot(x,x/x[0],ls="--",lw=l1,label="Ideal",color="black")
plt.plot(x,contr,ls="-",lw=l2,marker=".",label="Contractions")
plt.plot(x,Dd,ls="-",lw=l2,marker=".",label="$D$ double")
plt.plot(x,Ds,ls="-",lw=l2,marker=".",label="$D$ single")
plt.plot(x,Dc,ls="-",lw=l2,marker=".",label="$D_c$ half")
plt.plot(x,Dcc,ls="-",lw=l2,marker=".",label="$D_{cc}$ half")

fig = plt.gcf()
fig.set_size_inches(7, 4)
plt.xlabel("Number of nodes", fontsize=14)
plt.ylabel("Speed-up", fontsize=14)
plt.legend(fontsize=14)
fig.savefig("speedup.pdf",bbox_inches="tight")
