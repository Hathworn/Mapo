#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getCrossingTimes(double *results, int *crossTimes, int N, int numSims, int lowerThreshold, int upperThreshold) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Pre-computed stride for all threads

    // Unrolling the loop for better performance
    while (tid < N * numSims) {
        int simIndex = tid / N;
        if (crossTimes[simIndex] == 0) {
            double result = results[tid];
            if (result <= lowerThreshold || result >= upperThreshold) {
                crossTimes[simIndex] = tid % N;
            }
        }
        tid += stride; // Use pre-computed stride instead of re-computing
    }
}