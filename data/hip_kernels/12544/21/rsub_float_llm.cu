#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rsub_float(int n, float *a, float *b, float *sum)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride-based loop to handle more elements per thread
    int stride = gridDim.x * blockDim.x;
    for (; i < n; i += stride)
    {
        sum[i] = b[i] - a[i];
    }
}