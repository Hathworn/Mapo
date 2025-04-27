#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello_world(){
    // Each thread prints a message, but only one is needed here.
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello World\n");
    }
}