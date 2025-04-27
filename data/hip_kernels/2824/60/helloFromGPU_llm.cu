#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU() {
    // Calculate global thread index for this kernel
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Print message only for the first thread for efficiency
    if (idx == 0) {
        printf("Hello World from GPU!\n");
    }
}