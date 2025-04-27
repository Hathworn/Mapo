#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void printThreadIDs() {
    // Use a single printf to reduce overhead
    printf("\n threadIdx.x : %d, threadIdx.y : %d", threadIdx.x, threadIdx.y);
}