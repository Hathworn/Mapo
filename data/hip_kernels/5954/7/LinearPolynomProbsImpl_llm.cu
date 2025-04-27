#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void LinearPolynomProbsImpl( const float* features, int batchSize, const int* splits, const float* conditions, const int* polynomOffsets, int polynomCount, float lambda, float* probs, const int* origFIds) {
// Each thread handles one element of the batch
int tid = threadIdx.x + blockIdx.x * blockDim.x;
if (tid < batchSize) {
    features += tid;
    probs += tid;

    for (int polynomId = threadIdx.y + blockIdx.y * blockDim.y; polynomId < polynomCount; polynomId += blockDim.y * gridDim.y) {
        int offset = polynomOffsets[polynomId];
        int nextOffset = polynomOffsets[polynomId + 1];
        const int depth = nextOffset - offset;
        const int origFId = origFIds[polynomId];

        bool zeroProb = false;
        for (int i = 0; i < depth; ++i) {
            if (zeroProb) {
                break; // Break loop early if probability is zero
            }

            const float c = __ldg(conditions + offset + i);
            const int f = __ldg(splits + offset + i);
            const float x = __ldg(features + f * batchSize);

            if (x <= c) {
                zeroProb = true; // Skip further checks if condition is met
            }
        }

        float prob = 0.0f;
        if (!zeroProb) {
            // Using original feature id for probability calculation
            prob = (origFId != -1) ? __ldg(features + origFId * batchSize) : 1.0f;
        }

        probs[polynomId * batchSize] = prob;
    }
}
}