#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuAdd(int n, float *a, float *b, float *result)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that all threads can be utilized
    int stride = gridDim.x * blockDim.x;

    // Process each element in strides to cover all data
    for (int idx = i; idx < n; idx += stride)
    {
        result[idx] = a[idx] + b[idx];
    }
}