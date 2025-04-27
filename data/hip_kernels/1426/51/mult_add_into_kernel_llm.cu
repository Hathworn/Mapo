#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculating global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Looping to perform operations for multiple elements per thread if needed
    for(int index = i; index < n; index += blockDim.x * gridDim.x) {
        c[index] += a[index] * b[index];
    }
}