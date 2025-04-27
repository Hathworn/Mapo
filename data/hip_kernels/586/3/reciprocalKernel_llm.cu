#include "hip/hip_runtime.h"
#include "includes.h"
/*
============================================================================
Name        : SpikeSorting.cu
Author      : John
Version     :
Copyright   :
Description : CUDA compute reciprocals
============================================================================
*/

static void CheckCudaErrorAux (const char *, unsigned, const char *, hipError_t);
#define CUDA_CHECK_RETURN(value) CheckCudaErrorAux(__FILE__,__LINE__, #value, value)

__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    // Calculate a unique thread index
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform bounds checking before computation
    if (idx < vectorSize) {
        float value = data[idx]; // Avoid repeated global memory access
        data[idx] = 1.0 / value; // Compute reciprocal
    }
}