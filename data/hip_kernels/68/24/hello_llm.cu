#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use shared memory to reduce global memory access
    __shared__ char msg[38];

    // Only the first thread initializes the message
    if (threadIdx.x == 0) {
        strncpy(msg, "Hello world! I'm thread ", 23);
    }

    __syncthreads(); // Ensure message is initialized

    // Use per-thread buffer to store the number
    char buffer[12];
    snprintf(buffer, 12, "%d\n", threadIdx.x);

    // Print message using shared msg and local buffer
    printf("%s%s", msg, buffer);
}