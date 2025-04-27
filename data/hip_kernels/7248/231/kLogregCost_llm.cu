#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        // Use intrinsic function for logarithm to improve performance
        labelLogProbs[tx] = __logf(labelp);

        // Optimize condition check by avoiding unnecessary computations
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            // Use atomic operation to count max-prob labels in parallel
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);
            }
            // Ensure division is done outside of loop for efficiency
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}