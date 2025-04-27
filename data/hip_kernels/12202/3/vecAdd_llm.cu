#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized vecAdd kernel function
__global__ void vecAdd(unsigned int *A_d, unsigned int *B_d, unsigned int *C_d, int WORK_SIZE) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread within bounds
    if (id < WORK_SIZE) {
        C_d[id] = A_d[id] + B_d[id];
    }
}