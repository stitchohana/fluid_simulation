clear; % 変数をすべて削除

 % ユーザが指定するパラメータ
L = 4; % ひも長さ
tmax = 10; % 時刻の最大値
nx = 40; % 空間分割数
ny = 40;
nt = 2500; % 時間分割数
c = 4; % 波の速度
mu = 0.5; % 粘性パラメータ

h = 1 / (nx -1); % ひも１要素の長さ
x = linspace(0, L, nx)'; % ｎｘ個の節点
y = linspace(0, L, ny);
dt = tmax / (nt - 1); % １時間ステップの大きさ
time = linspace(0, tmax, nt)'; % ｎｔ個時刻

 % 安定性チェック
check_dt = (mu + sqrt(mu * mu +(32 * c * c) / (h * h))) / ((8 * c * c) / (h * h));
if dt >= check_dt
    return
end

 % 定数計算
c1 = (4 - 8 * c * c * dt * dt / (h * h)) / (mu * dt + 2);
c2 = (mu * dt - 2) / (mu * dt +2);
c3 = (2 * c * c * dt * dt / (h * h)) / (mu * dt + 2);

 % メモリ確保
z = zeros(nt, nx, nx);

 % 初期化
z(1, :, :) = sin((2 * pi) / L * x) * sin((2 * pi) / L * y);
z(2, :, :) = sin((2 * pi) / L * x) * sin((2 * pi) / L * y);

z(:, :, 1) = 0;    
z(:, :, nx) = 0;

 % 各時刻の高さ
for k = 2: nt - 1
    for i = 2: nx -1
        for j = 2: ny -1
            z(k + 1, i, j) = c1 * z(k, i, j) + c2 * z(k - 1, i, j) + c3 * (z(k, i + 1, j) + z(k, i - 1, j) + z(k, i, j + 1) + z(k, i, j - 1));
        end
    end
end

 % アニメーション表示
figure(1);
for k = 1: nt
    clf;
    surf(x, y, z(k, 1, 1));
    title(['time = ', num2str(time(k), '%.1f')]);
    pause(0.001);
end
