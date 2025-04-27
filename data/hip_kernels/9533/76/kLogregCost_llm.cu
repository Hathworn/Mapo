#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    if (tx < numCases) {
        const int label = __float2int_rn(labels[tx]); // Fast conversion from float to int
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp); // Using fast intrinsic for log

        if (labelp != maxp) {
            correctProbs[tx] = 0.0f; // Ensure correct type consistency
        } else {
            // Use shared memory for reduction if necessary (based on occupancy needs)
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);
            }
            correctProbs[tx] = 1.0f / __int2float_rn(numMax); // Fast conversion from int to float
        }
    }
}