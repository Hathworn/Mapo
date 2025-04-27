#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    // Ensure tx is within the valid range
    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        // Use efficient intrinsic function for computing logarithm
        labelLogProbs[tx] = __logf(labelp);

        // Use a ternary operator for efficiency in conditions
        int numMax = 0;
        #pragma unroll
        for (int i = 0; i < numOut; i++) {
            numMax += (probs[i * numCases + tx] == maxp);
        }
        
        // Use ternary operator for compact conditional assignment
        correctProbs[tx] = (labelp != maxp) ? 0.0f : 1.0f / float(numMax);
    }
}