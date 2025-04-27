#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    // Ensure thread index is within the number of cases.
    if (tx < numCases) {
        const int label = static_cast<int>(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Calculate correctProb only when labelp matches maxp
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            int numMax = 0;
            // Optimize loop to fetch probs data only once.
            for (int i = 0; i < numOut; i++) {
                float currentProb = probs[i * numCases + tx];
                numMax += (currentProb == maxp);
            }
            // Change division order to avoid unnecessary float conversion.
            correctProbs[tx] = 1.0f / numMax;
        }
    }
}