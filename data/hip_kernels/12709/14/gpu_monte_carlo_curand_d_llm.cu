#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_monte_carlo_curand_d(double *estimate, hiprandState *states) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int points_in_circle = 0;
    double x, y;

    // Use state update instead of reinitialization
    hiprandState localState = states[tid]; 

    // Unroll the loop for improved performance
    #pragma unroll
    for (int i = 0; i < TRIALS_PER_THREAD; i++) {
        x = hiprand_uniform(&localState);
        y = hiprand_uniform(&localState);
        points_in_circle += (x * x + y * y <= 1.0f);
    }

    // Store the updated state back
    states[tid] = localState; 

    estimate[tid] = 4.0f * points_in_circle / (double)TRIALS_PER_THREAD;
}