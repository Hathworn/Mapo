#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    // Ensure we're within bounds
    if (tx < numCases) {
        const int label = __float2int_rd(labels[tx]);  // Use fast integer rounding
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);  // Use high performance log for single float

        // Determine the correctness probability
        if (fabsf(labelp - maxp) > 1e-6) {  // Use fabsf for float comparison
            correctProbs[tx] = 0.0f;
        } else {
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                numMax += __float2int_rd(fabsf(probs[i * numCases + tx] - maxp) < 1e-6);
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}