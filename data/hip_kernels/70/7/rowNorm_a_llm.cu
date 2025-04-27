#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void rowNorm_a(float* X, float* v, float* a, unsigned int size, unsigned int n)
{
    // Calculate row once outside loop
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned long int i = idx; i < size; i += stride) {
        unsigned int row = i / n; // Use unsigned int for row to avoid unnecessary casting
        float factor = v[row] * a[row]; // Calculate multiplication once
        X[i] /= factor; // Use the pre-calculated factor
    }
}