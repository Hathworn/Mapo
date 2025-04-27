#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void rowNorm(float* X, float* v, unsigned int size, unsigned int n)
{
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    // Utilize more registers efficiently by removing the cast to int
    for (unsigned long int i = idx; i < size; i += stride) {
        unsigned int row = i / n; // Calculate row index using division
        X[i] /= v[row]; // Divide by corresponding row normalization factor
    }
}