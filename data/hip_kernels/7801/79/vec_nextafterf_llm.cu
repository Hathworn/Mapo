#include "hip/hip_runtime.h"
#include "includes.h"
/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Improved kernel for vec_nextafterf
__global__ void vec_nextafterf (size_t n, float *result, float *x, float *y) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Stride by total number of threads
    int stride = blockDim.x * gridDim.x;
    for (int i = id; i < n; i += stride) {
        result[i] = nextafterf(x[i], y[i]);
    }
}