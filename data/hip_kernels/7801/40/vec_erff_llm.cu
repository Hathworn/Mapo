#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

extern "C"

// Improved vector and scalar arithmetic kernel 
extern "C"

//=== Vector math (one argument) =============================================

// Calculate the error function of the input argument.
__global__ void vec_erff(size_t n, float* result, float* x) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use consistent thread ID calculation
    if (id < n) {
        result[id] = erff(x[id]); // Efficient memory access and computation
    }
}