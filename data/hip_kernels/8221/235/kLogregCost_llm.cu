#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    // Launch only necessary threads
    if (tx >= numCases) return;

    const int label = int(labels[tx]);
    const float maxp = maxProbs[tx];
    const float labelp = probs[label * numCases + tx];

    labelLogProbs[tx] = __logf(labelp);

    // Early exit condition to improve performance
    if (labelp != maxp) {
        correctProbs[tx] = 0;
        return;
    }

    int numMax = 0;
    // Reduce iterations using shared memory
    __shared__ float sharedProbs[LOGREG_ERR_THREADS_X];
    for (int i = threadIdx.x; i < numOut; i += LOGREG_ERR_THREADS_X) {
        sharedProbs[threadIdx.x] = probs[i * numCases + tx];
        __syncthreads();
        if (sharedProbs[threadIdx.x] == maxp) numMax++;
        __syncthreads();
    }

    correctProbs[tx] = 1.0f / float(numMax);
}