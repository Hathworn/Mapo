#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"


//=== Vector math (two arguments) ============================================


// Create value with given magnitude, copying sign of second value.
extern "C"

// Compute the positive difference between x and y.
extern "C"

// Divide two floating point values.
extern "C"

// Determine the maximum numeric value of the arguments.
extern "C"

// Determine the minimum numeric value of the arguments.
extern "C"

// Calculate the floating-point remainder of x / y.
extern "C"

// Calculate the square root of the sum of squares of two arguments.
extern "C"

// Return next representable single-precision floating-point value afer argument.
extern "C"

// Calculate the value of first argument to the power of second argument.
extern "C"

// Compute single-precision floating-point remainder.
extern "C"




// Optimized kernel for natural logarithm function computation
__global__ void vec_log1pf(size_t n, float *result, float *x) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use loop unrolling for improved performance
    int stride = gridDim.x * blockDim.x;
    for (int i = id; i < n; i += stride) {
        result[i] = log1pf(x[i]);
    }
}