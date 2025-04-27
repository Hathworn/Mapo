#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_vectors(float *ad, float *bd, int N)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Use if-condition only when necessary
    if (index < N) 
    {
        ad[index] += bd[index]; // Optimization: Direct addition within the conditional block
    }
}