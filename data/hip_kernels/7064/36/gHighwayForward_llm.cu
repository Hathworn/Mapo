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

__global__ void gHighwayForward(float* out, const float* in1, const float* in2, const float* t, size_t length) {
    // Calculate the global index for each thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Step through the array with stride equal to total threads
    for(int i = index; i < length; i += blockDim.x * gridDim.x) {
        float sigma = stableLogit(t[i]);
        out[i] = in1[i] * sigma + in2[i] * (1.f - sigma);
    }
}