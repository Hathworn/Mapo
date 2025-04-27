#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomWalk(double *results, int *crossTimes, int T, int N, int numSims) {
// Use 2D grid for improved index mapping
int crossTimeIndex = blockIdx.x * blockDim.x + threadIdx.x;

if (crossTimeIndex < numSims) {
    hiprandState_t state;
    // Initialize the random generator per thread for unique sequences
    hiprand_init(1234, crossTimeIndex, 0, &state);
    
    double random;
    int start = crossTimeIndex * N;  // Simplified access

    crossTimes[crossTimeIndex] = 0;
    results[start] = 0.0;

    // Use vectorized access for SIMD potential 
    for (int j = 1; j < N; j++) {   
        random = hiprand_normal_double(&state);
        results[start + j] = results[start + j - 1] + random * sqrt((double)T / N);
    }
}
}
```
