#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_monte_carlo(float *estimate, hiprandState *states) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int points_in_circle = 0;
    float x, y;

    // Initialize CURAND only once outside the loop to save time
    hiprand_init(1234, tid, 0, &states[tid]);

    // Use local variable register to cache state
    hiprandState localState = states[tid];

    for(int i = 0; i < TRIALS_PER_THREAD; i++) {
        // Update state with hiprand_uniform to increase efficiency
        x = hiprand_uniform(&localState);
        y = hiprand_uniform(&localState);
        points_in_circle += (x*x + y*y <= 1.0f); // count if x & y is in the circle.
    }

    // Write back to global memory
    states[tid] = localState;

    // Store the result
    estimate[tid] = 4.0f * points_in_circle / (float) TRIALS_PER_THREAD; // return estimate of pi
}