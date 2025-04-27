#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float activator_derivative(float x) {
    float sig = 1.0f / (1.0f + exp(-x));
    return sig * (1 - sig);
}

__global__ void calcSigmoidBackwardGPU(float *dz_next_layer, float *dz_in, float *dz, float *in, int elements) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    if (id < elements) {
        float x = dz_in[id] += dz_next_layer[id]; // Fetch and accumulate in a single operation
        float sig = 1.0f / (1.0f + exp(-x));
        dz[id] += (sig * (1 - sig)) * dz_in[id]; // Perform the operation using local variables
    }
}