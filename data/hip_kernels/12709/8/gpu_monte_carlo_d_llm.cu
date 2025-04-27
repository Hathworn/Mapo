#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_monte_carlo_d(double *estimate, hiprandState *states) {
    unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int points_in_circle = 0;
    double x, y;

    // Use thread index as seed for diversity
    hiprand_init(1234 + tid, tid, 0, &states[tid]);

    // Unroll loop for better parallelism
    #pragma unroll
    for(int i = 0; i < TRIALS_PER_THREAD; i++) {
        x = hiprand_uniform(&states[tid]);
        y = hiprand_uniform(&states[tid]);
        points_in_circle += (x * x + y * y <= 1.0f); // Check if point is within the circle
    }
    // Store computed estimate for Pi
    estimate[tid] = 4.0 * points_in_circle / TRIALS_PER_THREAD;
}