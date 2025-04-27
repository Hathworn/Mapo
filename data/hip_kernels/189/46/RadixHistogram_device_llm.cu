#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RadixHistogram_device(int *dptrHistogram, const int *in, size_t N, int shift, int mask) {
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a loop stride pattern for better coalescing and to ensure all elements are processed
    for (int i = idx; i < N; i += blockDim.x * gridDim.x) {
        int index = (in[i] & mask) >> shift;
        atomicAdd(dptrHistogram + index, 1); // Atomically add to histogram
    }
}