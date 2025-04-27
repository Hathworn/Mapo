#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Improved: Use shared memory for reduced output contention in block
    __shared__ char message[50];
    sprintf(message, "Hello world! I'm a thread in block %d\n", blockIdx.x);
    printf("%s", message);
}