#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmulKernel(float* mat1, float* mat2, float* matP, int dim) {
    // Use shared memory for better performance
    extern __shared__ float shared[];
    float* shared_mat1 = shared;
    float* shared_mat2 = shared + blockDim.y * dim;
    
    int thread_x = blockIdx.x * blockDim.x + threadIdx.x;
    int thread_y = blockIdx.y * blockDim.y + threadIdx.y;

    float P_value = 0.0f;
    
    for (int tile = 0; tile < dim; tile += blockDim.x) {
        // Load tiles into shared memory
        shared_mat1[thread_y * dim + threadIdx.x] = mat1[thread_y * dim + tile + threadIdx.x];
        shared_mat2[threadIdx.y * dim + thread_x] = mat2[(tile + threadIdx.y) * dim + thread_x];
        
        __syncthreads(); // Synchronize to ensure tiles are loaded
        
        // Perform partial dot product using tiles
        for (int i = 0; i < blockDim.x; ++i) {
            P_value += shared_mat1[thread_y * dim + i] * shared_mat2[i * dim + thread_x];
        }
        
        __syncthreads(); // Synchronize before loading next tiles
    }

    if (thread_x < dim && thread_y < dim) {
        matP[thread_y * dim + thread_x] = P_value;
    }
}