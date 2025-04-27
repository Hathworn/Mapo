#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _logploss(int nrows, int ncols, float *y, float *dy) {
    // Calculate unique index for each thread
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Efficient stride to cover elements by threads
    int totalThreads = blockDim.x * gridDim.x;
    
    for (int col = tid; col < ncols; col += totalThreads) {
        int i0 = col * nrows;
        int i1 = i0 + nrows;
        
        // Process each row for current column
        for (int i = i0; i < i1; i++) {
            dy[i] = (expf(y[i]) - dy[i]) / ncols;  // Use expf for better performance with float
        }
    }
}