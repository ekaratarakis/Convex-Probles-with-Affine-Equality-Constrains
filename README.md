# Convex-Probles-with-Affine-Equality-Constrains
The problem which we are going to study is an convex problem with affine equality constrains.

![image affine problem](https://github.com/ekaratarakis/Convex-Probles-with-Affine-Equality-Constrains/blob/master/Images/affine%20problem.jpg)

where A belongs to R+^{pxn}, rank(A) = p and b belongs to R+{p}.
## Solving with CVX
An extremely good approach of the problem's solution can be obtained via CVX which is a Mathworks product. Further information in the link below

http://cvxr.com/cvx/

## Solving with Newton Algorithm
After that we perform again the search of a feasible point x0 with CVX having under consideration that 

**x0 > 0 & Ax0 = b**

Then we use the above x0 to implement the Newton algorithm for finding a feasible point x0. Newton's method was implemented with backtracking. 

## Comparing the Results
Now, we notice that not only the output from the CVX solution method but also the output from Newton's method converge to a feasible point x0. Of course, there are some deviation but we can ignore it.

![image Outcome_1](https://github.com/ekaratarakis/Convex-Probles-with-Affine-Equality-Constrains/blob/master/Images/outcome_1.jpg)
