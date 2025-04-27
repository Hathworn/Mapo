#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel2DYp(double* dataOutput, double* dataInput, double* boundaryTop, double* boundaryBottom, const double* weights, const int numSten, const int numStenTop, const int numStenBottom, const int nxLocal, const int nyLocal, const int BLOCK_Y, const int nx, const int nyTile) {
    // Allocate shared memory
    extern __shared__ double memory[];

    double* arrayLocal = memory;
    double* weigthsLocal = &memory[nxLocal * (BLOCK_Y + numStenTop + numStenBottom)];

    // Move the weights into shared memory
    #pragma unroll
    for (int k = 0; k < numSten; ++k) {
        weigthsLocal[k] = weights[k];
    }

    // True matrix index
    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;
    int globalIdy = blockDim.y * blockIdx.y + threadIdx.y;

    // Local matrix index
    int localIdx = threadIdx.x;
    int localIdy = threadIdx.y + numStenTop;

    // Local sum variable
    double sum = 0.0;

    // Common operations in all cases
    auto processStencil = [&](double *topBoundary, double *bottomBoundary) {
        arrayLocal[localIdy * nxLocal + localIdx] = dataInput[globalIdy * nx + globalIdx];

        if (threadIdx.y < numStenTop) {
            arrayLocal[threadIdx.y * nxLocal + localIdx] = topBoundary[threadIdx.y * nx + globalIdx];
        }

        if (threadIdx.y < numStenBottom) {
            arrayLocal[(localIdy + BLOCK_Y) * nxLocal + localIdx] = bottomBoundary[(localIdy + BLOCK_Y) * nxLocal + localIdx];
        }

        __syncthreads();

        int stenSet = threadIdx.y * nxLocal + localIdx;

        #pragma unroll
        for (int k = 0; k < numSten; ++k) {
            sum += weigthsLocal[k] * arrayLocal[stenSet + k * nxLocal];
        }

        __syncthreads();
        dataOutput[globalIdy * nx + globalIdx] = sum;
    };

    // Set all interior blocks
    if (blockIdx.y != 0 && blockIdx.y != nyTile / BLOCK_Y - 1) {
        processStencil(dataInput - numStenTop * nx, dataInput + BLOCK_Y * nx);
    }

    // Set all top boundary blocks
    if (blockIdx.y == 0) {
        processStencil(boundaryTop, dataInput + BLOCK_Y * nx);
    }

    // Set the bottom boundary blocks
    if (blockIdx.y == nyTile / BLOCK_Y - 1) {
        processStencil(dataInput - numStenTop * nx, boundaryBottom);
    }
}
```
