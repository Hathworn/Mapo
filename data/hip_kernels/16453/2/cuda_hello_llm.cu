#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_hello() {
    // Use shared memory buffer for storing formatted output to reduce latency
    __shared__ char buffer[256];
    
    // Use thread 0 of each block to print the output
    if (threadIdx.x == 0 && threadIdx.y == 0 && threadIdx.z == 0) {
        snprintf(buffer, 256, "Hello from GPU blockIdx.x=%d blockIdx.y=%d blockIdx.z=%d threadIdx.x=%d threadIdx.y=%d threadIdx.z=%d\n",
                 blockIdx.x, blockIdx.y, blockIdx.z, threadIdx.x, threadIdx.y, threadIdx.z);

        printf("%s", buffer);
    }
}