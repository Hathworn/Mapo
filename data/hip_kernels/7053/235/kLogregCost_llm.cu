#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Improved branch by setting default and only checking conditionally
        int numMax = (labelp == maxp);
        float correctProb = 0.0f;

        // Combined loop to avoid conditional execution overhead
        for (int i = 0; i < numOut; i++) {
            numMax += (probs[i * numCases + tx] == maxp);
        }
        
        if (labelp == maxp) {
            correctProb = 1.0f / float(numMax);
        }

        correctProbs[tx] = correctProb;
    }
}