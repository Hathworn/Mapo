#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // If labelp is not maxp, set correctProbs[tx] to 0; otherwise, calculate correctProbs[tx].
        if (labelp != maxp) {
            correctProbs[tx] = 0.0f;
        } else {
            // Use float comparison and count the number of maximum probabilities.
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);
            }
            // Safely handle numMax being zero, though it should be one.
            correctProbs[tx] = numMax > 0 ? 1.0f / float(numMax) : 0.0f; 
        }
    }
}