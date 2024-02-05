library(readxl)
library(ggplot2)
library(psych)
library(dplyr)

file.choose()

Ipc_Cali<-read_xlsx("C:\\Users\\Juan David Serrato V\\OneDrive\\Documents\\IPC cali.xlsx", sheet = "ST")

colnames(Ipc_Cali)
View(Ipc_Cali)

# Gráfico multilineas comparando el IPC nacional vs IPC de Cali
ggplot(Ipc_Cali,aes(x= Periodo)) +  geom_line(aes(y = IPC_Cali), color = "blue", linetype = "solid", size = 1) + geom_line(aes(y = IPC_Col), color = "red", linetype = "solid", size = 1) + labs(title = "Comparación IPC nacional vs IPC Cali", x = "Periodo", y = "IPC")

