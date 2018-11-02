README FILE

README FILE for submission Project 2
====================================

* CISC 810 - Quantitative Foundation
  Rochester Institute of Technology
  November 2nd, 2018

* Project 1:  Linear Feature Engineering
  Students:   Valdecantos Hector - Ankit Aich
  Instructor: Linwei Wang

This is a Matlab project on unconstrained optimization methods.

INSTRUCTIONS:

  1. Open Matlab and set the project path to the folder containing the above
     mentioned files.
  2. For each function you can execute each method as follows:
  		Function 1 - Gradient descent method:
		>> [e, p] = func1_test("gd");
		Elapsed time is 0.007559 seconds.

		ans = 

		    "Minimum value f1 is 9.750534e-05 "

		The return [e, p] contains the errors and points obtained in each iteration.

		For each method to be applied to the another function just change the 
		function name as follows:

  		Function 2 - Newton method:
  			>> [e, p] = func2_test("gd");
  			>> [e, p] = func3_test("gd");

  		For a different method just change the string argument:
  			"gd" stands for Gradient descent method
  			"nw" stands for Newton method
  			"qn" stands for Quasi-Newton method
  			"cd" stands for Quasi-Newton method
