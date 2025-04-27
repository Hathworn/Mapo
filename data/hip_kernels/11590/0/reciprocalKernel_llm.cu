#include "hip/hip_runtime.h"
#include "includes.h"
/*
============================================================================
Name        : nothing.cu
Author      :
Version     :
Copyright   : Your copyright notice
Description : CUDA compute reciprocals
============================================================================
*/

static void CheckCudaErrorAux (const char *, unsigned, const char *, hipError_t);
#define CUDA_CHECK_RETURN(value) CheckCudaErrorAux(__FILE__,__LINE__, #value, value)

/**
* CUDA kernel that computes reciprocal values for a given vector
*/

/**
* Host function that copies the data and launches the work on GPU
*/
__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    // Calculate global index
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds
    if (idx < vectorSize) {

        // Use precomputed reciprocal instead of division
        data[idx] = __frcp_rn(data[idx]);
    }
}