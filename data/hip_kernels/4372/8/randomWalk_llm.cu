#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomWalk(double *results, int T, int N) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x; // Calculate unique thread index
    if (idx >= N) return; // Ensure index does not exceed array bounds

    hiprandState_t state;
    hiprand_init(1234, idx, 0, &state); // Use unique index for random seed

    double random;

    if (idx == 0) {
        results[idx] = 0.0; // Initialize first element
    } else {
        random = hiprand_normal_double(&state);
        results[idx] = results[idx - 1] + random * sqrt((double)T / N); // Compute result
    }
}