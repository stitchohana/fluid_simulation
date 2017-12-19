clear; % �ϐ������ׂč폜

 % ���[�U���w�肷��p�����[�^
L = 6; % �Ђ�����
tmax = 4; % �����̍ő�l
nx = 8; % ��ԕ�����
nt = 50; % ���ԕ�����

 % ���U��
x = linspace(0, L, nx); % �����̐ߓ_
time = linspace(0, tmax, nt); % ��������

 % �������m��
z = zeros(nt, nx);

 % �e�����̔g�`�����߂�
for k = 1: nt
    z(k, :) = sin(x - time(k));
end

 % �A�j���[�V�����\��
figure(1);
for k = 1: nt
    clf;
    plot(x, z(k, :), 'ko');
    axis equal;
    axis ([0, L, -1, 1]);
    title(['time = ', num2str(time(k), '%.1f')]);
    pause(0.01);
end