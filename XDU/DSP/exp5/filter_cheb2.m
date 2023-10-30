%{
%��ͨ
Wp=0.2;Ws=0.4;Rp=1;Rs=10;
[N,Wso]=cheb2ord(Wp,Ws,Rp,Rs);
[B,A]=cheby2(N,Rp,Wso);
[H,w]=freqz(B,A,256);
subplot(1,2,1);
plot(w/pi,20*log10(abs(H)),'g');grid on;
xlabel('\omega/\pi');
ylabel('|H(e^j^\omega)|/dB');
title('Magnitude Response');
subplot(1,2,2);
plot(w/pi,angle(H)/pi,'b');grid on;
xlabel('\omega/\pi');
ylabel('\phi(\omega)/\pi');
title('Phase Response');


%��ͨ

Wp=0.4;Ws=0.2;Rp=1;Rs=10;
[N,Wso]=cheb2ord(Wp,Ws,Rp,Rs);
[B,A]=cheby2(N,Rp,Wso,'high');
[H,w]=freqz(B,A,256);
subplot(1,2,1);
plot(w/pi,20*log10(abs(H)),'g');grid on;
xlabel('\omega/\pi');
ylabel('|H(e^j^\omega)|/dB');
title('Magnitude Response');
subplot(1,2,2);
plot(w/pi,angle(H)/pi,'b');grid on;
xlabel('\omega/\pi');
ylabel('\phi(\omega)/\pi');
title('Phase Response');


%��ͨ
Wp=[0.2,0.4];Ws=[0.1,0.5];Rp=1;Rs=10;
[N,Wso]=cheb2ord(Wp,Ws,Rp,Rs);
[B,A]=cheby2(N,Rp,Wso);
[H,w]=freqz(B,A,256);
subplot(1,2,1);
plot(w/pi,20*log10(abs(H)),'g');grid on;
xlabel('\omega/\pi');
ylabel('|H(e^j^\omega)|/dB');
title('Magnitude Response');
subplot(1,2,2);
plot(w/pi,angle(H)/pi,'b');grid on;
xlabel('\omega/\pi');
ylabel('\phi(\omega)/\pi');
title('Phase Response');
%}

%����
Wp=[0.1,0.5];Ws=[0.2,0.4];Rp=1;Rs=10;
[N,Wso]=cheb2ord(Wp,Ws,Rp,Rs);
[B,A]=cheby2(N,Rp,Wso,'stop');
[H,w]=freqz(B,A,256);
subplot(1,2,1);
plot(w/pi,20*log10(abs(H)),'g');grid on;
xlabel('\omega/\pi');
ylabel('|H(e^j^\omega)|/dB');
title('Magnitude Response');
subplot(1,2,2);
plot(w/pi,angle(H)/pi,'b');grid on;
xlabel('\omega/\pi');
ylabel('\phi(\omega)/\pi');
title('Phase Response');
%{
%}