#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiplication(int * A,int * B,int * C,int N){
    // Calculate the row and column index of the element
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundaries within matrix dimensions
    if (row < N && col < N) {
        int sum = 0;
        
        // Use shared memory for sub-matrix tiles
        __shared__ int shared_A[32][32];
        __shared__ int shared_B[32][32];
        
        // Iterate through sub-matrix tiles
        for (int t = 0; t < (N + 31) / 32; ++t) {
            // Load data into shared memory
            if (row < N && t * 32 + threadIdx.x < N) {
                shared_A[threadIdx.y][threadIdx.x] = A[row * N + t * 32 + threadIdx.x];
            } else {
                shared_A[threadIdx.y][threadIdx.x] = 0;
            }
            
            if (t * 32 + threadIdx.y < N && col < N) {
                shared_B[threadIdx.y][threadIdx.x] = B[(t * 32 + threadIdx.y) * N + col];
            } else {
                shared_B[threadIdx.y][threadIdx.x] = 0;
            }
            
            __syncthreads();
            
            // Compute the sum for this tile
            for (int i = 0; i < 32; ++i) {
                sum += shared_A[threadIdx.y][i] * shared_B[i][threadIdx.x];
            }
            
            __syncthreads();
        }
        
        // Write the result to the matrix C
        C[row * N + col] = sum;
    }
}