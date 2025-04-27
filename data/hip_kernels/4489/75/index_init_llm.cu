#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void index_init(int* out_data, int h, int w) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride to use in loop for coalesced memory access
    for (int i = idx; i < h * w; i += stride) { // Use calculated stride in loop
        out_data[i] = i % w; // Directly calculate and assign w_id
    }
}