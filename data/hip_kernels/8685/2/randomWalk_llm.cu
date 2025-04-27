#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomWalk(double *results, int *crossTimes, int T, int N, int numSims, double lowerThreshold, double upperThreshold, int *dev_failCross, double seconds) {
    int crossTimeIndex = blockIdx.x * blockDim.x + threadIdx.x;
    if (crossTimeIndex >= numSims) return;  // Early exit for out of bounds
    
    // Initialize random state
    hiprandState_t state;
    hiprand_init(blockIdx.x * 1000 + threadIdx.x + static_cast<int>(seconds), 0, 0, &state);
    
    int start = crossTimeIndex * N;
    crossTimes[crossTimeIndex] = 0;
    results[start] = 0.0;
    bool crossed = false;
    double random;

    for (int j = 1; j < N; j++) {  // Start loop from 1 to reduce index calculations
        random = hiprand_normal_double(&state);
        results[start + j] = results[start + j - 1] + random * sqrt(static_cast<double>(T) / N);
        
        if (!crossed && results[start + j] >= upperThreshold) {
            crossTimes[crossTimeIndex] = j;
            crossed = true;
        } else if (!crossed && results[start + j] <= lowerThreshold) {
            crossTimes[crossTimeIndex] = -j;
            crossed = true;
        }
    }

    // If no crossing occurred
    if (!crossed) {
        atomicAdd(dev_failCross, 1);
    }
}