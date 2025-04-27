#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kLogregCost kernel function
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Optimize probability computation using a single comparison.
        int numMax = (labelp == maxp) ? 1 : 0;
        for (int i = 0; i < numOut; i++) {
            // Accumulate the count of maximum probabilities
            numMax += probs[i * numCases + tx] == maxp;
        }
        correctProbs[tx] = (labelp == maxp) ? (1.0f / float(numMax)) : 0.0f;
    }
}