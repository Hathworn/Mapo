#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void vecInit(float* X, unsigned int size, float value)
{
    // Calculate the global thread ID
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop through indices with a stride of total threads
    for (unsigned int i = idx; i < size; i += blockDim.x * gridDim.x) {
        X[i] = value; // Set the value at each index
    }
}