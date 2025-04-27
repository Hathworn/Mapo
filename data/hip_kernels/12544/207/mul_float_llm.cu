#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_float(int n, float *a, float *b, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride to process larger data sets
    for(int idx = i; idx < n; idx += stride) { // Loop over elements in steps of stride
        sum[idx] = a[idx] * b[idx];
    }
}