#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU() {
    // Use thread and block indices to distribute work if needed
    if (threadIdx.x == 0 && blockIdx.x == 0) {  // Optimize by printing from only one thread
        printf("Hello from GPU!\n");
    }
}