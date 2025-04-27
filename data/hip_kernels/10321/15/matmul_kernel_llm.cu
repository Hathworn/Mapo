#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matmul_kernel(float *C, float *A, float *B) {
    __shared__ float sA[block_size_y][block_size_x];
    __shared__ float sB[block_size_y][block_size_x];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int x = blockIdx.x * block_size_x + tx;
    int y = blockIdx.y * block_size_y + ty;

    float sum = 0.0;
    int k;

    // Load data into shared memory in a coalesced manner
    for (k = 0; k < WIDTH; k += block_size_x) {
        sA[ty][tx] = A[y * WIDTH + k + tx];
        sB[ty][tx] = B[(k + ty) * WIDTH + x];
        __syncthreads();

        // Unrolling loop for better performance
        #pragma unroll
        for (int kb = 0; kb < block_size_x; kb++) {
            sum += sA[ty][kb] * sB[kb][tx];
        }
        __syncthreads();
    }

    C[y * WIDTH + x] = sum;
}