#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only compute if tx is a valid index
    if (tx < numCases) {
        const int label = static_cast<int>(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];
        
        // Compute logarithm of the predicted probability for the true label
        labelLogProbs[tx] = __logf(labelp);
        
        // Initialize numMax to 0 or 1 based on whether labelp equals maxp
        int numMax = (labelp == maxp) ? 1 : 0;

        // Count occurrences of maxp among all predictions for this case
        for (int i = 0; i < numOut; i++) {
            numMax += (probs[i * numCases + tx] == maxp) && (labelp != maxp);
        }

        // Correct probability calculation
        correctProbs[tx] = (labelp == maxp) ? (1.0f / static_cast<float>(numMax)) : 0.0f;
    }
}