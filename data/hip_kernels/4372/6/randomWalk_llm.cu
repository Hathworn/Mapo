#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void randomWalk(double *results, int *crossTimes, double T, int N, int numSims, double lowerThreshold, double upperThreshold, int *dev_failCross, double seconds) {
    int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (crossTimeIndex >= numSims) return;  // Early exit if index is out of bounds
    
    hiprandState_t state;
    hiprand_init(blockIdx.x * 1000 + threadIdx.x + seconds, 0, 0, &state);
    
    double random;
    int start = crossTimeIndex * N;  // Use crossTimeIndex instead of recalculating
    bool crossed = false;
    
    crossTimes[crossTimeIndex] = 0;  // Initialize crossTimes array
    results[start] = 0.0;  // Initialize the first result to zero
    
    for (int j = 1; j < N; j++) {  // Simplified loop from 1 to N
        random = hiprand_normal_double(&state);
        results[start + j] = results[start + j - 1] + random * sqrt(T / N);  // Update result directly
        
        if (!crossed) {  // Check crossing condition only if not already crossed
            if (results[start + j] >= upperThreshold) {
                crossTimes[crossTimeIndex] = j;
                crossed = true;
            } else if (results[start + j] <= lowerThreshold) {
                crossTimes[crossTimeIndex] = -j;
                crossed = true;
            }
        }
    }
    
    if (!crossed) atomicAdd(dev_failCross, 1);  // Atomic update for failed crosses
}