#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask4D(float* in, int* mask, int xstrides0, int xstrides1, int xstrides2, int xstrides3, int scalarCount) {
    // Calculate the thread's unique identifier
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
  
    // Loop over data with thread-stride
    for (; tid < scalarCount; tid += stride) {
        int linearIndex = tid;

        // Unroll index calculation to reduce repetitive division
        int xindex0 = linearIndex / xstrides0;
        linearIndex -= xstrides0 * xindex0;
        int xindex1 = __fdiv_rd(linearIndex, xstrides1);  // Use fast integer division
        linearIndex -= xstrides1 * xindex1;
        int xindex2 = __fdiv_rd(linearIndex, xstrides2);
        int xindex3 = linearIndex - xstrides2 * xindex2;

        // Apply mask condition
        if (xindex3 >= mask[xindex0]) in[tid] = 0;
    }
}