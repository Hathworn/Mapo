#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomWalk(double *results, int *crossTimes, int T, int N, int numSims, double lowerThreshold, double upperThreshold, int *dev_failCross, double seconds) {
    int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;
    if (crossTimeIndex < numSims) {
        hiprandState_t state;
        // Initialize random state with more unique seeds
        hiprand_init(blockIdx.x * blockDim.x + threadIdx.x + seconds, 0, 0, &state);
        double random;
        int start = crossTimeIndex * N; // Use crossTimeIndex for a clear offset calculation

        crossTimes[crossTimeIndex] = 0;
        results[start] = 0.0;
        bool crossed = false;

        // Pre-calculate constants outside the loop
        double sqrtVal = sqrt((double)T / N);

        for (int j = 1; j < N; j++) { // Optimize loop index
            random = hiprand_normal_double(&state);
            results[start + j] = results[start + j - 1] + random * sqrtVal; // Access results using start + j
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

        if (!crossed) {
            atomicAdd(dev_failCross, 1);
        }
    }
}