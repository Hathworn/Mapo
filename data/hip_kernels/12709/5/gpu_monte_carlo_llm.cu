#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_monte_carlo(float *estimate, hiprandState *states) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int points_in_circle = 0;
    float x, y;

    hiprand_init(1234, tid, 0, &states[tid]); // Initialize CURAND

    // Unroll loop to optimize performance
    #pragma unroll 
    for(int i = 0; i < TRIALS_PER_THREAD; i++) {
        x = hiprand_uniform(&states[tid]);
        y = hiprand_uniform(&states[tid]);
        points_in_circle += (x * x + y * y <= 1.0f); // Count if x & y are in the circle
    }

    estimate[tid] = 4.0f * points_in_circle / (float) TRIALS_PER_THREAD; // Return estimate of pi
}