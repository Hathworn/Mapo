#include "hip/hip_runtime.h"
#include "includes.h"

// Use constant memory to store thread size
#define LOGREG_ERR_THREADS_X 256

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * blockDim.x + threadIdx.x;  // Use blockDim for thread index calculation

    if (tx < numCases) {
        const int label = (int)labels[tx];
        const float maxp = maxProbs[tx];
        const float labelp = __ldg(&probs[label * numCases + tx]);  // Use __ldg for global memory read on constant data

        labelLogProbs[tx] = __logf(labelp);

        // Use conditional operator to streamline condition check
        correctProbs[tx] = (labelp == maxp) ? 
            1.0f / float(thrust::reduce(thrust::device, probs + tx, probs + tx + numOut * numCases, 0, thrust::plus<int>())) 
            : 0.0f;
    }
}