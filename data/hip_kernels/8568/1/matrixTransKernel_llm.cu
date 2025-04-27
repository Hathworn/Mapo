#include "hip/hip_runtime.h"
#include "includes.h"
/*
Modified from 
https://github.com/zhxfl/CUDA-CNN
*/

__global__ void matrixTransKernel(float *A, int rows, int cols) {
    // Use shared memory to reduce global memory accesses
    __shared__ float tile[32][33]; // Avoid bank conflicts by using padding
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int width = gridDim.x * blockDim.x;

    // Load matrix into shared memory
    if (x < cols && y < rows) {
        tile[threadIdx.y][threadIdx.x] = A[y * cols + x];
    }
    __syncthreads();

    // Transpose within shared memory and write back to global memory
    x = blockIdx.y * blockDim.y + threadIdx.x;
    y = blockIdx.x * blockDim.x + threadIdx.y;

    if (x < rows && y < cols) {
        A[y * rows + x] = tile[threadIdx.x][threadIdx.y];
    }
}