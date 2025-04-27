#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = __float2int_rn(labels[tx]); // Use fast float-to-int conversion.
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        float correctProbability = 0.0f; // Initialize outside of conditions.
        if (labelp == maxp) {
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp); // Avoid branching, use boolean arithmetic.
            }
            correctProbability = 1.0f / float(numMax);
        }
        correctProbs[tx] = correctProbability; // Assign once.
    }
}