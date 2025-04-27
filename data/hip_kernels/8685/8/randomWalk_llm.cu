#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomWalk(double *results, int T, int N) {
    // Use thread ID to initialize state for parallel execution
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    hiprandState_t state;
    hiprand_init (1234, idx, 0, &state); // Unique state for each thread

    // Ensure results initialized properly
    results[idx * N] = 0.0;

    double random;
    for (int j = 1; j < N; j++) {
        random = hiprand_normal_double(&state);
        // Remove computation from index calculation for efficiency
        double delta = random * sqrt((double) T / N);
        results[idx * N + j] = results[idx * N + j - 1] + delta;
    }

    /*
    Generate 2 doubles at once. Test later to see if this is more efficient:
    double hiprand_normal2_double (state);
    */
}
```
