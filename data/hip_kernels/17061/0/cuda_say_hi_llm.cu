#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_say_hi() {
    // Minimize thread divergence by ensuring only one thread executes the print statement
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hi, CUDA!\n");
    }
}