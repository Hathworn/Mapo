#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findAllMins(int* adjMat, int* outVec, size_t gSize) {
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    if(globalThreadId < gSize) {
        int ind = globalThreadId * gSize;
        int min = INT_MAX;

        // Use shared memory to reduce global memory accesses
        __shared__ int sharedAdjMat[1024]; // Assuming blockDim.x <= 1024

        for(int i = threadIdx.x; i < gSize; i += blockDim.x) {
            sharedAdjMat[i] = adjMat[ind + i];
        }
        __syncthreads();

        // Each thread finds the local minimum
        for(int i = 0; i < gSize; i++) {
            if(sharedAdjMat[i] < min && sharedAdjMat[i] > 0) {
                min = sharedAdjMat[i];
            }
        }

        outVec[globalThreadId] = min;
    }
}