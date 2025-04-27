#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initvectors(double4 *acc3, float4 *apred) {
    // Calculate unique global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single statement to initialize double4 and float4
    acc3[i] = make_double4(0.0, 0.0, 0.0, acc3[i].w);
    apred[i] = make_float4(0.0f, 0.0f, 0.0f, apred[i].w);
}