#include "hip/hip_runtime.h"
#include "includes.h"
/**
*  Project TACO: Parallel ACO algorithm for TSP
*  15-418 Parallel Algorithms - Final Project
*  Ivan Wang, Carl Lin
*/

#define MAX_THREADS 128

__device__ static inline int calculateTo(int i) {
    // Find least triangle number less than i
    int row = (int)(-1 + (sqrt((float)(1 + 8 * i)))) >> 1;
    int tnum = (row * (row + 1)) >> 1;
    int remain = i - tnum;
    return row - remain;
}

__device__ static inline int calculateFrom(int i) {
    // Find least triangle number less than i
    int row = (int)(-1 + (sqrt((float)(1 + 8 * i)))) >> 1;
    int tnum = (row * (row + 1)) >> 1;
    int remain = i - tnum;
    return MAX_CITIES - 1 - remain;
}

__device__ static inline int toIndex(int i, int j) {
    return i * MAX_CITIES + j;
}

__global__ void updateTrails(float *phero, int *paths, float *tourLengths) {
    extern __shared__ float localPaths[]; // Use shared memory to cache paths

    int numPhero = (NUM_EDGES + (blockDim.x * (MAX_ANTS * 2) - 1)) /
                   (blockDim.x * (MAX_ANTS * 2));
    int blockStartPhero = numPhero * blockDim.x * blockIdx.x;
    int from, to;
    
    if (threadIdx.x == 0) {
        // Load paths into shared memory for the current block
        for (int i = 0; i < MAX_ANTS; i++) {
            memcpy(&localPaths[i * MAX_CITIES], &paths[i * MAX_CITIES], MAX_CITIES * sizeof(float));
        }
    }
    __syncthreads();

    int cur_phero;
    for (int i = 0; i < MAX_ANTS; i++) {
        for (int j = 0; j < numPhero; j++) {
            cur_phero = blockStartPhero + j + numPhero * threadIdx.x;

            if (cur_phero >= NUM_EDGES) {
                break;
            }

            from = calculateFrom(cur_phero);
            to = calculateTo(cur_phero);

            bool touched = false;
            int checkTo;
            int checkFrom;
            for (int k = 0; k < MAX_CITIES; k++) {
                checkFrom = localPaths[toIndex(i, k)];
                if (k < MAX_CITIES - 1) {
                    checkTo = localPaths[toIndex(i, k + 1)];
                } else {
                    checkTo = localPaths[toIndex(i, 0)];
                }

                if ((checkFrom == from && checkTo == to) ||
                    (checkFrom == to && checkTo == from)) {
                    touched = true;
                    break;
                }
            }

            if (touched) {
                int idx = toIndex(from, to);
                atomicAdd(&phero[idx], (QVAL / tourLengths[i])); // Use atomic operation for thread safety
                phero[toIndex(to, from)] = phero[idx];
            }
        }
    }
}