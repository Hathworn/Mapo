#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Use boolean short-circuiting to avoid unnecessary work
        if (labelp == maxp) {
            int numMax = 1;  // Include the current label in the count
            for (int i = 0; i < numOut; i++) {
                if (i != label && probs[i * numCases + tx] == maxp) {
                    numMax++;
                }
            }
            correctProbs[tx] = 1.0f / float(numMax);
        } else {
            correctProbs[tx] = 0.0f;
        }
    }
}