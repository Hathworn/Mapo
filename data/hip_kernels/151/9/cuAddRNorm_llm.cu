#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuAddRNorm(float *dist, int width, int pitch, int height, float *vec) {
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    // Load shared data cooperatively
    __shared__ float shared_vec[16];
    if (threadIdx.x == 0 && yIndex < height) {
        shared_vec[threadIdx.y] = vec[yIndex];
    }
    __syncthreads();

    // Perform computation if indices are within bounds
    if (xIndex < width && yIndex < height) {
        dist[yIndex * pitch + xIndex] += shared_vec[threadIdx.y];
    }
}