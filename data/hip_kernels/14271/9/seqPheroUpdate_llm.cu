#include "hip/hip_runtime.h"
#include "includes.h"
/**
*  Project TACO: Parallel ACO algorithm for TSP
*  15-418 Parallel Algorithms - Final Project
*  Ivan Wang, Carl Lin
*/

#define MAX_THREADS 128

__device__ static inline int toIndex(int i, int j) {
    return i * MAX_CITIES + j;
}

__global__ void seqPheroUpdate(float *phero, float *pheroReal, int *paths, float *tourLengths) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int numThreads = blockDim.x * gridDim.x;

    // Use parallel threads to copy pheroReal to phero
    for (int idx = tid; idx < MAX_CITIES * MAX_CITIES; idx += numThreads) {
        phero[idx] = pheroReal[idx];
    }
    __syncthreads();

    if (tid < MAX_CITIES * (MAX_CITIES - 1) / 2) {
        int from = (int)((2 * MAX_CITIES - 1 - sqrtf((2 * MAX_CITIES - 1) * (2 * MAX_CITIES - 1) - 8 * tid)) / 2);
        int to = tid - from * (2 * MAX_CITIES - 1 - from) / 2;
        
        // Evaporate pheromones
        atomicExch(&phero[toIndex(from, to)], phero[toIndex(from, to)] * (1.0 - RHO));
        if (phero[toIndex(from, to)] < 0.0) {
            phero[toIndex(from, to)] = INIT_PHER;
        }
        atomicExch(&phero[toIndex(to, from)], phero[toIndex(from, to)]);
    }
    
    // Add new pheromone to the trails
    for (int ant = tid; ant < MAX_ANTS; ant += numThreads) {
        for (int i = 0; i < MAX_CITIES; i++) {
            int from = paths[toIndex(ant, i)];
            int to = (i < MAX_CITIES - 1) ? paths[toIndex(ant, i+1)] : paths[toIndex(ant, 0)];
            
            float delta = QVAL / tourLengths[ant];
            atomicAdd(&phero[toIndex(from, to)], delta);
            atomicExch(&phero[toIndex(to, from)], phero[toIndex(from, to)]);
        }
    }
}