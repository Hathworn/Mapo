#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void loop()
{
    // Use local variable to store thread ID to avoid repeated access to threadIdx.x
    int thread_id = threadIdx.x;
    printf("This is iteration number %d\n", thread_id);
}