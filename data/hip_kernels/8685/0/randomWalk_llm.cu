#include "hip/hip_runtime.h"
#include "includes.h"

int *crossTimes = nullptr;

struct DataStruct {
    int deviceID;
    int sims;
    double *resultArray;
    int *crossArray;
    int N;
    double T;
    double drift;
    double lowerThreshold;
    double upperThreshold;
};

__global__ void randomWalk(double *results, int *crossTimes, int T, int N, double drift, int numSims, double lowerThreshold, double upperThreshold, double deviceID) {
    int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;

    if (crossTimeIndex < numSims) {
        // Initialize random number generator with unique seed
        hiprandState_t state;
        hiprand_init(blockIdx.x * (1000 * deviceID) + threadIdx.x + clock64(), 0, 0, &state);
        double random;
        
        int start = crossTimeIndex * N;  // Simplified start index calculation

        crossTimes[crossTimeIndex] = 0;
        results[start] = 0.0;
        bool crossed = false;

        // Calculate constants outside the loop
        double sqrt_T_div_N = sqrt((double)T / N);
        double drift_T_div_N = drift * ((double)T / N);

        for (int j = 1; j < N; j++) {
            random = hiprand_normal_double(&state);
            results[start + j] = results[start + j - 1] + drift_T_div_N + random * sqrt_T_div_N;

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