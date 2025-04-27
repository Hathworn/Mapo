#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_monte_carlo_d(double *estimate, hiprandState *states) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int points_in_circle = 0;
    double x, y;

    // Initialize CURAND only once at the beginning
    if (threadIdx.x == 0) {
        hiprand_init(1234, blockIdx.x, 0, &states[blockIdx.x * blockDim.x]);
    }
    __syncthreads();
    hiprandState localState = states[tid]; // Cache state locally to reduce global memory access

    for (int i = 0; i < TRIALS_PER_THREAD; ++i) {
        x = hiprand_uniform(&localState);
        y = hiprand_uniform(&localState);
        points_in_circle += (x * x + y * y <= 1.0f); // count if (x, y) is in the circle
    }
    states[tid] = localState; // Store back the updated state
    estimate[tid] = 4.0f * points_in_circle / (double)TRIALS_PER_THREAD; // return estimate of pi
}