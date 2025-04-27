#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = int(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Early exit if most probable label isn't the true label
        if (labelp != maxp) {
            correctProbs[tx] = 0;
        } else {
            // Optimize numMax calculation using parallel reduction within a block
            int numMax = 0;
            for (int i = threadIdx.x; i < numOut; i += blockDim.x) {
                atomicAdd(&numMax, (probs[i * numCases + tx] == maxp) ? 1 : 0);
            }
            __shared__ int totalMax;
            if (threadIdx.x == 0) {
                totalMax = numMax;
                for (int i = 1; i < blockDim.x; i++) {
                    totalMax += __shfl_sync(0xFFFFFFFF, numMax, i);
                }
            }
            __syncthreads();
            if (threadIdx.x == 0) {
                correctProbs[tx] = 1.0f / float(totalMax);
            }
        }
    }
}