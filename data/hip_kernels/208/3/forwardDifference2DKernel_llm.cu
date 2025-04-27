#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forwardDifference2DKernel(const int cols, const int rows, const float* data, float* dx, float* dy) {
    // Use shared memory to enhance memory access patterns
    extern __shared__ float shared_data[];

    // Calculate global and shared memory indices
    int global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    int global_idy = blockIdx.y * blockDim.y + threadIdx.y;
    int local_idx = threadIdx.x;
    int local_idy = threadIdx.y;

    if (global_idx < cols && global_idy < rows) {
        // Load data into shared memory
        shared_data[local_idy * blockDim.x + local_idx] = data[global_idy * cols + global_idx];
    }
    __syncthreads(); // Ensure all data are loaded into shared memory

    if (global_idx < cols - 1 && global_idy < rows - 1) {
        // Calculate forward difference if within bounds
        if (local_idx < blockDim.x - 1) {
            dx[global_idy * cols + global_idx] = shared_data[local_idy * blockDim.x + local_idx + 1] - shared_data[local_idy * blockDim.x + local_idx];
        } else {
            dx[global_idy * cols + global_idx] = data[global_idy * cols + global_idx + 1] - data[global_idy * cols + global_idx];
        }

        if (local_idy < blockDim.y - 1) {
            dy[global_idy * cols + global_idx] = shared_data[(local_idy + 1) * blockDim.x + local_idx] - shared_data[local_idy * blockDim.x + local_idx];
        } else {
            dy[global_idy * cols + global_idx] = data[(global_idy + 1) * cols + global_idx] - data[global_idy * cols + global_idx];
        }
    }
}