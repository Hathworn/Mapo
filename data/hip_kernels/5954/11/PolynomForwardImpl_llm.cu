#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PolynomForwardImpl(const float* probs, int batchSize, const float* values, int polynomCount, int outputDim, float* out) {
    // Calculate polynomial and dimension indices
    int polynomId = blockIdx.x;
    const int dimId = blockIdx.y;
    int tid = threadIdx.x;

    // Early return if thread index is out of bounds
    if (tid >= batchSize) {
        return;
    }

    float sum = 0.0f;

    // Calculate starting pointers for this thread
    const float* probs_ptr = probs + tid;
    const float* values_ptr = values + dimId;

    // Unroll the loop manually for potential performance gain
    int step = gridDim.x; // Loop stride for polynomial index
    for (int i = polynomId; i < polynomCount; i += step) {
        const float polynomProb = __ldg(probs_ptr + i * batchSize);
        const float polyValue = __ldg(values_ptr + i * outputDim);
        sum += polynomProb * polyValue;
    }

    // Perform atomic add to accumulate results
    atomicAdd(out + dimId * batchSize + tid, sum);
}