#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_monte_carlo_d(double *estimate, hiprandState *states) {
    // Calculate global thread index
    unsigned int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int points_in_circle = 0; 
    double x, y;

    // Initialize CURAND
    hiprand_init(1234, tid, 0, &states[tid]);

    // Perform Monte Carlo simulation
    for (int i = 0; i < TRIALS_PER_THREAD; i++) {
        x = hiprand_uniform(&states[tid]);
        y = hiprand_uniform(&states[tid]);
        points_in_circle += (x * x + y * y <= 1.0f); // Check if the point is inside the circle
    }

    // Compute and store the estimate of pi
    estimate[tid] = 4.0 * points_in_circle / (double)TRIALS_PER_THREAD;
}