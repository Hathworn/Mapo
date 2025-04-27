#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcReluBackwardGPU(float *dz_next_layer, float *dz_in, float *dz, float *in, int elements)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified ID calculation
    if (id < elements) {
        float dz_next = dz_next_layer[id]; // Cache read values to reduce global memory access
        float input = in[id];               // Cache read values to reduce global memory access

        dz_in[id] += dz_next;
        dz[id] += (input < 0) ? 0.0f : dz_in[id]; // Simplify ternary operation with 0.0f
    }
}