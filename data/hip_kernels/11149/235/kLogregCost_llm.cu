#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Calculate probability of correct prediction
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            int numMax = 0;
            // Use shared memory to reduce global memory accesses and improve performance.
            __shared__ int maxCountShared[LOGREG_ERR_THREADS_X];
            numMax = 0;

            for (int i = threadIdx.x; i < numOut; i += LOGREG_ERR_THREADS_X) {
                numMax += (probs[i * numCases + tx] == maxp);
            }

            // Reduce within block to calculate numMax
            maxCountShared[threadIdx.x] = numMax;
            __syncthreads();

            // Sum up results from shared memory
            if (threadIdx.x == 0) {
                numMax = 0;
                for (int i = 0; i < LOGREG_ERR_THREADS_X; i++) {
                    numMax += maxCountShared[i];
                }
                correctProbs[tx] = 1.0f / float(numMax);
            }
        }
    }
}