#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = static_cast<int>(labels[tx]);  // Use static_cast for type conversion
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Initialize numMax to 1 if the label probability equals max probability to prevent over-counting
        int numMax = (labelp == maxp) ? 1 : 0; 

        // Efficiently compute the number of maximum probabilities in parallel
        for (int i = 0; i < numOut; i++) {
            if (probs[i * numCases + tx] == maxp) {
                numMax++;
            }
        }

        // Calculate correct probability based on numMax
        correctProbs[tx] = 1.0f / static_cast<float>(numMax);
    }
}