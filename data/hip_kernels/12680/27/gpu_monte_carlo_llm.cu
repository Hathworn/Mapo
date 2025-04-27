#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized Monte Carlo kernel function
__global__ void gpu_monte_carlo(float *estimate, hiprandState *states) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int points_in_circle = 0;

    // Initialize CURAND once per thread
    hiprand_init(1234, tid, 0, &states[tid]);

    // Use local variables and unroll loop for better performance
    for (int i = 0; i < TRIALS_PER_THREAD; i++) {
        float x = hiprand_uniform(&states[tid]);
        float y = hiprand_uniform(&states[tid]);
        points_in_circle += (x * x + y * y <= 1.0f);
    }
    // Store calculated estimate
    estimate[tid] = 4.0f * points_in_circle / (float) TRIALS_PER_THREAD;
}