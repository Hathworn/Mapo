#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcSoftmaxBackwardGPU(float *dz_next_layer, float *dz_in, float *dz, unsigned int n)
{
    // Calculate global thread index
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check within bounds
    if (index < n) {
        // Perform computation
        dz_in[index] += dz_next_layer[index];
        dz[index] += dz_in[index];
    }
}