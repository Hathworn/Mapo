#include "hip/hip_runtime.h"
#include "includes.h"
#include "hiprand_kernel.h"

__global__ void randomWalk(double *results, int *crossTimes, int T, int N, int numSims, double upperThreshold, double deviceID) {

    // Calculate the unique index for each simulation
    int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if the current thread is within the number of simulations
    if (crossTimeIndex < numSims) {
        
        // Initialize random number generator state with a unique seed
        hiprandState_t state;
        hiprand_init(blockIdx.x * (1000 * deviceID) + threadIdx.x + clock64(), 0, 0, &state);
        
        // Initialize and calculate the starting position in the results array for this simulation
        int start = crossTimeIndex * N;
        crossTimes[crossTimeIndex] = 0; // Default crossing time is 0 - simulation hasn't crossed the threshold

        bool crossed = false; // Track if the threshold has been crossed
        results[start] = 0.0; // Starting point of path

        // Loop through steps to simulate the random walk
        for (int j = 1; j < N; j++) {
            double random = hiprand_normal_double(&state); // Generate a random number
            results[start + j] = results[start + j - 1] + random * sqrt((double) T / N); // Calculate next step

            // Record crossing time once the upper threshold is crossed
            if (!crossed && results[start + j] >= upperThreshold) {
                crossTimes[crossTimeIndex] = j;
                crossed = true;
            }
        }
    }
}