#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void swap_top_left_bot_right(float* data, const int num_threads, const int nx, const int ny, const int xodd, const int yodd, const int offset) {
    // Efficiently calculate global index
    const uint gpu_idx = threadIdx.x + blockIdx.x * num_threads + offset;
    
    if (gpu_idx < (nx/2) * (ny/2) + yodd) {  // Bounds check for valid indices
        const uint c = gpu_idx % (nx/2);
        const uint r = gpu_idx / (nx/2) + ny / 2 + yodd;

        const uint idx1 = r * nx + c;
        const uint idx2 = (r - ny / 2 - yodd) * nx + c + nx / 2 + xodd;

        // Swap values using fewer memory accesses
        float tmp = data[idx1];
        data[idx1] = data[idx2];
        data[idx2] = tmp;
    }
}