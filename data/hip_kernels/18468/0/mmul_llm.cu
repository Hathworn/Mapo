#include "hip/hip_runtime.h"
#include "includes.h"

// error checking macro
__global__ void mmul(const float *A, const float *B, float *C, int ds) {
    // Thread coordinates
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    int idy = threadIdx.y + blockDim.y * blockIdx.y;
    
    // Boundary check
    if (idx < ds && idy < ds) {
        // Initialize accumulation
        float temp = 0.0f;
        
        // Coalesced access for A and B
        for (int i = 0; i < ds; i++) {
            temp += A[idy * ds + i] * B[i * ds + idx];
        }
        
        // Write result back to C
        C[idy * ds + idx] = temp;
    }
}