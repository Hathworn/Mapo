#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initvectors(double4 *acc3, float4 *apred) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < gridDim.x * blockDim.x) { // Check to prevent out-of-bounds access
        acc3[i] = make_double4(0.0, 0.0, 0.0, acc3[i].w); // Initialize acc3 only x, y, z
        apred[i] = make_float4(0.0f, 0.0f, 0.0f, apred[i].w); // Initialize apred only x, y, z
    }
}