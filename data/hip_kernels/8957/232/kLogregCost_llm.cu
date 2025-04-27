#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Use a shared variable to store correct probability
        float correctProbability = 0;
        if (labelp == maxp) {
            int numMax = 0;

            // Use loop unrolling to reduce loop iterations
            for (int i = 0; i < numOut; i += 2) {
                numMax += (i < numOut && probs[i * numCases + tx] == maxp);
                if (i + 1 < numOut) {
                    numMax += (probs[(i + 1) * numCases + tx] == maxp);
                }
            }
            correctProbability = 1.0f / float(numMax);
        }
        correctProbs[tx] = correctProbability;
    }
}