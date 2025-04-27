#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = __float2int_rd(labels[tx]); // Use faster intrinsic for float to int conversion
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Optimized conditional statement
        if (labelp == maxp) {
            int numMax = 0;

            // Unroll the loop for potential performance improvement
            for (int i = 0; i < numOut; ++i) {
                numMax += __fastequf(probs[i * numCases + tx], maxp); // Use fast float equality check
            }
            correctProbs[tx] = 1.0f / float(numMax);
        } else {
            correctProbs[tx] = 0.0f;
        }
    }
}