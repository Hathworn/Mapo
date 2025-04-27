#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];
        
        // Compute log probability
        labelLogProbs[tx] = __logf(labelp);

        // Check if prediction matches max probability
        if (labelp != maxp) {
            // Assign zero probability if no match
            correctProbs[tx] = 0.0f;
        } else {
            // Count labels with max probability
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);
            }
            // Assign correctness probability
            correctProbs[tx] = 1.0f / static_cast<float>(numMax);
        }
    }
}