#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul_kernel(float *C, float *A, float *B) {
    // Declare shared memory for sub-matrices of A and B
    __shared__ float sA[block_size_y][block_size_x];
    __shared__ float sB[block_size_y][block_size_x];

    // Define thread index within the block
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    // Define global index for C matrix
    int x = blockIdx.x * block_size_x + tx;
    int y = blockIdx.y * block_size_y + ty;

    // Initialize sum
    float sum = 0.0;

    // Loop over sub-matrices
    for (int k = 0; k < WIDTH; k += block_size_x) {
        // Load sub-matrices from global to shared memory
        sA[ty][tx] = A[y * WIDTH + k + tx];
        sB[ty][tx] = B[(k + ty) * WIDTH + x];
        __syncthreads(); // Ensure all threads have loaded their elements

        // Compute partial product and accumulate
        for (int kb = 0; kb < block_size_x; kb++) {
            sum += sA[ty][kb] * sB[kb][tx];
        }
        __syncthreads(); // Ensure computation is done before next iteration
    }

    // Write result to global memory
    C[y * WIDTH + x] = sum;
}