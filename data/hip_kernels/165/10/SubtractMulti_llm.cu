```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Use shared memory for coalesced access and reduced global memory access
    __shared__ float shared_Data[SUBTRACTM_H][SUBTRACTM_W];

    const int x = blockIdx.x * SUBTRACTM_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACTM_H + threadIdx.y;
    int sz = height * pitch;
    int p = threadIdx.z * sz + y * pitch + x;

    if (x < width && y < height) {
        // Load data into shared memory
        shared_Data[threadIdx.y][threadIdx.x] = d_Data[p];
        __syncthreads();

        // Perform computation using data in shared memory
        float value = shared_Data[threadIdx.y][threadIdx.x] - d_Data[p + sz];

        // Write the result back to global memory
        d_Result[p] = value;
    }
}