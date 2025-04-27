#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prepareDiagonalPottsProblems8ADMM(float* in, float* u, float* v, float* w_, float* z, float* weights, float* weightsPrime, float* lam2, float* lam4, float* lam6, float mu, uint32_t w, uint32_t h, uint32_t nc) {
    uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;
    uint32_t c = blockIdx.z * blockDim.z + threadIdx.z;

    // Boundary check to ensure memory accesses are within bounds
    if (x < w && y < h && c < nc) {
        // Calculate index for accessing data
        uint32_t index = x + w * y + w * h * c;
        uint32_t weightsIndex = x + w * y;

        // Optimize computation by storing repeated calculations in variables
        float in_val = in[index];
        float sum_uvz = u[index] + v[index] + z[index];
        float sum_lam = lam2[index] + lam4[index] - lam6[index];

         // Perform computation and store result
        w_[index] = (weights[weightsIndex] * in_val + 2 * mu * sum_uvz + 2 * sum_lam) / weightsPrime[weightsIndex];
    }
}