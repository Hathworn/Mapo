#include "hip/hip_runtime.h"
#include "includes.h"
/**
*  Project TACO: Parallel ACO algorithm for TSP
*  15-418 Parallel Algorithms - Final Project
*  Ivan Wang, Carl Lin
*/

#define MAX_THREADS 128

__global__ void copyBestPath(int i, int *bestPathResult, int *pathResults) {
    // Use optimized memory access by utilizing offset computation
    int offset = i * MAX_ANTS;
    for (int j = threadIdx.x; j < MAX_CITIES; j += blockDim.x) {
        bestPathResult[j] = pathResults[offset + j];
    }
}