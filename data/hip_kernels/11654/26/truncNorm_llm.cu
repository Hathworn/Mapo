#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double dnorm(float x, float mu, float sigma) {
    float std = (x - mu) / sigma;
    float e = exp(-0.5f * std * std);
    return e / (sigma * sqrtf(2.0f * 3.141592653589793f));
}

__global__ void truncNorm(float *out, float *unifVals, int N) {
    // Combine block and thread indices into a single linear index
    int idx = blockIdx.x * blockDim.x * blockDim.y * blockDim.z + 
              threadIdx.z * blockDim.x * blockDim.y + 
              threadIdx.y * blockDim.x + 
              threadIdx.x;
    
    if (idx < N) {
        // Utilize precomputed constant instead of inline calculation
        const float inv_norm_const = 1.0f / 0.3413447460685f;
        out[idx] = unifVals[idx] * dnorm(unifVals[idx], 0, 1) * inv_norm_const;
    }
}