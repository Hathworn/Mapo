#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Efficient index calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Process only valid indices
    if(i < n) {
        // Optimize arithmetic operation
        float ai = a[i];
        float bi = b[i];
        c[i] += ai * bi;
    }
}