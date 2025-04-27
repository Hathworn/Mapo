```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;
    
    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];
        
        // Use more efficient intrinsic function for log
        labelLogProbs[tx] = __logf(labelp);

        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            int numMax = 0;
            // Unroll loop for better performance
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);
            }
            // Avoid division by zero, though it's theoretically unlikely
            correctProbs[tx] = (numMax > 0) ? (1.0f / float(numMax)) : 0.0f;
        }
    }
}