clear; % 変数をすべて削除

 % ユーザが指定するパラメータ
L = 6; % ひも長さ
tmax = 4; % 時刻の最大値
nx = 8; % 空間分割数
nt = 50; % 時間分割数

 % 離散化
x = linspace(0, L, nx); % ｎｘ個の節点
time = linspace(0, tmax, nt); % ｎｔ個時刻

 % メモリ確保
z = zeros(nt, nx);

 % 各時刻の波形を求める
for k = 1: nt
    z(k, :) = sin(x - time(k));
end

 % アニメーション表示
figure(1);
for k = 1: nt
    clf;
    plot(x, z(k, :), 'ko');
    axis equal;
    axis ([0, L, -1, 1]);
    title(['time = ', num2str(time(k), '%.1f')]);
    pause(0.01);
end