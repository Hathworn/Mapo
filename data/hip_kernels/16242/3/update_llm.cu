#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update(int* U, int* F, int* d, int* del, size_t gSize) {
    // Calculate the global thread ID
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread is within bounds
    if (globalThreadId < gSize) {
        int u_val = U[globalThreadId];
        int d_val = d[globalThreadId];
        
        // Use a single conditional assignment with ternary operator
        F[globalThreadId] = (u_val && d_val < del[0]) ? 1 : 0;

        // Update U only when condition is met
        if (F[globalThreadId]) {
            U[globalThreadId] = 0;
        }
    }
}