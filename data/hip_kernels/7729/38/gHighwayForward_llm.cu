#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableSigmoid(float x) {
    if (x >= 0) {
        float z = expf(-x);
        return 1.0 / (1.0 + z);
    } else {
        float z = expf(x);
        return z / (1.0 + z);
    }
}

__global__ void gHighwayForward(float* out, const float* in1, const float* in2, const float* t, size_t length) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (index < length) { // Check if index is within bounds
        float sigma = stableSigmoid(t[index]);
        out[index] = in1[index] * sigma + in2[index] * (1.f - sigma);
    }
}
```
