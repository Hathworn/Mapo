#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomWalk(double *results, int T, int N) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Initialize state for each thread with unique seed
    hiprandState_t state;
    hiprand_init(1234, idx, 0, &state);

    if(idx < N) {
        results[idx] = 0.0;
        
        // Use stride to loop through elements to allow parallelism
        for (int j = idx + 1; j < N; j += blockDim.x * gridDim.x) {
            double random = hiprand_normal_double(&state);
            results[j] = results[j - 1] + random * sqrt((double) T / N);
        }
    }
}