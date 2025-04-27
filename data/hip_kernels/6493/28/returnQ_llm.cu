#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void returnQ (const int dim, const int n, const float *s1, const float *s0, const float *zr, float *q) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for loop unrolling
    for (; i < n; i += stride) { // Use loop to handle more data per thread
        float diff = s1[i] - s0[i]; // Precompute s1[i] - s0[i]
        q[i] = expf(-0.5f * diff) * powf(zr[i], dim - 1); // Compute once using precomputed value
    }
}