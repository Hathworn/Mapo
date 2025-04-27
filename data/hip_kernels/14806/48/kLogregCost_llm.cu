#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
    const int tx = blockIdx.x * LOGREG_ERR_THREADS_X + threadIdx.x;

    // Ensure thread works on a valid case
    if (tx < numCases) {
        const int label = __float2int_rd(labels[tx]); // Use fast rounding intrinsic
        const float maxp = maxProbs[tx];
        const float labelp = probs[label * numCases + tx];

        labelLogProbs[tx] = __logf(labelp);

        // Initialize numMax to count occurrences of the maximum probability
        int numMax = 0;
        bool isCorrectLabel = labelp == maxp; // Check if the label probabilty equals max probability

        // Loop unrolling to optimize counting max probability occurrences
        for (int i = 0; i < numOut; i += 4) {
            if (i < numOut) numMax += (probs[i * numCases + tx] == maxp);
            if (i + 1 < numOut) numMax += (probs[(i + 1) * numCases + tx] == maxp);
            if (i + 2 < numOut) numMax += (probs[(i + 2) * numCases + tx] == maxp);
            if (i + 3 < numOut) numMax += (probs[(i + 3) * numCases + tx] == maxp);
        }

        // Assign probability based on most probable label check
        correctProbs[tx] = isCorrectLabel ? 1.0f / float(numMax) : 0.0f;
    }
}