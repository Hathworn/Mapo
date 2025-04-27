#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            // Use warp reduction to calculate numMax more efficiently
            int numMax = 0;
            for (int i = threadIdx.x; i < numOut; i += blockDim.x) {
                numMax += (probs[i * numCases + tx] == maxp) ? 1 : 0;
            }

            // Use shared memory for intermediate results within the block
            __shared__ int sharedNumMax;
            if (threadIdx.x == 0) sharedNumMax = 0;
            __syncthreads();

            // Atomic add to accumulate results from each thread
            atomicAdd(&sharedNumMax, numMax);
            __syncthreads();

            if (threadIdx.x == 0) {
                correctProbs[tx] = 1.0f / float(sharedNumMax);
            }
        }
    }
}