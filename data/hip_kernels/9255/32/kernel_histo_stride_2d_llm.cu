#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_histo_stride_2d(unsigned int *ct, unsigned int *histo) {
    // Calculate unique thread ID for 2D grid
    unsigned int tid_x = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int tid_y = threadIdx.y + blockDim.y * blockIdx.y;
    unsigned int size = blockDim.x * gridDim.x;
    unsigned int max = constant_n_hits * constant_n_test_vertices;

    // Flatten 2D indices to 1D index
    int tid = tid_y * size + tid_x;
    unsigned int stride = blockDim.y * gridDim.y * size;

    // Loop over data with thread-level stride
    while (tid < max) {
        atomicAdd(&histo[ct[tid]], 1);  // Perform atomic addition
        tid += stride;  // Advance thread index by stride
    }
}