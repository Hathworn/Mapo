#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void degreeCalcOptimized(int *vertexArray, int *degreeCount, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {
        // Efficiently calculate degree using pre-fetched vertex points
        int start = vertexArray[i];
        int stop = vertexArray[i + 1];
        degreeCount[i] = stop - start;
    }
}