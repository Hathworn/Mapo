#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = __float2int_rd(labels[tx]); // Use fast conversion
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Early exit if label probability is not max
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            int numMax = 0;
            // Use shared memory to minimize global memory accesses
            __shared__ int sharedNumMax[LOGREG_ERR_THREADS_X];
            sharedNumMax[threadIdx.x] = 0; // Initialize shared memory location

            for (int i = threadIdx.x; i < numOut; i += LOGREG_ERR_THREADS_X) {
                if (probs[i * numCases + tx] == maxp) {
                    atomicAdd(&sharedNumMax[threadIdx.x], 1);
                }
            }
            __syncthreads(); // Ensure all threads have completed their additions

            if (threadIdx.x == 0) { // Single thread final aggregation
                numMax = 0;
                for (int i = 0; i < LOGREG_ERR_THREADS_X; ++i) {
                    numMax += sharedNumMax[i];
                }
                correctProbs[tx] = 1.0f / float(numMax);
            }
        }
    }
}