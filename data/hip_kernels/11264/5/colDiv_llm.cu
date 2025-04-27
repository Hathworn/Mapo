#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colDiv(float* a, float* b, float* c, int M, int N) {
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Convert 2D grid location into a column index
    int j = blockIdx.y; 
    
    // Ensure the index is within bounds
    if (i < M && j < N) {
        // Calculate linear index for 2D array
        int ind = i + j * M;
        
        // Perform division operation
        c[ind] = a[ind] / b[i];
    }
}