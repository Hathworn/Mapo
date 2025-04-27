#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel
__global__ void addArray(float *d_a, float *d_b, float *d_c, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Avoid thread divergence by using loop
    while (i < size) {
        d_c[i] = d_a[i] + d_b[i];
        i += blockDim.x * gridDim.x; // Move to next relevant index
    }
}