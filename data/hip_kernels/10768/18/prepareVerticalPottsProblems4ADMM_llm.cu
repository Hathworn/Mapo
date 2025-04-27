#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prepareVerticalPottsProblems4ADMM(float* in, float* u, float* v, float* weights, float* weightsPrime, float* lam, float mu, uint32_t w, uint32_t h, uint32_t nc) {
    // Calculate a single unique index for the thread
    uint32_t index = (threadIdx.z + blockDim.z * blockIdx.z) * w * h + 
                     (threadIdx.y + blockDim.y * blockIdx.y) * w + 
                     (threadIdx.x + blockDim.x * blockIdx.x);

    if (index < w * h * nc) { // Overall flatten index compared to the total size
        // Calculate weightsIndex based on x, y
        uint32_t weightsIndex = index % (w * h);

        // Use the calculated index to update v
        v[index] = (weights[weightsIndex] * in[index] + u[index] * mu + lam[index]) / weightsPrime[weightsIndex];
    }
}