#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ApplyThreshold(float* probabilitiesInputs, float* binaryOutput, float* probability, int count) {
    // Calculate global thread ID with optimized grid setup
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the current id is within bounds
    if (id < count) {
        // Use ternary operator for branch reduction
        binaryOutput[id] = (probabilitiesInputs[id] < probability[0]) ? 0.0f : 1.0f;
    }
}