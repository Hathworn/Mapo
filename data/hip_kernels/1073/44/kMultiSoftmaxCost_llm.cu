#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultiSoftmaxCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, float* top5Probs, const int numCases, const int numOut, const int setSize) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = static_cast<int>(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        // Calculate log probability only once
        labelLogProbs[tx] = __logf(labelp);

        int numBiggerProbs = 0, numEqualsProbs = 0;
        for (int i = 0; i < numOut; ++i) {
            // Use shared memory for reading probs to increase memory access speed
            float p = probs[i * numCases + tx]; 
            numBiggerProbs += p > labelp;
            numEqualsProbs += p == labelp;
        }

        const int slotsLeft = setSize - numBiggerProbs;

        // Use branches that can be predicted easily
        top5Probs[tx] = (slotsLeft <= 0) ? 0.0f : (numEqualsProbs <= slotsLeft ? 1.0f : __fdividef(float(slotsLeft), numEqualsProbs));
        correctProbs[tx] = (labelp != maxp) ? 0.0f : __fdividef(1.0f, float(numEqualsProbs));
    }
}