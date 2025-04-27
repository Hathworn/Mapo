#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftmaxGrad(float* dE_dy_l, float* y_l, float* dE_dx_l, int numCases, int numOut) {
    const int tx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block indexing
    const int ty = blockIdx.y * blockDim.y + threadIdx.y; // Simplified block indexing
    const int tidx = ty * numCases + tx;

    if (ty < numOut && tx < numCases) {
        float v = 0.0f;
        float y_cache = y_l[tidx]; // Cache y_l for repeated access
        for (int j = 0; j < numOut; j++) {
            float dE_dy_cache = dE_dy_l[j * numCases + tx]; // Cache dE_dy_l for repeated access
            float y_comparison = (j == ty) ? 1.0f : y_l[j * numCases + tx]; // Avoid branching with ternary
            v += dE_dy_cache * (y_comparison - y_l[j * numCases + tx]);
        }
        dE_dx_l[tidx] = v * y_cache; // Use cached value
    }
}