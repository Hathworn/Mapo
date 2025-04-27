#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void printVal(void) {
    // Use block and thread indices for better control parallel execution, even if not used currently
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Print a unique identifier for each thread to ensure correct mapping in future enhancements
    printf("Hola from thread %d!!\n", idx);
}