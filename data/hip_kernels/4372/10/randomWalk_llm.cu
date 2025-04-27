#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomWalk(double *results, int *crossTimes, int T, int N, int numSims, double upperThreshold, double deviceID) {

    // Calculate global thread index
    int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x; 

    if (crossTimeIndex < numSims) {
        // Initialize random number generator with unique seed
        hiprandState_t state;
        hiprand_init(blockIdx.x * (1000 * deviceID) + threadIdx.x + clock64(), 0, 0, &state);

        double random;
        int start = crossTimeIndex * N; // Optimize computation for start index
        crossTimes[crossTimeIndex] = 0; 
        results[start] = 0.0; 
        bool crossed = false;

        // Unroll loop to enhance performance
        #pragma unroll 4 
        for (int j = 1; j < N; j++) {
            random = hiprand_normal_double(&state);
            results[start + j] = results[start + j - 1] + random * sqrt((double) T / N);

            // Check for crossing event
            if (!crossed && results[start + j] >= upperThreshold) {
                crossTimes[crossTimeIndex] = j;
                crossed = true;
            } 
        }
    }
}