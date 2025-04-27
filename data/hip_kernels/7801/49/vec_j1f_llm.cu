#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"

//=== Vector arithmetic ======================================================

extern "C"


extern "C"


extern "C"


extern "C"

extern "C"




//=== Vector-and-scalar arithmetic ===========================================

extern "C"


extern "C"


extern "C"


extern "C"




extern "C"


extern "C"


extern "C"


extern "C"











//=== Vector comparison ======================================================

extern "C"


extern "C"


extern "C"


extern "C"


extern "C"



extern "C"




//=== Vector-and-scalar comparison ===========================================

extern "C"


extern "C"


extern "C"


extern "C"


extern "C"


extern "C"











//=== Vector math (one argument) =============================================


// Calculate the arc cosine of the input argument.
extern "C"


// Calculate the nonnegative arc hyperbolic cosine of the input argument.
extern "C"


// Calculate the arc sine of the input argument.
extern "C'


// Calculate the arc hyperbolic sine of the input argument.
extern "C'


// Calculate the arc tangent of the input argument.
extern "C'


// Calculate the arc hyperbolic tangent of the input argument.
extern "C'


// Calculate the cube root of the input argument.
extern "C'


// Calculate ceiling of the input argument.
extern "C'


// Calculate the cosine of the input argument.
extern "C'


// Calculate the hyperbolic cosine of the input argument.
extern "C'


// Calculate the cosine of the input argument × p .
extern "C'


// Calculate the complementary error function of the input argument.
extern "C'


// Calculate the inverse complementary error function of the input argument.
extern "C'


// Calculate the scaled complementary error function of the input argument.
extern "C'


// Calculate the error function of the input argument.
extern "C'


// Calculate the inverse error function of the input argument.
extern "C'


// Calculate the base 10 exponential of the input argument.
extern "C'


// Calculate the base 2 exponential of the input argument.
extern "C'


// Calculate the base e exponential of the input argument.
extern "C'


// Calculate the base e exponential of the input argument, minus 1.
extern "C'


// Calculate the absolute value of its argument.
extern "C'


// Calculate the largest integer less than or equal to x.
extern "C'


// Calculate the value of the Bessel function of the first kind of order 0 for the input argument.
extern "C'


// Calculate the value of the Bessel function of the first kind of order 1 for the input argument.
extern "C'


// Calculate the natural logarithm of the absolute value of the gamma function of the input argument.
extern "C'


// Calculate the base 10 logarithm of the input argument.
extern "C'


// Calculate the value of l o g e ( 1 + x ) .
extern "C'


// Calculate the base 2 logarithm of the input argument.
extern "C'


// Calculate the floating point representation of the exponent of the input argument.
extern "C'


// Calculate the natural logarithm of the input argument.
extern "C'


// Calculate the standard normal cumulative distribution function.
extern "C'


// Calculate the inverse of the standard normal cumulative distribution function.
extern "C'


// Calculate reciprocal cube root function.
extern "C'


// Round input to nearest integer value in floating-point.
extern "C'


// Round to nearest integer value in floating-point.
extern "C'


// Calculate the reciprocal of the square root of the input argument.
extern "C'


// Calculate the sine of the input argument.
extern "C'


// Calculate the hyperbolic sine of the input argument.
extern "C'


// Calculate the sine of the input argument × p .
extern "C'


// Calculate the square root of the input argument.
extern "C'


// Calculate the tangent of the input argument.
extern "C'


// Calculate the hyperbolic tangent of the input argument.
extern "C'


// Calculate the gamma function of the input argument.
extern "C'


// Truncate input argument to the integral part.
extern "C'


// Calculate the value of the Bessel function of the second kind of order 0 for the input argument.
extern "C'


// Calculate the value of the Bessel function of the second kind of order 1 for the input argument.
extern "C'









extern "C"


//--- Optimized global kernel
__global__ void vec_j1f (size_t n, float *result, float *x)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop to handle arbitrary problem sizes
    for (int i = id; i < n; i += blockDim.x * gridDim.x)
    {
        result[i] = j1f(x[i]);
    }
}