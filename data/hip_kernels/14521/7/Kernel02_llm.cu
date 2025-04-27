#include "hip/hip_runtime.h"
#include "includes.h"

// Unroll loop for better performance, use shared memory for A and B
__global__ void Kernel02(int N, int M, int P, float *A, float *B, float *C) {

    __shared__ float shared_A[blockDim.y][blockDim.x];
    __shared__ float shared_B[blockDim.x][blockDim.y];

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    float tmp = 0.0;
    for (int k = 0; k < P; k += blockDim.x) {
        // Load block of A and B into shared memory
        shared_A[threadIdx.y][threadIdx.x] = (row < N && (k + threadIdx.x) < P) ? A[row * P + k + threadIdx.x] : 0;
        shared_B[threadIdx.x][threadIdx.y] = ((k + threadIdx.y) < P && col < M) ? B[(k + threadIdx.y) * N + col] : 0;
        __syncthreads();
        
        // Unroll loop over block dimension for performance gain
        #pragma unroll
        for (int j = 0; j < blockDim.x; j++) {
            tmp += shared_A[threadIdx.y][j] * shared_B[j][threadIdx.x];
        }
        __syncthreads();
    }
    
    if (row < N && col < M) {
        C[row * N + col] = tmp;
    }
}