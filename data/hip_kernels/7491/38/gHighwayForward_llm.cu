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

__global__ void gHighwayForward(float* out, const float* in1, const float* in2, const float* t, size_t length) {
    // Use a single loop iteration and calculate the index directly
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    for(int offset = index; offset < length; offset += blockDim.x * gridDim.x) {
        float sigma = stableSigmoid(t[offset]);
        out[offset] = in1[offset] * sigma + in2[offset] * (1.f - sigma);
    }
}