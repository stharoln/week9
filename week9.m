x = 0 : 0.05 : 6*pi;
y = sin(x) + 0.5 * cos(3*x);
plot(x, y)
xticks(0 : pi : 6*pi) 
xticklabels({'0','\pi','2\pi','3\pi','4\pi','5\pi','6\pi'}) 
title('sin(x) + 0.5cos(3x) 그래프')
xlabel('x')
ylabel('y')
grid on

clear; clc;
x = 1 : 1 : 50;
y = 3.^x; 
subplot(1,2,1)
plot(x, y)%그래프가 급격하게 위로 솟구치는 곡선
subplot(1,2,2)
semilogy(x, y)%함수가 직선 형태로 나타남

clear; clc;
load score.dat
subplot(1,2,1)
hist(score, 5) 
subplot(1,2,2)
hist(score, 10)

clear,clc,clf
y=@(x) sin(x).*exp(-0.1.*x);
fplot(y,[0,10*pi])
title('그래프')
xlabel('x')
ylabel('y')
grid on

x = 0 : 0.1 : 10;
y1=x.^2; %가속이 붙으면서 커지는 포물선 모양
y2=exp(0.5.*x);% x 커질수록 y1과는 비교도 안 될 정도로 폭발적으로 증가
plotyy(x,y1,x,y2)
title('그래프')
xlabel('x')

clear; clc; clf;
t = 0 : 0.02 : 12*pi;
x = (1 + 0.03*t) .* cos(t);
y = (1 + 0.03*t) .* sin(t);
z = 0.2 * t;
plot3(x, y, z)
title('3D 매개곡선 그래프')
xlabel('x'); ylabel('y'); zlabel('z');
grid on

clear; clc; clf;

[X, Y] = meshgrid(-4 : 0.2 : 4, -4 : 0.2 : 4);

Z = X.^2 - Y.^2;

mesh(X, Y, Z)
title('Saddle Surface (z = x^2 - y^2)')
xlabel('x'); ylabel('y'); zlabel('z'); 
%x축 방향으로는 아래로 볼록하고 y축 방향으로는 위로 볼록한 형태가 한 점에서 만나

clear; clc; clf;
%8
[X, Y] = meshgrid(-2*pi : 0.1 : 2*pi);
Z = sin(X) .* cos(Y);
subplot(1,2,1)
mesh(X, Y, Z)
title('Mesh Plot')
subplot(1,2,2)
contour(X, Y, Z)
title('Contour Plot')
%같은 높이를 가진 지점들을 선으로 연결한 등고선 형태를 통해, 함수의 극대, 극소 및 경사도를 한눈에 파악할 수 있게 해줍

clear; clc; clf;

t = 0 : 0.01 : 25;
y = exp(-0.15*t) .* cos(4*t);
env_up = exp(-0.15*t);
env_down = -exp(-0.15*t);

subplot(2,1,1)
plot(t, y, 'b') 
hold on
plot(t, env_up, 'r--') 
plot(t, env_down, 'r--') 
title('Damped Vibration with Envelopes')
xlabel('time (t)'); ylabel('y(t)');
grid on

subplot(2,1,2)
semilogy(t, abs(y))
title('Semilogy of |y(t)|')
xlabel('time (t)'); ylabel('log scale |y(t)|');
grid on
%semilogy로 그리면, 진동하는 신호의 최고점(피크)들이 직선 형태로 낮아지는 것을 볼 수 있습니다.

clear; clc; clf;

[X, Y] = meshgrid(-6 : 0.1 : 6);
Z = cos(X) .* sin(Y) .* exp(-0.05 * (X.^2 + Y.^2));

subplot(1,2,1)
mesh(X, Y, Z)
title('Mesh Plot')

subplot(1,2,2)
contour(X, Y, Z, 20) 
title('Contour Plot')

[max_val, idx] = max(Z(:)); 
[row, col] = ind2sub(size(Z), idx); 

max_x = X(row, col);
max_y = Y(row, col);

fprintf('최대값: %f\n', max_val);
fprintf('최대값 위치: x = %f, y = %f\n', max_x, max_y);
%max 함수를 통해 계산된 $z$의 수치적 최대값은 약 0.435

clear; clc; clf;

t = [0, 1, 2, 3, 4, 5, 6];
C = [12, 8.9, 6.6, 4.9, 3.6, 2.7, 2.0];

% (a) 일반 plot
subplot(2,1,1)
plot(t, C, 'ko-') % 검은색 원과 실선
title('Concentration C(t) - Linear Scale')
grid on

% (b) semilogy 그래프
subplot(2,1,2)
semilogy(t, C, 'ro-') % 빨간색 원과 실선
title('Concentration C(t) - Log Scale')
grid on
p = polyfit(t, log(C), 1); % 1차식으로 근사
k_estimated = -p(1); % 기울기의 부호를 바꾸면 k값!

