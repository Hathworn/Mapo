#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // If the most probable label is not equal to the true label, then probability is zero
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            // Count number of labels whose probability is equal to the maximum
            int numMax = 0;
            int i = 0;
            // Unroll the loop to improve performance
            for (; i + 4 <= numOut; i += 4) {
                numMax += (probs[i * numCases + tx] == maxp);
                numMax += (probs[(i + 1) * numCases + tx] == maxp);
                numMax += (probs[(i + 2) * numCases + tx] == maxp);
                numMax += (probs[(i + 3) * numCases + tx] == maxp);
            }
            for (; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}