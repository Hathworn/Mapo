#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_simple_kernel(float* a, float* b, float* c, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= N) // Correct boundary check.
        return;

    // Utilize a faster memory access pattern by reducing unnecessary I/O.
    float val_a = a[idx];
    float val_b = b[idx];
    c[idx] = val_a * val_b;

    #define PRINT_IDS
    #if !defined( __CUDA_ARCH__) || (__CUDA_ARCH__ >= 200 ) &&  defined(PRINT_IDS)
    // Print thread and block IDs for debugging purposes.
    printf("thread: %3d - block: %3d - threadIdx: %3d, warp: %3d\n", idx, blockIdx.x, threadIdx.x, threadIdx.x / warpSize);
    #endif
}