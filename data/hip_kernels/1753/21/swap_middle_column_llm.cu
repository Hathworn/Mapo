#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void swap_middle_column(float* data, const int num_threads, const int nx, const int ny, const int xodd, const int yodd, const int offset) {
    const uint x = threadIdx.x;
    const uint y = blockIdx.x;

    const uint r = x + y * num_threads + offset;
    const int c = nx / 2;
    if (r < ny / 2) { // Ensure r is within bounds
        int idx1 = r * nx + c;
        int idx2 = (r + ny / 2 + yodd) * nx + c;
        float tmp = data[idx1];
        data[idx1] = data[idx2];
        data[idx2] = tmp;
    }
}