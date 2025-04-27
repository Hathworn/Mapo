#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void sub_double(int n, double *a, double *b, double *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single-threaded loop to process multiple elements if needed
    for (; i < n; i += blockDim.x * gridDim.x)
    {
        sum[i] = a[i] - b[i];
    }
}