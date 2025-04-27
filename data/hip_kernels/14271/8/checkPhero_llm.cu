#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_THREADS 128

__device__ static inline int toIndex(int i, int j) {
    return i * MAX_CITIES + j;
}

__global__ void checkPhero(float *pheroSeq, float *phero) {
    // Calculate unique indices for each thread to parallelize comparisons
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int i = idx / MAX_CITIES;
    int j = idx % MAX_CITIES;
    
    // Ensure person-label uniqueness and prevent self-comparison
    if (i < MAX_CITIES && j < MAX_CITIES && i != j) {
        int globalIdx = toIndex(i, j);
        if (fabsf(pheroSeq[globalIdx] - phero[globalIdx]) > 0.001) {
            printf("PHERO IS BROKEN at (%d, %d); expected: %1.15f, actual: %1.15f\n", i, j, pheroSeq[globalIdx], phero[globalIdx]);
        }
    }
}