#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqrt_kernel(float *v, int n) {
    // Efficient calculation of thread index x 
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if x is within bounds
    if (x < n) {
        // Calculate square root of v[x]
        v[x] = sqrtf(v[x]);
    }
}