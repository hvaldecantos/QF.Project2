function [A, b, c] = func2loadcoefficients()
    fA = fopen('fun2_A.txt','r');
    A = fscanf(fA,'%e ',[500,100]);
    fb = fopen('fun2_b.txt','r');
    b = fscanf(fb,'%e ',[500,1]);
    fc = fopen('fun2_c.txt','r');
    c = fscanf(fc,'%e ',[100,1]);
    fclose(fb);
    fclose(fc);
    fclose(fA);
end
