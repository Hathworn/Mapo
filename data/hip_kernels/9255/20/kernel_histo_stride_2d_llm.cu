#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_histo_stride_2d(unsigned int *ct, unsigned int *histo) {

    // Get unique id for each thread in each block
    unsigned int tid_x = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int tid_y = threadIdx.y + blockDim.y * blockIdx.y;
    
    unsigned int size = blockDim.x * gridDim.x;
    unsigned int max = constant_n_hits * constant_n_test_vertices;
    
    // Map the two 2D indices to a single linear, 1D index
    int tid = tid_y * size + tid_x;
    
    // Calculate stride using both dimensions' sizes
    unsigned int stride = blockDim.y * gridDim.y * size;
    
    // Iterate over data with efficient stride loop
    while (tid < max) {
        atomicAdd(&histo[ct[tid]], 1);
        tid += stride;
    }
}