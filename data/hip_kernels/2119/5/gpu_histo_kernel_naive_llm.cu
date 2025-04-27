#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_histo_kernel_naive(u_char* Source, int *res, unsigned height, unsigned width) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread indices are within image boundaries
    if ((i < height) && (j < width)) {
        // Load value from source image
        u_char val = Source[i * width + j];
        // Perform atomic add to the histogram result
        atomicAdd(&res[val], 1);
    }
}