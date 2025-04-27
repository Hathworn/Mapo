#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableLogit(float x) {
    if(x >= 0) {
        float z = expf(-x);
        return 1.0 / (1.0 + z);
    } else {
        float z = expf(x);
        return z / (1.0 + z);
    }
}

// Kernel function optimized to use efficient grid-stride loop
__global__ void gHighwayBackward(float* out1, float* out2, float* outt, const float* in1, const float* in2, const float* t, const float* adj, size_t length) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t stride = gridDim.x * blockDim.x;
    for(size_t i = index; i < length; i += stride) {
        float sigma = stableLogit(t[i]);
        out1[i] = sigma * adj[i];  // Compute output 1
        out2[i] = (1.f - sigma) * adj[i];  // Compute output 2
        outt[i] = sigma * (1.f - sigma) * (in1[i] - in2[i]) * adj[i];  // Compute output t
    }
}