clear; % �ϐ������ׂč폜

 % ���[�U���w�肷��p�����[�^
L = 4; % �Ђ�����
tmax = 10; % �����̍ő�l
nx = 40; % ��ԕ�����
ny = 40;
nt = 2500; % ���ԕ�����
c = 4; % �g�̑��x
mu = 0.5; % �S���p�����[�^

h = 1 / (nx -1); % �Ђ��P�v�f�̒���
x = linspace(0, L, nx)'; % �����̐ߓ_
y = linspace(0, L, ny);
dt = tmax / (nt - 1); % �P���ԃX�e�b�v�̑傫��
time = linspace(0, tmax, nt)'; % ��������

 % ���萫�`�F�b�N
check_dt = (mu + sqrt(mu * mu +(32 * c * c) / (h * h))) / ((8 * c * c) / (h * h));
if dt >= check_dt
    return
end

 % �萔�v�Z
c1 = (4 - 8 * c * c * dt * dt / (h * h)) / (mu * dt + 2);
c2 = (mu * dt - 2) / (mu * dt +2);
c3 = (2 * c * c * dt * dt / (h * h)) / (mu * dt + 2);

 % �������m��
z = zeros(nt, nx, nx);

 % ������
z(1, :, :) = sin((2 * pi) / L * x) * sin((2 * pi) / L * y);
z(2, :, :) = sin((2 * pi) / L * x) * sin((2 * pi) / L * y);

z(:, :, 1) = 0;    
z(:, :, nx) = 0;

 % �e�����̍���
for k = 2: nt - 1
    for i = 2: nx -1
        for j = 2: ny -1
            z(k + 1, i, j) = c1 * z(k, i, j) + c2 * z(k - 1, i, j) + c3 * (z(k, i + 1, j) + z(k, i - 1, j) + z(k, i, j + 1) + z(k, i, j - 1));
        end
    end
end

 % �A�j���[�V�����\��
figure(1);
for k = 1: nt
    clf;
    surf(x, y, z(k, 1, 1));
    title(['time = ', num2str(time(k), '%.1f')]);
    pause(0.001);
end
