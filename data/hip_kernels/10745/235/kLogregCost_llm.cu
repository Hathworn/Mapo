#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Check if the most probable label is the true label
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            int numMax = 0;
            // Iterate through numOut to count how many have max probability
            for (int i = 0; i < numOut; i++) {
                numMax += __ldg(&probs[i * numCases + tx]) == maxp;
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}