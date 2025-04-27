#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Compute the 2D coordinates of the current thread within the block
    const int x = blockIdx.x * SUBTRACTM_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACTM_H + threadIdx.y;

    // Compute the linear index for the current thread in the 3D grid
    int sz = height * pitch;
    int p = threadIdx.z * sz + y * pitch + x;

    if (x < width && y < height) {
        // Perform subtraction using shared memory optimization
        __shared__ float sharedData[SUBTRACTM_W * SUBTRACTM_H * 2];
        int localIndex = threadIdx.y * SUBTRACTM_W + threadIdx.x;
        
        // Load data into shared memory
        sharedData[localIndex] = d_Data[p];
        sharedData[localIndex + SUBTRACTM_W * SUBTRACTM_H] = d_Data[p + sz];
        __syncthreads();

        // Perform the subtraction using shared memory
        d_Result[p] = sharedData[localIndex] - sharedData[localIndex + SUBTRACTM_W * SUBTRACTM_H];
    }
}