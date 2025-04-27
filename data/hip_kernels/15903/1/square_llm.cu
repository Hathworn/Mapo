#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(float* d_out, const float* __restrict__ d_in) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    float f = d_in[idx];
    d_out[idx] = f * f;
}