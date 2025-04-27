#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCKSIZE 4
#define CELLS_PER_THREAD 4     // Stride length

__global__ void ShortestPath1(float *Arr1, float *Arr2, int N) {
    // Arr1 input array, Holds of (u, v)
    // Arr2 output array
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int index = row * N + col;

    if ((row < N) && (col < N)) {
        Arr2[index] = Arr1[index];
        
        // Use shared memory to optimize global memory access
        __shared__ float sharedArr1[BLOCKSIZE][BLOCKSIZE];
        
        for (int k = 0; k < N; ++k) {
            sharedArr1[threadIdx.y][threadIdx.x] = Arr1[row * N + k];
            __syncthreads();
            
            for (int i = 0; i < BLOCKSIZE; ++i) {
                if (Arr2[index] > sharedArr1[threadIdx.y][i] + Arr1[i * N + col]) {
                    Arr2[index] = sharedArr1[threadIdx.y][i] + Arr1[i * N + col];
                }
            }
            __syncthreads();
        }
    }
}