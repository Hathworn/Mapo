#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = static_cast<int>(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        if (labelp != maxp) {
            correctProbs[tx] = 0.0f;
        } else {
            int numMax = 0;
            // Optimize the loop using unrolling for potential performance gain.
            for (int i = 0; i < numOut; i += 4) {
                numMax += (i < numOut && probs[i * numCases + tx] == maxp);
                numMax += ((i + 1) < numOut && probs[(i + 1) * numCases + tx] == maxp);
                numMax += ((i + 2) < numOut && probs[(i + 2) * numCases + tx] == maxp);
                numMax += ((i + 3) < numOut && probs[(i + 3) * numCases + tx] == maxp);
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}