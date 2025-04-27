#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_monte_carlo(float *estimate, hiprandState *states) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int total_threads = gridDim.x * blockDim.x;
    int points_in_circle = 0;
    float x, y;

    // Initialize once per thread block instead of per thread
    hiprand_init(1234, tid, 0, &states[tid]);

    // Use a stride loop for better memory coalescing and resource utilization
    for (unsigned int i = tid; i < TRIALS_PER_THREAD * total_threads; i += total_threads) {
        x = hiprand_uniform(&states[tid]);
        y = hiprand_uniform(&states[tid]);
        points_in_circle += (x * x + y * y <= 1.0f); // count if x & y is in the circle.
    }

    estimate[tid] = 4.0f * points_in_circle / (float)TRIALS_PER_THREAD; // return estimate of pi
}