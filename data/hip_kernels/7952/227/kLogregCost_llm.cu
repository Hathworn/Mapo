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
            correctProbs[tx] = 0.0f;
        } else {
            int numMax = 0;
            // Reduce the loop by using a shared memory buffer
            __shared__ int sharedNumMax[LOGREG_ERR_THREADS_X]; // Assumes the number of threads per block is LOGREG_ERR_THREADS_X
            sharedNumMax[threadIdx.x] = 0;
            for (int i = threadIdx.x; i < numOut; i += blockDim.x) {
                sharedNumMax[threadIdx.x] += probs[i * numCases + tx] == maxp;
            }
            __syncthreads();
            // Reduction
            if (threadIdx.x == 0) {
                for (int i = 1; i < LOGREG_ERR_THREADS_X; ++i) {
                    sharedNumMax[0] += sharedNumMax[i];
                }
                numMax = sharedNumMax[0];
            }
            __syncthreads();
            if (threadIdx.x == 0) {
                correctProbs[tx] = 1.0f / float(numMax);
            }
        }
    }
}