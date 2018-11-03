README FILE

README FILE for submission Project 2
====================================

* CISC 810 - Quantitative Foundation
  Rochester Institute of Technology
  November 2nd, 2018

* Project 2:  Unconstrained optimization methods
  Students:   Valdecantos Hector - Ankit Aich
  Instructor: Linwei Wang

This is a Matlab project on unconstrained optimization methods.

INSTRUCTIONS:

  1. Open Matlab and set the project path to the folder containing the
     above mentioned files.
  2. For each function given you can apply a different descendent method by
     passing a different string argument correspondig to the method.

     For example, for Function 1 with Gradient descent method:

        >> [e, p] = func1_test("gd");
		Elapsed time is 0.007559 seconds.

		ans = 

		    "Minimum value f1 is 9.750534e-05 "

     The return will tell you about the time the method has consumed and
     the variables in [e, p] will contains the errors and points obtained
     in computed each iteration.

  3. For a different method just change the string argument:

        "gd" stands for Gradient descent method
  		"nw" stands for Newton method
  		"qn" stands for Quasi-Newton method
  		"cd" stands for Quasi-Newton method

  4. There are three functions to test:

        >> [e, p] = func1_test(method);
        >> [e, p] = func2_test(method);
        >> [e, p] = func3_test(method);
            
    The argument method is a string variable containing one of the strings
    corresponding to a method as stated in 3.
