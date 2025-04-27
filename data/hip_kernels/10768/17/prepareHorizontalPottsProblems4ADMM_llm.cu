#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void prepareHorizontalPottsProblems4ADMM(float* in, float* u, float* v, float* weights, float* weightsPrime, float* lam, float mu, uint32_t w, uint32_t h, uint32_t nc) {
    uint32_t x = threadIdx.x + blockDim.x * blockIdx.x;
    uint32_t y = threadIdx.y + blockDim.y * blockIdx.y;
    uint32_t c = threadIdx.z + blockDim.z * blockIdx.z;

    // Use shared memory to optimize memory access if needed
    if(x < w && y < h && c < nc) {
        // Combine two variables for indexing to reduce calculations
        uint32_t xyIndex = x + w * y;
        uint32_t index = xyIndex + w * h * c;

        // Perform calculations using registers if it fits
        float weight = weights[xyIndex];
        float weightPrime = weightsPrime[xyIndex];

        // Calculate u using precomputed variables
        u[index] = (weight * in[index] + v[index] * mu - lam[index]) / weightPrime;
    }
}