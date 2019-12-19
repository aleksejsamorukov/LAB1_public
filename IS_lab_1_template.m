%Classification using perceptron
clear;
%Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

%Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

%Calculate for each image, colour and roundness
%For Apples
%1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
%2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
%3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
%4th apple image(A4)
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
%5th apple image(A5)
hsv_value_A5=spalva_color(A5); %color
metric_A5=apvalumas_roundness(A5); %roundness
%6th apple image(A6)
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
%7th apple image(A7)
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
%8th apple image(A8)
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
%9th apple image(A9)
hsv_value_A9=spalva_color(A9); %color
metric_A9=apvalumas_roundness(A9); %roundness

%For Pears
%1st pear image(P1)
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness
%2nd pear image(P2)
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness
%3rd pear image(P3)
hsv_value_P3=spalva_color(P3); %color
metric_P3=apvalumas_roundness(P3); %roundness
%2nd pear image(P4)
hsv_value_P4=spalva_color(P4); %color
metric_P4=apvalumas_roundness(P4); %roundness

%selecting features(color, roundness, 3 apples and 2 pears)
%A1,A2,A3,P1,P2
%building matrix 2x5
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
% estimated features are stored in matrix P:
P=[x1;x2];

%Desired output vector
T=[-1;-1;-1;1;1];

%% train single perceptron with two inputs and one output

% generate random initial values of w1, w2 and b
w1(1) = randn(1);
w2(1) = randn(1);
b = randn(1);

% calculate wieghted sum with randomly generated parameters
v1 = x1(1)*w1(1) + x2(1)*w2(1) + b; % write your code here
% calculate current output of the perceptron 
if v1 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
er(1) = T(1) - y;

% repeat the same for the rest 4 inputs x1 and x2
% calculate wieghted sum with randomly generated parameters
v2 = x1(2)*w1(1) + x2(2)*w2(1) + b; % write your code here
% calculate current output of the perceptron 
if v2 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
er(2) = T(2) - y;

% calculate wieghted sum with randomly generated parameters
v3 = x1(3)*w1(1) + x2(3)*w2(1) + b; % write your code here
% calculate current output of the perceptron 
if v3 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
er(3) = T(3) - y;

% calculate wieghted sum with randomly generated parameters
v4 = x1(4)*w1(1) + x2(4)*w2(1) + b; % write your code here
% calculate current output of the perceptron 
if v4 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
er(4) = T(4) - y;

% calculate wieghted sum with randomly generated parameters
v5 = x1(5)*w1(1) + x2(5)*w2(1) + b; % write your code here
% calculate current output of the perceptron 
if v5 > 0
	y = 1;
else
	y = -1;
end
% calculate the error
er(5) = T(5) - y;

% calculate the total error for these 5 inputs 
e = abs(er(1)) + abs(er(2)) + abs(er(3)) + abs(er(4)) + abs(er(5));
 
 eta = 0.05;
 n = 1;

% write training algorithm
while e ~= 0 % executes while the total error is not 0
%	% here should be your code of parameter update
	for p = 1:5
		while er(p) ~= 0;
			w1(n+1) = w1(n) + eta*er(p)*x1(p);
    		w2(n+1) = w2(n) + eta*er(p)*x2(p);
    		b(n+1) = b(n) + eta*er(p);
%   		calculate output for current example
 			v_ap = x1(p)*w1(n+1) + x2(p)*w2(n+1) + b; % write your code here
			% calculate current output of the perceptron 
			if v_ap > 0
				y = 1;
			else
				y = -1;
			end

%   		calculate error for current example
			er(p) = T(p) - y;
			n = n + 1;
        end % Atnaujinimo pabaiga
        
        % Patikrinimas ar atnaujinti koeficientai tinka kitiems pavyzdziams
		v1 = x1(1)*w1(n) + x2(1)*w2(n) + b(n); % write your code here
		if v1 > 0
			y = 1;
		else
			y = -1;
		end
		er(1) = T(1) - y;

		v2 = x1(2)*w1(n) + x2(2)*w2(n) + b(n); % write your code here
		if v2 > 0
			y = 1;
		else
			y = -1;
		end
		er(2) = T(2) - y;

		v3 = x1(3)*w1(n) + x2(3)*w2(n) + b(n); % write your code here 
		if v3 > 0
			y = 1;
		else
			y = -1;
		end
		er(3) = T(3) - y;

		v4 = x1(4)*w1(n) + x2(4)*w2(n) + b(n); % write your code here
		if v4 > 0
			y = 1;
		else
			y = -1;
		end
		er(4) = T(4) - y;

		v5 = x1(5)*w1(n) + x2(5)*w2(n) + b(n); % write your code here
		if v5 > 0
			y = 1;
		else
			y = -1;
		end
		er(5) = T(5) - y;
    
		% calculate the total error for these 5 inputs 
		e = abs(er(1)) + abs(er(2)) + abs(er(3)) + abs(er(4)) + abs(er(5));
	end % jei koeficientai tinka visiems iejimams
end

%testujame su kitais pavyzdziais (jei -1 => obuolys, jei 1 => kriause)
v_A4 = hsv_value_A4*w1(n) + metric_A4*w2(n) + b(n);
if v_A4 > 0
	y_A4 = 1;
else
	y_A4 = -1;
end
v_A5 = hsv_value_A5*w1(n) + metric_A5*w2(n) + b(n);
if v_A5 > 0
	y_A5 = 1;
else
	y_A5 = -1;
end
v_A6 = hsv_value_A6*w1(n) + metric_A6*w2(n) + b(n);
if v_A6 > 0
	y_A6 = 1;
else
	y_A6 = -1;
end
v_A7 = hsv_value_A7*w1(n) + metric_A7*w2(n) + b(n);
if v_A7 > 0
	y_A7 = 1;
else
	y_A7 = -1;
end
v_A8 = hsv_value_A8*w1(n) + metric_A8*w2(n) + b(n);
if v_A8 > 0
	y_A8 = 1;
else
	y_A8 = -1;
end
v_A9 = hsv_value_A9*w1(n) + metric_A9*w2(n) + b(n);
if v_A9 > 0
	y_A9 = 1;
else
	y_A9 = -1;
end
v_P3 = hsv_value_P3*w1(n) + metric_P3*w2(n) + b(n);
if v_P3 > 0
	y_P3 = 1;
else
	y_P3 = -1;
end
v_P4 = hsv_value_P4*w1(n) + metric_P4*w2(n) + b(n);
if v_P4 > 0
	y_P4 = 1;
else
	y_P4 = -1;
end

