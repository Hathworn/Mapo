#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dotProdKernel(float *a, float *b, float *ab, int N)
{
    // Calculate the index within bounds
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        // Perform parallel dot product operation 
        ab[idx] = a[idx] * b[idx];
    }
}