#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addMoreThreads(int n, float *x, float *y)
{
    // Use global thread index for better parallelism
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop over the array with increased stride
    for (int i = index; i < n; i += stride)
        y[i] = x[i] + y[i];
}