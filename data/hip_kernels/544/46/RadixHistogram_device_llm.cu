#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RadixHistogram_device(int *dptrHistogram, const int *in, size_t N, int shift, int mask)
{
    extern __shared__ int sharedHistogram[];
    
    for (int i = threadIdx.x; i < (1 << mask); i += blockDim.x) {
        sharedHistogram[i] = 0; // Initialize shared memory
    }
    __syncthreads();

    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += blockDim.x * gridDim.x) {
        int index = (in[i] & mask) >> shift;
        atomicAdd(&sharedHistogram[index], 1); // Use shared memory
    }
    __syncthreads();

    for (int i = threadIdx.x; i < (1 << mask); i += blockDim.x) {
        if (sharedHistogram[i] > 0) {
            atomicAdd(dptrHistogram + i, sharedHistogram[i]); // Write to global memory
        }
    }
}