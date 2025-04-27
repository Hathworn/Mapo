#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void recipSummation(double* data, double* recip, int len)
{
    // Calculate global thread index
    const int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    if (i < len) {
        const int j = 2 * i;

        // Multiply by reciprocal for both elements consecutively
        double recip_val = recip[i];
        data[j]     *= recip_val;
        data[j + 1] *= recip_val;
    }
}