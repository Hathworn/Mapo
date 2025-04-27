#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void testKernel(void) {
    // Use thread and block indices to reduce redundant calls
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) { // Only one thread needs to execute printf
        printf("Naber Millet!!\n");
    }
}