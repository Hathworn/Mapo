#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

// Edge struct.
typedef struct {
    int* startPoints;
    int* endPoints;
    double* weights;
} Edge;

// Optimized kernel using parallelization to improve performance
__global__ void processQueueKernel(int *parentArray, double *resultWeightArray, const int* queue, const int *startPoints, const int *endPoints, const double *weightArray, int queueSize) {
    int threadIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread does not exceed queue size
    if (threadIndex < queueSize) {
        int elementIndex = queue[threadIndex];
        int startNode = startPoints[elementIndex];
        int endNode = endPoints[elementIndex];
        double edgeWeight = weightArray[elementIndex];
        double nodeWeight = resultWeightArray[startNode];
        
        // Atomic operation for safe concurrent updates
        atomicMin(&resultWeightArray[endNode], nodeWeight + edgeWeight);
        if (nodeWeight + edgeWeight == resultWeightArray[endNode]) {
            parentArray[endNode] = startNode;
        }
    }
}