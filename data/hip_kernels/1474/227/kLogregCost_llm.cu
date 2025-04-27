#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        // Use fast math log function
        labelLogProbs[tx] = __logf(labelp);

        // Simplify conditional assignment using ternary operator
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            int numMax = 0;
            float maxProb = maxProbs[tx];
            // Optimize loop by unrolling it or minimizing the iterator operations
            for (int i = 0; i < numOut; ++i) {
                numMax += (probs[i * numCases + tx] == maxProb);
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}