#include "hip/hip_runtime.h"
#include "includes.h"
#define GLM_FORCE_CUDA

#ifndef imax
#define imax( a, b ) ( ((a) > (b)) ? (a) : (b) )
#endif

#ifndef imin
#define imin( a, b ) ( ((a) < (b)) ? (a) : (b) )
#endif

#define checkCUDAErrorWithLine(msg) checkCUDAError(msg, __LINE__)

__global__ void kernIdentifyCellStartEnd(int N, int *particleGridIndices, int *gridCellStartIndices, int *gridCellEndIndices) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Initialize the start and end indices at the first cell
    if (index == 0) {
        gridCellStartIndices[particleGridIndices[0]] = 0;
    }
    if (index == N - 1) {
        gridCellEndIndices[particleGridIndices[index]] = N - 1;
    }

    // Check boundaries between particles to identify cell start and end points
    if (index > 0) {
        int currentCell = particleGridIndices[index];
        int previousCell = particleGridIndices[index - 1];

        if (currentCell != previousCell) {
            gridCellStartIndices[currentCell] = index;  // First particle of a new cell
            gridCellEndIndices[previousCell] = index - 1;  // Last particle of the previous cell
        }
    }
}