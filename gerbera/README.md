# Gerbera
Deployment av cronjob som kör dockercontainern från gerberaprojektet regelbundet


TODO:

LOG:
2022-01-30:
-Har bara vaga minnen av att jag gjort detta.
-Hur fungerar CronJob? Var hamnar loggen? 
-Jobben körs på minikube, verkar fungera bara minikube är uppe, vilket inte är fallet efter ett strömavbrott (homebridge verkar gä upp
igen dock)

2022-02-15:
-Har bytt till k3s, det verkar minska minnesanvändningen avsevärt
-Var tvungen att byta ägare på conf-filen till k3s från sudo

2022-02-22:
-Verkar ha hänt ngt med k3:s conffil, den är plötsligt inte längre tillgänglig för användaren david.
