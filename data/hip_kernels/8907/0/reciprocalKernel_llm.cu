#include "hip/hip_runtime.h"
#include "includes.h"

/*
============================================================================
Name        : Teste.cu
Author      :
Version     :
Copyright   : Your copyright notice
Description : CUDA compute reciprocals
============================================================================
*/

static void CheckCudaErrorAux(const char *, unsigned, const char *, hipError_t);
#define CUDA_CHECK_RETURN(value) CheckCudaErrorAux(__FILE__, __LINE__, #value, value)

/**
* CUDA kernel that computes reciprocal values for a given vector
*/
__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    // Calculate global index
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds and compute reciprocal for valid element
    if (idx < vectorSize) {
        data[idx] = 1.0f / data[idx]; // Use '1.0f' for float precision
    }
}