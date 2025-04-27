#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ExpProbPolynomForwardImpl(const float* probs, int batchSize, const float* values, int polynomCount, int outputDim, float* out) {

    // Simplify indices for better readability
    int polynomId = blockIdx.x;
    const int dimId = blockIdx.y;
    const int tid = threadIdx.x;

    if (tid >= batchSize) {
        return;
    }

    float sum = 0.0f;  // Initialize sum with 0.0f for precision
    const int batchOffset = tid;  // Calculate offsets for memory coalescing
    const int valueOffset = dimId; 

    // Optimize memory access and reduce repetitive calculations
    for (int pid = polynomId; pid < polynomCount; pid += gridDim.x) {
        const float polynomProb = __ldg(probs + pid * batchSize + batchOffset);
        const float polynomValue = __ldg(values + pid * outputDim + valueOffset);
        sum += polynomProb * polynomValue;
    }

    // Make atomic operations more readable
    atomicAdd(out + dimId * batchSize + batchOffset, sum);
}