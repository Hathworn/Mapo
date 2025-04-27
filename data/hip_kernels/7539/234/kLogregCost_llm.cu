#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Optimize the computation by using a ternary operator and unrolling loop.
        correctProbs[tx] = (labelp != maxp) ? 0.0f : 1.0f / float([&](){
            int numMax = 0;
            for (int i = 0; i < numOut; i += 4) { // Unroll loop for efficiency.
                numMax += (probs[i * numCases + tx] == maxp);
                if (i + 1 < numOut) numMax += (probs[(i + 1) * numCases + tx] == maxp);
                if (i + 2 < numOut) numMax += (probs[(i + 2) * numCases + tx] == maxp);
                if (i + 3 < numOut) numMax += (probs[(i + 3) * numCases + tx] == maxp);
            }
            return numMax;
        }());
    }
}