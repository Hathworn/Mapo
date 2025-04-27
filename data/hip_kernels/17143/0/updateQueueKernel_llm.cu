#include "hip/hip_runtime.h"
#include "includes.h"

// Edge struct.
typedef struct {
    int* startPoints;
    int* endPoints;
    double* weights;
} Edge;

// Optimized kernel to update the queue
__global__ void updateQueueKernel(int *queueu, int *queueSize, const int *startPoints, const int *endPoints, const int *visitedArray, const int *currentVertex) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Global thread index
    if (index < *queueSize) {  // Ensure within bounds
        if (startPoints[index] == *currentVertex && visitedArray[endPoints[index]] == 0) {
            int oldValue = atomicAdd(queueSize, 1);  // Atomically increment queueSize
            queueu[oldValue] = index;  // Assign thread index that meets condition
        }
    }
}