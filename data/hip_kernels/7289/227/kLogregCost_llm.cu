```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Use a bisection strategy for the correct probability calculation
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            int numMax = 0;
            // Reduce loop body size while counting max probabilities
            for (int i = 0; i < numOut; i++) {
                numMax += __float2int_rz(probs[i * numCases + tx] == maxp);
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}