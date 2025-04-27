#include "hip/hip_runtime.h"
#include "includes.h"
#include <hiprand_kernel.h>

__global__ void randomWalk(double *results, int *crossTimes, int T, int N, double drift, int numSims, double lowerThreshold, double upperThreshold, int deviceID) {

    int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure thread is within bounds
    if (crossTimeIndex < numSims) {
        
        // Use shared memory for better performance
        __shared__ hiprandState_t state[1024];
        
        // Initialize random state for each thread using thread-specific seeds
        hiprand_init(clock64() + crossTimeIndex * (1000 * deviceID), 0, 0, &state[threadIdx.x]);
        
        double random;
        int start = crossTimeIndex * N; // Use crossTimeIndex directly for start calculation
        
        crossTimes[crossTimeIndex] = 0;
        results[start] = 0.0;
        bool crossed = false;

        // Precompute factors outside the loop
        double sqrtFactor = sqrt((double)T / N);
        double driftFactor = drift * ((double)T / N);

        for (int j = 1; j < N; j++) { // Simplified loop by using j directly
            random = hiprand_normal_double(&state[threadIdx.x]);
            results[start + j] = results[start + j - 1] + driftFactor + random * sqrtFactor;
            if (!crossed) {
                if (results[start + j] >= upperThreshold) {
                    crossTimes[crossTimeIndex] = j;
                    crossed = true;
                } else if (results[start + j] <= lowerThreshold) {
                    crossTimes[crossTimeIndex] = -j;
                    crossed = true;
                }
            }
        }
    }
}