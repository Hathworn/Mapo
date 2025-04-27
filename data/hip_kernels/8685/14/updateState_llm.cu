#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateState(float *B, float *external, int dim, float timestep, float noise, int length, int totalIterations, int iterationNum, float L, float M) {
    // Calculate global thread index
    int index = (blockIdx.x * blockDim.x) + threadIdx.x + length;

    // Ensure index is within valid range
    if (index >= length && index < length + dim) {
        // Calculate neuron number based on index
        int neuronNum = index % dim;
        
        // Calculate neuron input and old output
        float input = B[index] + external[neuronNum * totalIterations + iterationNum];
        float old_output = B[index - dim];
        
        // Calculate differential layers using sigmoid function
        float d_layers = -old_output + 1 / (1 + expf(-L * (input - M)));

        // Use thread-specific state for random number generation        
        __shared__ hiprandState_t sharedState[blockDim.x];
        if (threadIdx.x == 0) {
            hiprand_init(blockIdx.x * 1000 + clock64(), 0, 0, &sharedState[threadIdx.x]);
        }
        __syncthreads();

        // Generate Gaussian noise with pre-seeded random state
        hiprandState_t localState = sharedState[threadIdx.x];
        float random = hiprand_normal(&localState);
        float gaussian_noise = noise * random * sqrt(timestep);

        // Update neuron state
        B[index] = old_output + d_layers * timestep + gaussian_noise;

        // Write back updated random state to shared memory
        sharedState[threadIdx.x] = localState;
    }
}