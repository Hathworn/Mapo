#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void rowNorm(float* X, float* v, unsigned int size, unsigned int n)
{
    // Calculate thread-specific index and stride
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Iterate with computed stride for workload balance
    for (unsigned int i = idx; i < size; i += stride) {
        unsigned int row = i / n;  // Calculate row index based on linear index
        X[i] /= v[row];  // Normalize current element by corresponding row value
    }
}