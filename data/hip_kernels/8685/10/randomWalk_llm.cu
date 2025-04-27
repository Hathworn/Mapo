#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomWalk(double *results, int *crossTimes, int T, int N, int numSims, double upperThreshold, double deviceID) {

    // Calculate the global index
    int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;

    if (crossTimeIndex < numSims) {

        // Initialize the random number generator using a unique seed
        hiprandState_t state;
        hiprand_init(blockIdx.x * (1000 * deviceID) + threadIdx.x + clock64(), 0, 0, &state);
        
        // Starting position of this simulation in results array
        int start = crossTimeIndex * N;

        // Set default value of cross time for this simulation to 0
        crossTimes[crossTimeIndex] = 0;

        // Starting point of path is 0
        results[start] = 0.0;

        // Track whether this path has crossed the threshold
        bool crossed = false;

        // Calculate next step of path, break early if crossed
        for (int j = 1; j < N; j++) {
            double random = hiprand_normal_double(&state);
            results[start + j] = results[start + j - 1] + random * sqrt((double) T / N);

            if (!crossed && results[start + j] >= upperThreshold) {
                crossTimes[crossTimeIndex] = j;
                crossed = true;
                break; // Exit loop early if threshold crossed
            }
        }
    }
}
