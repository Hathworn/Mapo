#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void recipSummation(double* data, double* recip, int len)
{
    // Calculate the global index
    const int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Process only valid elements
    if (i < len) {
        const int j = 2 * i;
        double recip_val = recip[i]; // Cache reciprocal value
        data[j]     *= recip_val;    // Multiply and update
        data[j + 1] *= recip_val;
    }
}