#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;
    
    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];
        
        labelLogProbs[tx] = __logf(labelp);
        
        // Compute probability of selecting the most probable label
        if (labelp != maxp) {
            correctProbs[tx] = 0.0f;
        } else {
            int numMax = 0;
            float maxProbVal = 0.0f;
            for (int i = 0; i < numOut; i++) {
                // Unroll loop for efficiency and leverage for parallel comparison
                float currentProb = probs[i * numCases + tx];
                if (currentProb == maxp) {
                    numMax++;
                    maxProbVal = currentProb;
                }
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}