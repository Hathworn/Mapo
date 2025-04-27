#include "hip/hip_runtime.h"
#include "includes.h"
__device__ unsigned int Rand(unsigned int randx)
{
    randx = randx*1103515245+12345;
    return randx&2147483647;
}
__global__ void setRandom(float *gpu_array, int N, int maxval)
{
    // Calculate flattened thread index in grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride across entire grid

    // Use stride to allow each thread to process multiple elements
    for (int id = idx; id < N; id += stride) {
        gpu_array[id] = 1.0f / maxval * Rand(id) / float(RAND_MAX);
    }
}