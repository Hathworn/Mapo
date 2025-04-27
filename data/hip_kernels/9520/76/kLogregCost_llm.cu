#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;
    
    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Early assignment of zero in the common case where label probability is not max
        float correctProb = 0.0f;

        // Check if label probability is equal to max probability
        if (labelp == maxp) {
            int numMax = 0;
            // Optimize loop by reducing redundant reads
            float* probPtr = probs + tx;
            for (int i = 0; i < numOut; i++, probPtr += numCases) {
                numMax += (*probPtr == maxp);
            }
            correctProb = 1.0f / float(numMax);
        }
        correctProbs[tx] = correctProb;
    }
}