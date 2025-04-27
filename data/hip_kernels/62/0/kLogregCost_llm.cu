#include "hip/hip_runtime.h"
#include "includes.h"

#define LOGREG_ERR_THREADS_X 256 // Assuming this macro is defined elsewhere

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Optimize conditional logic to simplify the calculation of correctProbs
        float correctProb = 0;
        if (labelp == maxp) {
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);
            }
            correctProb = 1.0f / float(numMax);
        }
        correctProbs[tx] = correctProb;
    }
}