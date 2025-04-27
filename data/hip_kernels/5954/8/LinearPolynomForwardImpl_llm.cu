#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LinearPolynomForwardImpl(const float* probs, int batchSize, const float* values, int polynomCount, int outputDim, float* out) {
    // out: batch_elem0 dim0, dim1, dimk batch_elem1 dim0 dim1 dimk
    // threads are batch elements

    int polynomId = blockIdx.x;
    const int dimId = blockIdx.y;

    int tid = threadIdx.x;
    if (tid >= batchSize) {
        return;
    }

    float sum = 0;
    int probOffset = tid + polynomId * batchSize; // precompute offset for probs
    int valOffset = dimId + polynomId * outputDim; // precompute offset for values

    while (polynomId < polynomCount) {
        const float polynomProb = __ldg(probs + probOffset); // precomputed offset
        const float v = __ldg(values + valOffset); // precomputed offset
        sum += polynomProb * v;
        
        polynomId += gridDim.x;
        probOffset += gridDim.x * batchSize; // update offset
        valOffset += gridDim.x * outputDim; // update offset
    }

    atomicAdd(out + dimId * batchSize + tid, sum);
}