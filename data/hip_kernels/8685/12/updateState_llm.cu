#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateState(float *B, float *external, int dim, float timestep, int length, float L, float M) {
    int index = blockIdx.x * blockDim.x + threadIdx.x + length;

    // Ensure index is within bounds for computation
    if (index < length + dim) {
        float input = B[index] + external[index];
        float old_output = B[index - dim];

        // Optimize the calculation by combining operations for better performance
        float exp_val = expf(-L * (input - M));
        float d_layers = (-old_output) + 1 / (1 + exp_val);

        // Update B using optimized calculation
        B[index] = old_output + d_layers * timestep;
    }
}