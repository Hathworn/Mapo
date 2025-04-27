#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Optimize: Utilize shared memory for numMax calculation.
        extern __shared__ int sharedNumMax[];

        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            int numMax = 0;
            for (int i = threadIdx.x; i < numOut; i += blockDim.x) {
                // Use atomic operation to safely update shared memory.
                atomicAdd(&sharedNumMax[threadIdx.x], probs[i * numCases + tx] == maxp);
            }
            __syncthreads();

            // Reduce shared memory results.
            if (threadIdx.x == 0) {
                for (int i = 0; i < blockDim.x; i++) {
                    numMax += sharedNumMax[i];
                }
                correctProbs[tx] = 1.0f / float(numMax);
            }
        }
    }
}