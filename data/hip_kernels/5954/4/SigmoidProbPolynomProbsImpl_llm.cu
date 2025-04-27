#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SigmoidProbPolynomProbsImpl(
    const float* features, 
    int batchSize, 
    const int* splits, 
    const float* conditions, 
    const int* polynomOffsets, 
    int polynomCount, 
    float lambda, 
    float* probs
) {
    // Each thread computes the probabilities for its assigned feature set.
    int threadId = threadIdx.x + blockIdx.x * blockDim.x;
    if (threadId < batchSize) {
        features += threadId;
        probs += threadId;
        
        int polynomId = blockIdx.y;  // Use blockIdx.y to parallelize over polynomIDs
        while (polynomId < polynomCount) {
            int offset = polynomOffsets[polynomId];
            int nextOffset = polynomOffsets[polynomId + 1];
            const int depth = nextOffset - offset;

            float logProb = 0.0f;
            for (int i = 0; i < depth; ++i) {
                const int f = __ldg(splits + offset + i);
                const float c = __ldg(conditions + offset + i);
                const float x = __ldg(features + f * batchSize);
                const float val = -lambda * (x - c);
                const float expVal = 1.0f + expf(val);
                const float isTrueLogProb = isfinite(expVal) ? log(expVal) : val;
                logProb -= isTrueLogProb;
            }
            const float prob = expf(logProb);
            probs[polynomId * batchSize] = prob;
            polynomId += gridDim.y;  // Advance by block count in the y-dimension
        }
    }
}