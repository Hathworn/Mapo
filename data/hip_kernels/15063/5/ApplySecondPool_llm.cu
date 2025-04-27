#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ApplySecondPool(float* input, float* output) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Cache reused index calculations into variables
    int baseIdx = id * 2 * 146;
    int outputBaseIdx = id * 73;

    for (int i = 0; i < 73; ++i) {
        // Use local variables for indices to improve readability
        int inputBaseIdx = i * 2 + baseIdx;
        
        // Calculate maximum using a single step with a temporary variable
        float maxVal = max(input[inputBaseIdx], input[inputBaseIdx + 1]);
        maxVal = max(maxVal, input[inputBaseIdx + 146]);
        maxVal = max(maxVal, input[inputBaseIdx + 147]);

        // Optimized output calculation
        output[outputBaseIdx + i] = 1 / (1 + exp(-(maxVal * 2 - 1)));
    }
}