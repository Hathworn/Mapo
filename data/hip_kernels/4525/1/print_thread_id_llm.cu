#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_thread_id()
{
    // Use variables to store the calculated thread ID for better clarity and future optimizations.
    int tid_x = threadIdx.x + blockDim.x * blockIdx.x;
    int tid_y = threadIdx.y + blockDim.y * blockIdx.y;
    int tid_z = threadIdx.z + blockDim.z * blockIdx.z;

    // Print the thread ID in a concise manner.
    printf("Hello Cuda tid[%d, %d, %d]\n", tid_x, tid_y, tid_z);
}