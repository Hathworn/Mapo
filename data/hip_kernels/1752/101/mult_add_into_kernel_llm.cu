#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds and perform computation
    if(i < n){
        c[i] += a[i] * b[i];
    }
}