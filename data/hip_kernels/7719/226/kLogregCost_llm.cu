#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    // Ensure within bounds
    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Use shared memory for optimizations
        extern __shared__ int sharedCount[];
        sharedCount[threadIdx.x] = 0;

        // Compute the number of labels with max probability
        if (labelp == maxp) {
            for (int i = threadIdx.x; i < numOut; i += blockDim.x) {
                if (probs[i * numCases + tx] == maxp) {
                    atomicAdd(&sharedCount[threadIdx.x], 1);
                }
            }
        }
        __syncthreads();

        // Accumulate results in one thread
        if (threadIdx.x == 0) {
            int numMax = 0;
            for (int i = 0; i < blockDim.x; i++) {
                numMax += sharedCount[i];
            }
            if (labelp == maxp) {
                correctProbs[tx] = 1.0f / float(numMax);
            } else {
                correctProbs[tx] = 0;
            }
        }
    }
}