#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ExpProbPolynomProbsImpl(const float* features, int batchSize, const int* splits, const float* conditions, const int* polynomOffsets, int polynomCount, float lambda, float* probs) {
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (threadId < batchSize) {
        features += threadId;
        probs += threadId;

        for (int polynomId = blockIdx.x; polynomId < polynomCount; polynomId += gridDim.x) {
            int offset = polynomOffsets[polynomId];
            int nextOffset = polynomOffsets[polynomId + 1];
            const int depth = nextOffset - offset;

            float logProb = 0;
            bool zeroProb = false;
            
            // Unroll the loop to enhance parallel computation (assuming depth is small)
            for (int i = 0; i < depth && !zeroProb; ++i) {
                const int f = __ldg(splits + offset + i);
                const float c = __ldg(conditions + offset + i);
                const float x = __ldg(features + f * batchSize);

                const float val = -lambda * x;
                const float expVal = 1.0f - expf(val);

                if (isfinite(log(expVal))) {
                    logProb += log(expVal);
                } else {
                    zeroProb = true;
                }
            }
            
            float prob = zeroProb ? 0.0f : expf(logProb);
            probs[polynomId * batchSize] = prob;
        }
    }
}