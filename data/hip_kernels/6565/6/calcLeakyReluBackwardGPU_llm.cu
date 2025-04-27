#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcLeakyReluBackwardGPU(float *dz_next_layer, float *dz_in, float *dz, float *in, int elements)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation

    if (id < elements) {
        float grad_factor = (in[id] < 0) ? 0.01f : 1.0f; // Pre-compute gradient factor
        dz_in[id] += dz_next_layer[id];
        dz[id] += grad_factor * dz_in[id]; // Use pre-computed gradient factor
    }
}