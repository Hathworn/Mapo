#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relax(int* U, int* F, int* d, size_t gSize, int* adjMat) {
    // Calculate global thread ID
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread ID is valid and the node is fixed
    if (globalThreadId < gSize && F[globalThreadId]) {
        for (int i = 0; i < gSize; i++) {
            // Check adjacency and ensure not self-loop, node should be unrelaxed
            if (adjMat[globalThreadId * gSize + i] && i != globalThreadId && U[i]) {
                // Use atomicMin to minimize the distance
                atomicMin(&d[i], d[globalThreadId] + adjMat[globalThreadId * gSize + i]);
            }
        }
    }
}