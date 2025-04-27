#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void swap_middle_row(float* data, const int num_threads, const int nx, const int ny, const int xodd, const int yodd, const int offset) {
    // Use shared memory for reduction of global memory access
    __shared__ float shared_data[1024]; // assuming block size is 1024

    const uint x = threadIdx.x;
    const uint y = blockIdx.x;

    const uint c = x + y * num_threads + offset;
    int r = ny / 2;
    int idx1 = r * nx + c;
    int idx2 = r * nx + c + nx / 2 + xodd;

    // Load global data to shared memory
    shared_data[x] = data[idx1];
    __syncthreads();

    // Perform swap using shared memory
    float tmp = shared_data[x];
    data[idx1] = data[idx2];
    data[idx2] = tmp;
}