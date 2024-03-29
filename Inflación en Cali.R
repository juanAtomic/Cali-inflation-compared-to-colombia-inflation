library(readxl)
library(ggplot2)
library(psych)
library(dplyr)

file.choose()

Ipc_Cali<-read_xlsx("C:\\Users\\Juan David Serrato V\\OneDrive\\Documents\\Git\\Cali-inflation-compared-to-colombia-inflation\\IPC cali.xlsx", sheet = "ST")

colnames(Ipc_Cali)
View(Ipc_Cali)

# Gráfico multilineas comparando el IPC nacional vs IPC de Cali
IPC<-ggplot(Ipc_Cali,aes(x= Periodo)) +  geom_line(aes(y = IPC_Cali, color = "IPC cali"), linetype = "solid", size = 1) + geom_line(aes(y = IPC_Col, color = "IPC colombia"), linetype = "solid", size = 1) + labs(title = "Comparación IPC nacional vs IPC Cali", x = "Periodo", y = "IPC")+ scale_color_manual(name="Leyenda",  values = c("IPC cali" = "blue", "IPC colombia" = "red"),labels = c("Cali", "Colombia"))

print(IPC)

#Calcular la inflación en cali y colombia

#Inflacion cali#
Ipc_Cali$Inflacion_cali<-round((Ipc_Cali$IPC_Cali-lag(Ipc_Cali$IPC_Cali,1))/lag(Ipc_Cali$IPC_Cali,1)*100,2)

#Inflacion Colombia#

Ipc_Cali$Inflacion_colombia<-round((Ipc_Cali$IPC_Col-lag(Ipc_Cali$IPC_Col,1))/lag(Ipc_Cali$IPC_Col,1)*100,2)

#Gráfico multilineas comparando la inflacion en cali y colombia

Inflacion<-ggplot(Ipc_Cali,aes(x= Periodo)) +  geom_line(aes(y = Inflacion_cali, color = "Inflacion Cali"), linetype = "solid", size = 1) + geom_line(aes(y = Inflacion_colombia, color = "Inflacion colombia"), linetype = "solid", size = 1) + labs(title = "Comparación Inflación nacional vs Inflación Cali", x = "Periodo", y = "Inflación") + scale_color_manual(name="Leyenda",  values = c("Inflacion Cali" = "blue", "Inflacion colombia" = "red"),labels = c("Cali", "Colombia"))

print(Inflacion)

#Cambio del poder adquisitivo (tener en cuenta que se realiza con base al salario mínimo mensual establecido por ley)

#Cambio del poder adquisitivo en Cali#

Ipc_Cali$PA_Cali<-round(((lag(Ipc_Cali$IPC_Cali,1)/Ipc_Cali$IPC_Cali)-1)*100,2)

#Cambio del poder adquisitivo en Colombia#

Ipc_Cali$PA_Colombia<-round(((lag(Ipc_Cali$IPC_Col,1)/Ipc_Cali$IPC_Col)-1)*100,2)

Poder_Adquisitivo <- ggplot(Ipc_Cali, aes(x = Periodo)) +  geom_line(aes(y = PA_Cali, color = "PA Cali"), linetype = "solid", size = 1) + geom_line(aes(y = PA_Colombia, color = "PA Colombia"), linetype = "solid", size = 1) + labs(title = "Comparación de la variación PA nacional vs variación de la PA Cali", x = "Periodo", y = "Variación de la PA") +scale_color_manual(name="Leyenda",  values = c("PA Cali" = "blue", "PA Colombia" = "red"),labels = c("Cali", "Colombia"))
print(Poder_Adquisitivo)

