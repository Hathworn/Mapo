#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SigmoidProbPolynomForwardImpl(const float* probs, int batchSize, const float* values, int polynomCount, int outputDim, float* out) {
    
    int polynomId = blockIdx.x;
    const int dimId = blockIdx.y;
    int tid = threadIdx.x;

    if (tid >= batchSize) {
        return;
    }

    float sum = 0.0f;
    const float* probsLocal = probs + tid;
    const float* valuesLocal = values + dimId;

    // Unrolling loop for better performance
    while (polynomId < polynomCount) {
        float polynomProb = __ldg(probsLocal + polynomId * batchSize);
        float valueOut = __ldg(valuesLocal + polynomId * outputDim);
        sum += polynomProb * valueOut;
        polynomId += gridDim.x;
    }

    // Optimized atomic addition
    atomicAdd(out + dimId * batchSize + tid, sum);
}