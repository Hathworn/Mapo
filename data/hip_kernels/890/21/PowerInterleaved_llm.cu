#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void PowerInterleaved(float4 *src, float4 *dest) {
    // Calculate linear index
    const size_t i = blockDim.x * blockIdx.x + threadIdx.x;

    // Cache src values in registers to reduce global memory accesses
    float x = src[i].x;
    float y = src[i].y;
    float z = src[i].z;
    float w = src[i].w;

    // Cross pols
    dest[i].x += x * x + y * y;
    dest[i].y += z * z + w * w;
    // Parallel pols
    dest[i].z += x * z + y * w;
    dest[i].w += y * z - x * w;
}