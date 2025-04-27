#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ShortestPath1(float *Arr1, float *Arr2, int N, int rows, int rank) {
    // Calculate column and row indices
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Compute global offset
    int offset = rows * rank;
    
    // Calculate the index for the current thread
    int index = row * N + col;
    
    // Initialize Arr2 with Arr1 values
    Arr2[index] = Arr1[index];
    
    // Iterate over rows assigned to this process
    for (int k = rank * rows; k < (rank + 1) * rows; ++k) {
        int index_ik = row * N + k;
        int index_kj = (k - offset) * N + col; // Correct offset usage
        
        // Perform path comparison and update
        if (Arr1[index] > (Arr1[index_ik] + Arr1[index_kj])) {
            Arr2[index] = Arr1[index_ik] + Arr1[index_kj];
        }
    }
    // Synchronize threads in the same block after each iteration
    __syncthreads(); // Synchronize threads in block
}