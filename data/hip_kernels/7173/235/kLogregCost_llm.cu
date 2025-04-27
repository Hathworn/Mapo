#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = __float2int_rd(labels[tx]); // Use fast intrinsic function for type conversion
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];
        
        labelLogProbs[tx] = __logf(labelp); // Lightweight log function

        // Check for equality with a small epsilon to handle floating point precision issues
        if (fabs(labelp - maxp) > 1e-6f) {
            correctProbs[tx] = 0.0f;
        } else {
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                // Use atomic add to safely increment numMax
                numMax += fabs(probs[i * numCases + tx] - maxp) < 1e-6f;
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}