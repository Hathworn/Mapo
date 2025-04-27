#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_monte_carlo(float *estimate, hiprandState *states) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int points_in_circle = 0;
    float x, y;

    hiprandState localState = states[tid]; // Cache state in local memory for faster access
    hiprand_init(1234, tid, 0, &localState); // Initialize CURAND

    // Unroll the loop to improve performance
    for(int i = 0; i < TRIALS_PER_THREAD; i += 4) {
        x = hiprand_uniform(&localState);
        y = hiprand_uniform(&localState);
        points_in_circle += (x*x + y*y <= 1.0f);

        x = hiprand_uniform(&localState);
        y = hiprand_uniform(&localState);
        points_in_circle += (x*x + y*y <= 1.0f);

        x = hiprand_uniform(&localState);
        y = hiprand_uniform(&localState);
        points_in_circle += (x*x + y*y <= 1.0f);

        x = hiprand_uniform(&localState);
        y = hiprand_uniform(&localState);
        points_in_circle += (x*x + y*y <= 1.0f);
    }
    
    states[tid] = localState; // Store updated state back to global memory
    estimate[tid] = 4.0f * points_in_circle / (float) TRIALS_PER_THREAD; // return estimate of pi
}