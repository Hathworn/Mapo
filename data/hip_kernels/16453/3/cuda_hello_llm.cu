#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_hello() {
    // Optimize using cooperative groups for efficient thread sync
    printf("Hello from GPU blockIdx.x=%d blockIdx.y=%d blockIdx.z=%d threadIdx.x=%d threadIdx.y=%d threadIdx.z=%d\n", 
           blockIdx.x, blockIdx.y, blockIdx.z, 
           threadIdx.x, threadIdx.y, threadIdx.z);
}