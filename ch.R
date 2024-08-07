df <- NULL
tmp <- data.frame(
  "en" = "B48",
  "nodes" = 2,
  "setup" = 35.7,
  "update" = 0.7,
  "s" = 1.9,
  "l" = 0.9,
  "c" = 0.7,
  "scr" = 10,
  "confs" = 300
)
df <- rbind(df, tmp)
tmp <- data.frame(
  "en" = "B64",
  "nodes" = 4,
  "setup" = 87.5,
  "update" = 0.9,
  "s" = 3.3,
  "l" = 1.3,
  "c" = 1.0,
  "scr" = 5,
  "confs" = 300
)
df <- rbind(df, tmp)
tmp <- data.frame(
  "en" = "B96",
  "nodes" = 24,
  "setup" = 57.9,
  "update" = 1.0,
  "s" = 4.15,
  "l" = 1.1,
  "c" = 1.1,
  "scr" = 3,
  "confs" = 300
)
df <- rbind(df, tmp)
tmp <- data.frame(
  "en" = "C80",
  "nodes" = 10,
  "setup" = 62.9,
  "update" = 1.0,
  "s" = 2.7,
  "l" = 1.3,
  "c" = 1.2,
  "scr" = 3,
  "confs" = 300
)
df <- rbind(df, tmp)
tmp <- data.frame(
  "en" = "D96",
  "nodes" = 24,
  "setup" = 46,
  "update" = 1.0,
  "s" = 2.5,
  "l" = 1.0,
  "c" = 1.2,
  "scr" = 3,
  "confs" = 300
)
df <- rbind(df, tmp)
tmp <- data.frame(
  "en" = "E112",
  "nodes" = 56,
  "setup" = 43.6,
  "update" = 1.0,
  "s" = 2.87,
  "l" = 1.0,
  "c" = 1.3,
  "scr" = 2,
  "confs" = 300
)
df <- rbind(df, tmp)

Nh<- 6 # N heavy quarks
Nth<- 10
spin_dilution<- 4
###################################### bu channel
##### all Nh in the same run
### set + -l- + update + -s-
df$time_1source_1th_1conf <-  df$setup + df$update + ( df$scr*df$l + df$scr*df$s) * spin_dilution 

# heavy inversion, 3 because 1 direct and two sequential
## (update + (-h-   +  -l-h- + -s-h- )*spin_dil )*Nh
df$time_1source_1th_1conf <-  df$time_1source_1th_1conf + (df$update  + df$scr*df$c*3*spin_dilution)*Nh

# charm inversion, setup because of th, 8 because of Vmu+ Amu,
## (setup +  (-l-h-l- + -s-h-l-)*8*spin_dil ) *Nh
df$time_1source_1th_1conf <-  df$time_1source_1th_1conf + df$setup + df$scr*df$l*2*8*spin_dilution*Nh
### bc channel 
## (update +  (-l-h-c- + -s-h-c-)*8*spin_dil ) *Nh
df$time_1source_1th_1conf <-  df$time_1source_1th_1conf + df$update + df$scr*df$c*2*8*spin_dilution*Nh


## the bu channel
## (update(actually will be a setup and an update in the bc channel) +  (-l-h-l- + -s-s-l-)*8*spin_dil ) *Nh
# df$time_1source_1th_1conf <-  df$time_1source_1th_1conf + df$update + df$l*2*8*Nh*spin_dilution

# for the charm we need an update every time because r change 
# df$time_1source_1th_1conf <-  df$time_1source_1th_1conf + df$update * 2 * Nh + df$c * spin_dilution * 2 * Nh

# # light
# df$time_1source_1th_1conf <-  df$time_1source_1th_1conf +  df$setup + df$l*spin_dilution * 8 * Nh




##### one run x Nh
# df$time_1source_1th_1conf <- (df$setup + df$s + df$update  + df$c * 2 +
#                                 df$setup + df$l * 8  ) *Nh


##################################### bc channel
##### in the same run
#df$time_1source_1th_1conf <- df$time_1source_1th_1conf + df$update * Nh + df$c*spin_dilution * 8 * Nh
##### different run x chan
# df$time_1source_1th_1conf <-  df$time_1source_1th_1conf +(df$update + df$s + df$c * 2 * Nh +
#                                 df$setup + df$c * 8 * Nh )

################################## light a zero momentum
# df$time_1source_1th_1conf <- df$time_1source_1th_1conf +df$setup + df$l *spin_dilution

df$time <- df$time_1source_1th_1conf  * Nth  * df$confs 

df$ch <- df$time * df$nodes * 48 / 3600
df$Mch <- df$ch / 1e+6
## contractions
df$Mch <- df$Mch * 100.0 / 85.0 
print(df$Mch )
print(sum(df$Mch))

aa<-round(df$Mch, digit=1)
print(aa)
print(sum(aa))

## rounding up 
# aa<-ceiling(df$Mch*10)/10 
# print(aa)
# print(sum(aa))

df$wallt<-df$Mch *1e+6/(10*300*df$nodes*48)
print(df$wallt)