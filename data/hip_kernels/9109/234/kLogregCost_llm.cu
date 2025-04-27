#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    // Ensure this thread operates within the valid range
    if (tx < numCases) {
        const int label = static_cast<int>(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Calculate correct probability based on maximum probability match
        if (labelp != maxp) {
            correctProbs[tx] = 0.0f;
        } else {
            int numMax = 0;

            // Optimize loop by using a single multiplication outside
            probs += tx;
            for (int i = 0; i < numOut; ++i) {
                numMax += probs[i * numCases] == maxp;
            }
            correctProbs[tx] = 1.0f / static_cast<float>(numMax);
        }
    }
}