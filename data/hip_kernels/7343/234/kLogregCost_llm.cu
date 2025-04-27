#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        // Use fast math function for logarithm calculation
        labelLogProbs[tx] = __logf(labelp);

        // Initialize numMax and probabilistic correct class calculation directly
        if (labelp != maxp) {
            correctProbs[tx] = 0.0f;
        } else {
            int numMax = 0;
            #pragma unroll  // Unroll the loop for improved performance
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}