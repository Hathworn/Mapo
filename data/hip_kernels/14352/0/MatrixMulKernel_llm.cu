#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel(int * _matrixA, int * _matrixB, int * _result, int _width)
{
    // Cache elements in shared memory for reuse
    __shared__ int sharedA[32][32];
    __shared__ int sharedB[32][32];

    // 2D thread ID
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bx = blockIdx.x * 32;
    int by = blockIdx.y * 32;

    int value = 0;

    // Loop over tiles
    for (int m = 0; m < _width; m += 32) {
        // Load elements into shared memory
        sharedA[ty][tx] = _matrixA[(by + ty) * _width + (m + tx)];
        sharedB[ty][tx] = _matrixB[(m + ty) * _width + (bx + tx)];

        __syncthreads(); // Synchronize to make sure the data is available

        // Perform partial matrix multiplication
        for (int k = 0; k < 32; k++) {
            value += sharedA[ty][k] * sharedB[k][tx];
        }

        __syncthreads(); // Synchronize before loading the next tile
    }

    // Write result to global memory
    _result[(by + ty) * _width + (bx + tx)] = value;
}