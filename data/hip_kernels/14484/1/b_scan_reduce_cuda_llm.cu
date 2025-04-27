```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void b_scan_reduce_cuda(int *values, int *cumulative, size_t bins)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    int tid = threadIdx.x;

    int nb_here = (bins - (blockDim.x * blockIdx.x) < blockDim.x) ? bins - (blockDim.x * blockIdx.x) : blockDim.x;

    __shared__ int shared_vals[1024]; // Assuming max blockDim.x
    if (tid < nb_here)
        shared_vals[tid] = values[id];
    __syncthreads();

    int next_th = 2;
    for (int threshold = 1; threshold < blockDim.x / 2; threshold <<= 1)
    {
        // Optimization: Minimize conditional checks
        if (tid < nb_here && tid - threshold >= 0 && ((nb_here - 1) - tid) % next_th == 0)
        {
            shared_vals[tid] += shared_vals[tid - threshold];
        }
        next_th <<= 1;
        __syncthreads();
    }

    if (tid == nb_here - 1)
        shared_vals[tid] = 0;
    next_th = nb_here >> 1;
    int tmp;
    for (int threshold = nb_here; threshold > 1; threshold >>= 1)
    {
        if (tid < nb_here && tid - next_th >= 0 && (nb_here - 1 - tid) % threshold == 0) {
            tmp = shared_vals[tid];
            shared_vals[tid] += shared_vals[tid - next_th];
            shared_vals[tid - next_th] = tmp;
        }
        next_th >>= 1;
        __syncthreads();
    }

    if (tid < nb_here)
        cumulative[id] = shared_vals[tid];
}