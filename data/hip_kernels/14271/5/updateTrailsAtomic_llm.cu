#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_THREADS 128

__device__ static inline int toIndex(int i, int j) {
    return i * MAX_CITIES + j;
}

__global__ void updateTrailsAtomic(float *phero, int *paths, float *tourLengths) {
    int antId = blockIdx.x * blockDim.x + threadIdx.x;
    int from, to;

    if (antId < MAX_ANTS) { // Ensure the antId is within bounds
        for (int i = 0; i < MAX_CITIES; i++) {
            from = paths[toIndex(antId, i)];
            if (i < MAX_CITIES - 1) {
                to = paths[toIndex(antId, i+1)];
            } else {
                to = paths[toIndex(antId, 0)];
            }

            if (from < to) {
                int tmp = from;
                from = to;
                to = tmp;
            }
            atomicAdd(&phero[toIndex(from, to)], QVAL / tourLengths[antId]);
        }
    }
}