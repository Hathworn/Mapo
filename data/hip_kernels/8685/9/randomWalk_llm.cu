#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomWalk(double *results, int *crossTimes, int T, int N, int numSims, double upperThreshold, double deviceID) {
    // Calculate linear thread index.
    int crossTimeIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread is within bounds.
    if (crossTimeIndex < numSims) {
        // Initialize RNG state with better randomness using deviceID as a seed.
        hiprandState_t state;
        hiprand_init(blockIdx.x * (1000 * deviceID) + threadIdx.x + clock64(), 0, 0, &state);

        // Determine start index for results array.
        int start = crossTimeIndex * N;

        // Initialize crossing times and results.
        crossTimes[crossTimeIndex] = 0;
        results[start] = 0.0;

        bool crossed = false; // Indicates if threshold has been crossed.

        // Pre-calculate the factor for random walk.
        double stepFactor = sqrt((double)T / N);

        for (int j = 1; j < N; j++) {
            // Generate random step and update path.
            double random = hiprand_normal_double(&state);
            results[start + j] = results[start + j - 1] + random * stepFactor;

            // Check for crossing the upper threshold.
            if (!crossed && results[start + j] >= upperThreshold) {
                crossTimes[crossTimeIndex] = j; // Record crossing time.
                crossed = true;
            }
        }
    }
}