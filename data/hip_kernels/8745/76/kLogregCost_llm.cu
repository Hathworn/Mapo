#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * blockDim.x + threadIdx.x;  // Use blockDim.x for flexibility

    if (tx < numCases) {
        const int label = __float2int_rd(labels[tx]);  // Faster integer conversion
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Direct computation of correctProbs
        int numMax = 0;
        float equalMax = 0.0f;

        if (labelp == maxp) {
            for (int i = 0; i < numOut; ++i) {
                const float prob = probs[i * numCases + tx];  // Load once, used twice
                numMax += (prob == maxp);
                equalMax += (prob == maxp);  // Avoid branching in +=
            }
            correctProbs[tx] = 1.0f / equalMax;  // No branch here, computed as zero if false
        } else {
            correctProbs[tx] = 0.0f;  // Direct assignment for branch not taken
        }
    }
}