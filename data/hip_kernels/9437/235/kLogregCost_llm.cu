#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * blockDim.x + threadIdx.x;

    if (tx < numCases) {
        const int label = __float2int_rn(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        // Use fast math function for log
        labelLogProbs[tx] = __logf(labelp);

        // Initialize correctProbs to 0
        correctProbs[tx] = 0.0f;
        
        // Check if the label probability is equal to the maximum probability
        if (labelp == maxp) {
            int numMax = 0;
            // Loop unrolling for potential speed-up
            for (int i = 0; i < numOut; i += 2) {
                numMax += (probs[i * numCases + tx] == maxp);
                if (i + 1 < numOut) {
                    numMax += (probs[(i + 1) * numCases + tx] == maxp);
                }
            }
            // Calculate probability for correct classification
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}