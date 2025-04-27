#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_world() {
    // Use thread synchronization for better performance
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello CUDA world \n");
    }
}