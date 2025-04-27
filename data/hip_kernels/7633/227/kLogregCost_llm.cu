#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * blockDim.x + threadIdx.x;  // Simplifying thread index calculation

    if (tx < numCases) {
        const int label = __float2int_rn(labels[tx]);  // Faster integer conversion
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        if (labelp != maxp) {
            correctProbs[tx] = 0.0f;  // Use 0.0f for explicit float
        } else {
            int numMax = 0;
            for (int i = 0; i < numOut; i++) {
                numMax += (probs[i * numCases + tx] == maxp);  // Parentheses for clear logic evaluation
            }
            correctProbs[tx] = 1.0f / static_cast<float>(numMax);  // Consistent float casting
        }
    }
}