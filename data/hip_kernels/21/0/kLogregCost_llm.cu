#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * blockDim.x + threadIdx.x;  // Use blockDim.x for generalization

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        if (labelp != maxp) {
            correctProbs[tx] = 0.0f;
        } else {
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);  // Use explicit parentheses
            }
            correctProbs[tx] = 1.0f / static_cast<float>(numMax);  // Use static_cast for clarity
        }
    }
}