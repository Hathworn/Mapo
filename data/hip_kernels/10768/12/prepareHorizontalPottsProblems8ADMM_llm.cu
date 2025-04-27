#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prepareHorizontalPottsProblems8ADMM(float* in, float* u, float* v, float* w_, float* z, 
                                                    float* weights, float* weightsPrime, float* lam1, 
                                                    float* lam2, float* lam3, float mu, uint32_t w, 
                                                    uint32_t h, uint32_t nc) {
    // Calculate global thread indices for x, y, c
    uint32_t x = threadIdx.x + blockDim.x * blockIdx.x;
    uint32_t y = threadIdx.y + blockDim.y * blockIdx.y;
    uint32_t c = threadIdx.z + blockDim.z * blockIdx.z;

    // Check boundary conditions for each dimension
    if(x < w && y < h && c < nc) {
        // Calculate linear indices for accessing arrays
        uint32_t index = x + w * y + w * h * c;
        uint32_t weightsIndex = x + w * y;

        // Perform computation and update u array
        float tempSum = weights[weightsIndex] * in[index] + 2.0f * mu * (v[index] + w_[index] + z[index])
                        - 2.0f * (lam1[index] + lam2[index] + lam3[index]);  // Simplified operations
        u[index] = tempSum / weightsPrime[weightsIndex];  // Division remains unchanged
    }
}