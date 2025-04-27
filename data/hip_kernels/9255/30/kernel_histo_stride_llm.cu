#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_histo_stride(unsigned int *ct, unsigned int *histo) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop unrolling for improved performance
    for (int i = index; i < constant_n_hits * constant_n_test_vertices; i += stride * 4) {
        atomicAdd(&histo[ct[i]], 1);
        if (i + stride < constant_n_hits * constant_n_test_vertices) 
            atomicAdd(&histo[ct[i + stride]], 1);
        if (i + 2 * stride < constant_n_hits * constant_n_test_vertices) 
            atomicAdd(&histo[ct[i + 2 * stride]], 1);
        if (i + 3 * stride < constant_n_hits * constant_n_test_vertices) 
            atomicAdd(&histo[ct[i + 3 * stride]], 1);
    }
}