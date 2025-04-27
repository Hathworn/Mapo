#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomWalk(double *results, int *crossTimes, double T, int N, int numSims, double lowerThreshold, double upperThreshold, int *dev_failCross, double seconds) {
    int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;

    if (crossTimeIndex < numSims) {
        // Use static shared memory to eliminate redundant initialization
        __shared__ hiprandState_t shared_state;
        
        // Initialize the random state in shared memory
        if (threadIdx.x == 0) {
            hiprand_init(blockIdx.x * 1000 + seconds, 0, 0, &shared_state);
        }
        __syncthreads();

        hiprandState_t localState = shared_state; // All threads copy static shared state to local
        double random;
        int start = crossTimeIndex * N;
        bool crossed = false;

        crossTimes[crossTimeIndex] = 0;
        results[start] = 0.0;

        // Loop unrolling for improved performance
        #pragma unroll
        for (int j = start + 1; j < start + N; j++) {
            random = hiprand_normal_double(&localState);
            results[j] = results[j-1] + random * sqrt((double) T / N);
            if (results[j] >= upperThreshold && !crossed) {
                crossTimes[crossTimeIndex] = j - start;
                crossed = true;
            } else if (results[j] <= lowerThreshold && !crossed) {
                crossTimes[crossTimeIndex] = -1 * (j - start);
                crossed = true;
            }
        }

        if (!crossed) {
            atomicAdd(dev_failCross, 1);
        }
    }
}