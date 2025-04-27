#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Use fast conditional operator instead of branching logic
        int numMax = 0;
        #pragma unroll  // Unroll loop for better performance
        for (int i = 0; i < numOut; i++) {
            numMax += __float2int_rd(probs[i * numCases + tx] == maxp); // Use fast integer conversion
        }
        correctProbs[tx] = (labelp == maxp) ? (1.0f / float(numMax)) : 0.0f;  // Replace branching with ternary operator
    }
}