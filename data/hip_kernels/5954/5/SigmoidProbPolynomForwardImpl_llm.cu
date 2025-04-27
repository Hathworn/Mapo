#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SigmoidProbPolynomForwardImpl(const float* probs, int batchSize, const float* values, int polynomCount, int outputDim, float* out) {
    // Each block works on a unique combination of polynomId and dimId
    int polynomId = blockIdx.x;
    const int dimId = blockIdx.y;
    int tid = threadIdx.x;

    if (tid >= batchSize) {
        return;
    }

    float sum = 0.0f;
    // Offset pointers for the current thread
    const float* probsPtr = probs + tid;
    const float* valuesPtr = values + dimId;

    // Loop through all polynomials
    while (polynomId < polynomCount) {
        // Cache read only data in registers for reuse
        const float polynomProb = __ldg(probsPtr + polynomId * batchSize);
        const float val = __ldg(valuesPtr + polynomId * outputDim);
        // Accumulate the polynomial probability multiplied by its corresponding value
        sum += polynomProb * val;
        polynomId += gridDim.x;
    }

    // Atomically update the output for this dimension and batch element
    atomicAdd(out + dimId * batchSize + tid, sum);
}