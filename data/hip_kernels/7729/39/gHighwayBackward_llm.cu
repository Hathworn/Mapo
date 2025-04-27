#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableSigmoid(float x) {
    if(x >= 0) {
        float z = expf(-x);
        return 1.0 / (1.0 + z);
    } else {
        float z = expf(x);
        return z / (1.0 + z);
    }
}

__global__ void gHighwayBackward(float* out1, float* out2, float* outt, const float* in1, const float* in2, const float* t, const float* adj, size_t length) {
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop through elements, in case there are more elements than threads
    while(index < length) {
        float sigma = stableSigmoid(t[index]);
        out1[index] = sigma * adj[index];
        out2[index] = (1.f - sigma) * adj[index];
        outt[index] = sigma * (1.f - sigma) * (in1[index] - in2[index]) * adj[index];

        // Move to the next element for this thread
        index += blockDim.x * gridDim.x;
    }
}