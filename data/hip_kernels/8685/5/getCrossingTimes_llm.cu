#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getCrossingTimes(double *results, int *crossTimes, int N, int numSims, int lowerThreshold, int upperThreshold) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize the loop increment for better memory access pattern
    int totalThreads = blockDim.x * gridDim.x;

    while (tid < N * numSims) {
        int simIndex = tid / N;
        if (crossTimes[simIndex] == 0) {
            double resultVal = results[tid]; // Avoid redundant memory accesses
            if (resultVal <= lowerThreshold || resultVal >= upperThreshold) {
                crossTimes[simIndex] = tid % N;
            }
        }
        tid += totalThreads; // Use totalThreads for better workload distribution
    }
}