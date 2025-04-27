#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SigmoidProbPolynomProbsImpl(const float* features, int batchSize, const int* splits, const float* conditions, const int* polynomOffsets, int polynomCount, float lambda, float* probs) {
    // Use blockDim.x rather than batchSize to ensure full occupancy
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    int step = blockDim.x * gridDim.x;
    
    while(threadId < batchSize) {
        const float* featurePtr = features + threadId;
        float* probPtr = probs + threadId;
        int polynomId = blockIdx.y;
        
        while (polynomId < polynomCount) {
            int offset = polynomOffsets[polynomId];
            int nextOffset = polynomOffsets[polynomId + 1];
            const int depth = nextOffset - offset;
            float logProb = 0;

            // Loop unrolling might aid in performance for small depth values
            for (int i = 0; i < depth; ++i) {
                const int f = __ldg(splits + offset + i);
                const float c = __ldg(conditions + offset + i);
                const float x = __ldg(featurePtr + f * batchSize);
                const float val = -lambda * (x - c);
                const float expVal = 1.0f + expf(val);
                const float isTrueLogProb = isfinite(expVal) ? log(expVal) : val;
                logProb -= isTrueLogProb;
            }

            const float prob = expf(logProb);
            probPtr[polynomId * batchSize] = prob;
            polynomId += gridDim.y;
        }
        threadId += step;
    }
}