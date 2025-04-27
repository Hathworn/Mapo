#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateState(float *B, float *external, int dim, float timestep, float noise, int length, int totalIterations, int iterationNum, float L, float M) {
    int index = (blockIdx.x * blockDim.x) + threadIdx.x + length;
    // Ensure index is within bounds
    if (index >= length && index < length + dim) {
        int neuronNum = index % dim;
        // Pre-compute reused values for efficiency
        float input = B[index] + external[neuronNum * totalIterations + iterationNum];
        float old_output = B[index - dim];
        float exp_val = expf(-1 * L * (input - M));
        float d_layers = (-1 * old_output) + 1 / (1 + exp_val);

        // Initialize random number generator once per thread to reduce overhead
        __shared__ hiprandState_t sharedState[256];
        if (threadIdx.x < 256) {
            hiprand_init(blockIdx.x * 1000 + threadIdx.x, 0, 0, &sharedState[threadIdx.x]);
        }
        __syncthreads();
        hiprandState_t localState = sharedState[threadIdx.x];
        float random = hiprand_normal(&localState);
        B[index] = old_output + d_layers * timestep + noise * random * sqrt(timestep);
    }
}