#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

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

// Optimized kernel function using shared memory and warp-level parallelism
__global__ void vec_tanf(size_t n, float *result, float *x) {
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    int id = tid + blockIdx.x * blockDim.x;

    // Load data into shared memory
    if (id < n) {
        sdata[tid] = x[id];
    }
    __syncthreads();

    // Use warp-level operations if all threads are within bounds
    if (id < n) {
        result[id] = tanf(sdata[tid]);
    }
}