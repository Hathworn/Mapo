#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateState(double *B, double *external, double *lamBeta, int dim, float timestep, double noise, int length, int totalIterations, int iterationNum) {
    int index = (blockIdx.x * blockDim.x) + threadIdx.x + length;
    if (index >= length && index < length + dim) {
        int neuronNum = index % dim;
        double lam = lamBeta[neuronNum * 2];
        double beta = lamBeta[neuronNum * 2 + 1];

        double input = B[index] + external[neuronNum * (totalIterations) + iterationNum];
        double old_output = B[index - dim];
        double d_layers = (-1 * old_output) + 1 / (1 + expf(-1 * lam * (input - beta)));

        // Improve random number generation by initializing state outside loops
        __shared__ hiprandState_t sharedState[256]; // assuming max of 256 threads/block
        if (threadIdx.x < 256) {
            hiprand_init(blockIdx.x * 1000 + threadIdx.x, 0, 0, &sharedState[threadIdx.x]);
        }
        __syncthreads();

        hiprandState_t state = sharedState[threadIdx.x];
        float random = hiprand_normal(&state);
        sharedState[threadIdx.x] = state;
        double guassian_noise = noise * random * sqrt(timestep);
        
        B[index] = old_output + d_layers * timestep + guassian_noise;
    }
}