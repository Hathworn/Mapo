#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Frontier_copy( unsigned int *frontier, unsigned int *frontier2, unsigned int *frontier_length)
{
    // Calculate the global thread id
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform copy operation if within bounds
    if (tid < *frontier_length) {
        frontier[tid] = frontier2[tid];
    }

    // Use only the first thread in the grid to initialize global variables
    if (tid == 0) {
        g_mutex = 0;
        g_mutex2 = 0;
        *g_q_offsets = 0;
        *g_q_size = 0;
    }
}