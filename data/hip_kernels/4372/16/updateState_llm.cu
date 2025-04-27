#include "hip/hip_runtime.h"
#include "includes.h"
#include <hiprand_kernel.h> // Include HIPRAND library

__global__ void updateState(double *B, double *external, double *lamBeta, int dim, float timestep, double noise, int length, int totalIterations, int iterationNum) {
    int index = (blockIdx.x * blockDim.x) + threadIdx.x + length;
    if (index >= length && index < length + dim) {
        int neuronNum = index % dim;
        double lam = lamBeta[neuronNum * 2];
        double beta = lamBeta[neuronNum * 2 + 1];

        double input = B[index] + external[neuronNum * totalIterations + iterationNum];
        double old_output = B[index - dim];
        double d_layers = (-old_output) + 1.0 / (1.0 + exp(-lam * (input - beta))); // Simplified calculations

        // Use HIPRAND library for better random number generation
        hiprandState_t state;
        hiprand_init(blockIdx.x * blockDim.x + threadIdx.x, 0, 0, &state); // Simplified initialization
        double random = hiprand_normal_double(&state); // Use double precision 
        double gauss_noise = noise * random * sqrt(timestep);
        
        B[index] = old_output + d_layers * timestep + gauss_noise; // Update state
    }
}
```
