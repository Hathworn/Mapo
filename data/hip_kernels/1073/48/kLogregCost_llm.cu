#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = __float2int_rn(labels[tx]);  // Use faster rounding integer conversion
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        if (labelp != maxp) {
            correctProbs[tx] = 0.0f;
        } else {
            int numMax = 0;
            // Use unrolled loop for small numOut
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);
            }
            correctProbs[tx] = __frcp_rn(float(numMax));  // Use fast reciprocal
        }
    }
}