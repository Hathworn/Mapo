#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_monte_carlo_d(double *estimate, hiprandState *states) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int points_in_circle = 0;
    double x, y;

    // Use shared memory for better performance
    __shared__ hiprandState localStates[BLOCK_SIZE];
    if (threadIdx.x < BLOCK_SIZE) {
        hiprand_init(1234, tid, 0, &localStates[threadIdx.x]);
    }
    __syncthreads();

    hiprandState localState = localStates[threadIdx.x];
    
    for(int i = 0; i < TRIALS_PER_THREAD; i++) {
        x = hiprand_uniform(&localState);
        y = hiprand_uniform(&localState);
        points_in_circle += (x * x + y * y <= 1.0f); // count if x & y is in the circle
    }

    localStates[threadIdx.x] = localState;
    __syncthreads();

    estimate[tid] = 4.0f * points_in_circle / (double) TRIALS_PER_THREAD; // return estimate of pi
}