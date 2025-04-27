#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU(void)
{
    // Optimize by reducing the number of threads that print
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello World from GPU!\n");
    }
}