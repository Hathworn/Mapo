#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ExpProbPolynomProbsImpl(const float* __restrict__ features, int batchSize, const int* __restrict__ splits, const float* __restrict__ conditions, const int* __restrict__ polynomOffsets, int polynomCount, float lambda, float* __restrict__ probs) {
    int threadId = threadIdx.x + blockIdx.x * blockDim.x;
    int totalThreads = gridDim.x * blockDim.x;

    while (threadId < batchSize) {
        int polynomId = blockIdx.x;

        const float* feature_ptr = features + threadId;
        float* prob_ptr = probs + threadId;

        while (polynomId < polynomCount) {
            int offset = polynomOffsets[polynomId];
            int nextOffset = polynomOffsets[polynomId + 1];
            const int depth = nextOffset - offset;

            float logProb = 0.0f;
            bool zeroProb = false;

            for (int i = 0; i < depth && !zeroProb; ++i) {
                const int f = __ldg(splits + offset + i);
                const float c = __ldg(conditions + offset + i);
                const float x = __ldg(feature_ptr + f * batchSize);

                const float val = -lambda * x;
                const float expVal = 1.0f - expf(val);

                if (isfinite(log(expVal))) {
                    logProb += log(expVal);
                } else {
                    zeroProb = true;
                }
            }

            *prob_ptr = zeroProb ? 0.0f : expf(logProb);

            polynomId += gridDim.x;
            prob_ptr += batchSize;
        }
        threadId += totalThreads; // Ensure all threads can process different indices
    }
}