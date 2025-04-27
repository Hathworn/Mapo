```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_histo_per_vertex(unsigned int *ct, unsigned int *histo) {
    // Calculate global thread ID
    unsigned int tid_x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int tid_y = blockIdx.y * blockDim.y + threadIdx.y;

    if (tid_x >= constant_n_test_vertices) return;

    unsigned int vertex_offset = tid_x * constant_n_hits;
    unsigned int stride = blockDim.y * gridDim.y;
    unsigned int ihit = vertex_offset + tid_y;

    // Loop over hits with strided access
    while (ihit < vertex_offset + constant_n_hits) {
        unsigned int bin = ct[ihit];
        atomicAdd(&histo[bin], 1);
        ihit += stride;
    }

    // Ensure all threads reach this point
    __syncthreads();
}
```
