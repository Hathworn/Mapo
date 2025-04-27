```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define gpu_assert(rv) gpu_assert_h((rv), __FILE__, __LINE__)

__global__ void kernel()
{
    // Use shared memory to optimize printing in the kernel
    __shared__ char buffer[1024];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < 1024) // Assuming practical use where not all threads need message
    {
        sprintf(buffer, "Hello Kernel %d\n", tid);
        // Using printf from shared memory to ensure reduced latency in GPU calls
        printf("%s", buffer);
    }
}