#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Use a shared memory counter for better performance on counting numMax
        __shared__ int sharedNumMax[LOGREG_ERR_THREADS_X];
        sharedNumMax[threadIdx.x] = 0;

        // Check if label probability is max probability
        if (labelp == maxp) {
            // Count how many probabilities equal to maxp
            for (int i = threadIdx.x; i < numOut; i += LOGREG_ERR_THREADS_X) {
                sharedNumMax[threadIdx.x] += probs[i * numCases + tx] == maxp;
            }
        }
        __syncthreads(); // Synchronize to ensure all threads have finished counting

        // Sum the counts in shared memory
        if (threadIdx.x == 0) {
            int numMax = 0;
            for (int i = 0; i < LOGREG_ERR_THREADS_X; i++) {
                numMax += sharedNumMax[i];
            }
            correctProbs[tx] = labelp == maxp ? 1.0f / float(numMax) : 0;
        }
    }
}