#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Optimize by using registers and removing modulo operations
    if (idx < N) {
        int next_idx1 = (idx + 1);
        int next_idx2 = (idx + 2);
        
        // Load data into registers to reduce global memory access
        float a0 = a[idx];
        float a1 = a[next_idx1 < N ? next_idx1 : next_idx1 - 256];
        float a2 = a[next_idx2 < N ? next_idx2 : next_idx2 - 256];
        
        float b0 = b[idx];
        float b1 = b[next_idx1 < N ? next_idx1 : next_idx1 - 256];
        float b2 = b[next_idx2 < N ? next_idx2 : next_idx2 - 256];
        
        // Calculate averages
        float as = (a0 + a1 + a2) / 3.0f;
        float bs = (b0 + b1 + b2) / 3.0f;
        
        // Write result back to global memory
        c[idx] = (as + bs) / 2;
    }
}