fprintf('추정된 상수 k값: %f\n', k_estimated);

clear; clc; clf;

n = 1 : 1 : 30;
T1 = n;
T2 = n .* log(n);
T3 = n.^2;
T4 = 2.^n;

% (a) 일반 plot
subplot(2,1,1)
plot(n, T1, n, T2, n, T3, n, T4)
ylim([0, 1000]) % T4가 너무 커서 y축 범위를 제한해야 다른 게 보여!
title('Algorithm Complexity - Linear Scale')
legend('n', 'n log n', 'n^2', '2^n')
grid on

% (b) semilogy 다시 나타내기
subplot(2,1,2)
semilogy(n, T1, n, T2, n, T3, n, T4)
title('Algorithm Complexity - Log Scale')
legend('n', 'n log n', 'n^2', '2^n')
grid on
%성장률 비교에는 로그 스케일 그래프(semilogy)가 더 적절합니다.로그 스케일 그래프를 사용하면
%값이 커지는 속도 차이를 한 화면에 명확하게 담아낼 수 있음

clear; clc; clf;

t = 0 : 0.1 : 24;
T = 15 + 10 * sin(pi * t / 12);

plot(t, T, 'LineWidth', 1.5)
hold on

[max_T, max_idx] = max(T);
[min_T, min_idx] = min(T);

plot(t(max_idx), max_T, 'ro', 'MarkerFaceColor', 'r') % 최고점 빨간 점
plot(t(min_idx), min_T, 'bo', 'MarkerFaceColor', 'b') % 최저점 파란 점

text(t(max_idx)+0.5, max_T, ['최고: ', num2str(max_T), '도'])
text(t(min_idx)+0.5, min_T, ['최저: ', num2str(min_T), '도'])

title('하루 동안의 온도 변화')
xlabel('시간 (t)'); ylabel('온도 (T)');
grid on

clear; clc; clf;

t = 0 : 0.1 : 20;
v = 5 * exp(-0.2 * t);

% 속도가 초반에 급격히 감소하다가 시간이 지날수록 완만해지는 곡선
subplot(1,2,1)
plot(t, v)
title('일반 Plot (Linear Scale)')
xlabel('시간 (t)'); ylabel('속도 (v)');
grid on
%지수 함수 형태인 그래프가 직선 형태로 나타남
subplot(1,2,2)
semilogy(t, v)
title('Semilogy (Log Scale)')
xlabel('시간 (t)'); ylabel('속도 (v)');
grid on

clear; clc;
A = [4 -1 2; 1 3 -1; 2 -2 5];
b = [7; 4; 10];

A_sq = A^2;     % 행렬 곱 (A * A)
A_elem_sq = A.^2; % 원소별 제곱

% (b)존재함
determinant_A = det(A);

% (c) (백슬래시 연산자)가 수치적으로 더 빠르고 정확합니다
x_inv = inv(A) * b;
x_backslash = A \ b;

% 결과 출력
fprintf('(b) det(A) = %f\n', determinant_A);
disp('(c) inv(A)*b 결과:'); disp(x_inv);
disp('(c) A\b 결과:'); disp(x_backslash);

clear; clc;

% 행렬 정의
A = [2 -1; 3 4];
B = [1 0 -2; 3 5 1];
C = [6 -3 4; 15 14 -1];

% (a) AX = C - B 계산
target_mat = C - B;

% (b) A \ (C - B)를 이용하여 X 계산
X = A \ target_mat;

% (c) AX + B = C 만족 여부 확인
check_C = A * X + B;

% 역행렬 전체를 구하는 것보다 연립방정식을 직접 푸는 것이 계산량이 적어 속도가 더 빠름

clear; clc;

% 데이터 행렬 X 정의
X = [3 7 2 5; 5 9 4 6; 8 12 7 10; 10 15 9 13; 14 18 12 16];

% (a) 각 열의 평균 계산
col_mean = mean(X);

% (b) 중심화 행렬 Xc 구하기
% MATLAB은 행렬과 벡터의 크기가 다르면 자동으로 맞춰주는 '브로드캐스팅'을 지원해!
Xc = X - col_mean;

% (c) S = Xc' * Xc 계산
S = Xc' * Xc;

% 대각 원소 (Diagonal elements): 각 변수(열) 자체의 **변동성(분산과 관련됨)**을 나타냅니다. 값이 클수록 해당 변수의 데이터가 평균에서 멀리 퍼져 있음을 의미합니다.
%비대각 원소 (Off-diagonal elements): 서로 다른 두 변수 간의 **상관성(공분산과 관련됨)**을 나타냅니다. 양수이면 두 변수가 함께 증가하는 경향이 있고, 음수이면 반대로 움직이는 경향이 있음을 뜻합니다.
