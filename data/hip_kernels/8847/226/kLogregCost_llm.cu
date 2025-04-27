#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        // Calculate log probability of the label
        labelLogProbs[tx] = __logf(labelp);

        // If label probability is not equal to max probability, set correctProbs to 0
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            // Count number of labels with probability equal to max
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp) ? 1 : 0;
            }
            // Calculate correct probability as reciprocal of numMax
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}