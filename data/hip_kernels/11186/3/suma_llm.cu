#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c) {
    // Use thread ID to ensure each thread performs distinct operations (if needed, considering only 1 thread here)
    int tid = threadIdx.x;
    if (tid == 0) { // Limit execution to the first thread
        *c = a + b;
    }
}