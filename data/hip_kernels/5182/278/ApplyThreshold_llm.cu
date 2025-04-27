#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ApplyThreshold(float* probabilitiesInputs, float* binaryOutput, float* probability, int count) {
    // Optimize index calculation to use built-in function for better readability
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < count) {
        // Use ternary operator for branchless optimized assignment
        binaryOutput[id] = (probabilitiesInputs[id] < probability[0]) ? 0.0f : 1.0f;
    }
}