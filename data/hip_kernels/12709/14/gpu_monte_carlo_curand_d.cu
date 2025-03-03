#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_monte_carlo_curand_d(double *estimate, hiprandState *states) {
unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
int points_in_circle = 0;
double x, y;

hiprand_init(1234, tid, 0, &states[tid]);  // 	Initialize CURAND


for(int i = 0; i < TRIALS_PER_THREAD; i++) {
x = hiprand_uniform (&states[tid]);
y = hiprand_uniform (&states[tid]);
points_in_circle += (x*x + y*y <= 1.0f); // count if x & y is in the circle.
}
estimate[tid] = 4.0f * points_in_circle / (double) TRIALS_PER_THREAD; // return estimate of pi
}