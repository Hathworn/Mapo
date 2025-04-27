#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ExpProbPolynomForwardImpl(const float* probs, int batchSize, const float* values, int polynomCount, int outputDim, float* out) {

    // Calculate indices for this thread
    int polynomId = blockIdx.x;
    const int dimId = blockIdx.y;
    int tid = threadIdx.x;

    // Ensure thread is within bounds
    if (tid >= batchSize) {
        return;
    }

    float sum = 0.0f;
    probs += tid; // Align probs pointer to current thread
    values += dimId; // Align values pointer to current dimension

    // Process polynomials
    while (polynomId < polynomCount) {
        // Use __ldg to cache reads from global memory
        const float polynomProb = __ldg(probs + polynomId * batchSize);
        const float valueOut = __ldg(values + polynomId * outputDim);
        // Accumulate results
        sum += polynomProb * valueOut;
        polynomId += gridDim.x; // Advance to the next polynomial
    }

    // Safely update the output using atomic addition
    atomicAdd(out + dimId * batchSize + tid, sum);
}