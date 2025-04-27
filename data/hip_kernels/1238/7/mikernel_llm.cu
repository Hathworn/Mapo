#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mikernel(void) {
    // Use blockIdx and threadIdx for conditional execution to reduce redundant calls
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Llamada a kernel de gpu\n");
    }
}