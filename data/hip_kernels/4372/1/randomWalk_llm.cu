#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomWalk(double *results, int *crossTimes, int T, int N, double drift, int numSims, double lowerThreshold, double upperThreshold, int deviceID) {

    int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;
    if (crossTimeIndex < numSims) {
        // Initialize random state per thread using an improved seed for better randomness
        hiprandState_t state;
        hiprand_init(blockIdx.x * (1000ULL * deviceID) + threadIdx.x + clock64(), 0, 0, &state);
        
        double random;
        int start = (threadIdx.x + blockIdx.x * blockDim.x) * N;

        crossTimes[crossTimeIndex] = 0;
        results[start] = 0.0;
        bool crossed = false;
        double sqrt_dt = sqrt((double)T / N); // Precompute sqrt(T/N) for efficiency

        for (int j = start + 1; j < start + N; j++) {
            // Use single random call and precomputed sqrt_dt to enhance performance
            random = hiprand_normal_double(&state);
            results[j] = results[j-1] + drift * ((double)T / N) + random * sqrt_dt;
            
            if (!crossed && results[j] >= upperThreshold) {
                crossTimes[crossTimeIndex] = j - start;
                crossed = true;
            } else if (!crossed && results[j] <= lowerThreshold) {
                crossTimes[crossTimeIndex] = -1 * (j - start);
                crossed = true;
            }
        }
    }
}