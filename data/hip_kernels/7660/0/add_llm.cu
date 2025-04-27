#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" 
__global__ void add(int n, float *a, float *b, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilizing grid-stride loop for scalability
    for(; i < n; i += blockDim.x * gridDim.x)
    {
        sum[i] = a[i] + b[i];
    }
}