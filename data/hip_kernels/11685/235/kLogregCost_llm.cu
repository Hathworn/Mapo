#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Determine correct probability
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            int numMax = 1; // Initialize to 1 to handle the label case efficiently
            for (int i = 0; i < numOut; i++) {
                if (i != label) { // Skip the label position
                    numMax += probs[i * numCases + tx] == maxp;
                }
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}