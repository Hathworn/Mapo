#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Use shared memory for counting max probability labels to reduce global memory access
        __shared__ int sharedMax[LOGREG_ERR_THREADS_X];
        if (threadIdx.x < numOut) {
            atomicAdd(&sharedMax[threadIdx.x], probs[threadIdx.x * numCases + tx] == maxp);
        }
        __syncthreads();

        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            int numMax = 0;
            for (int i = 0; i < LOGREG_ERR_THREADS_X; i++) {
                numMax += sharedMax[i];
            }
            correctProbs[tx] = 1.0f / float(numMax);
        }
    }
}