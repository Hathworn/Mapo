#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for better flexibility

    if (tx < numCases) {
        const int label = static_cast<int>(labels[tx]);
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Initialize numMax to 0 before entering the loop
        if (labelp == maxp) { // Simplify the conditional check
            int numMax = 0;
            // Use shared memory to increase memory access speed
            __shared__ float sharedProbs[LOGREG_ERR_THREADS_X];

            for (int i = threadIdx.x; i < numOut; i += blockDim.x) { // Unroll the loop for better performance
                sharedProbs[i % LOGREG_ERR_THREADS_X] = probs[i * numCases + tx];
                __syncthreads(); // Ensure all threads have stored the current iteration's value
                numMax += (sharedProbs[i % LOGREG_ERR_THREADS_X] == maxp);
                __syncthreads(); // Ensure computation is done on all values from current iteration
            }
            correctProbs[tx] = 1.0f / float(numMax);
        } else {
            correctProbs[tx] = 0.0f; // Use 0.0f for float consistency
        }
    }
}