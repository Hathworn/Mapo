#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobelFilterShared2(unsigned char *data, unsigned char *result, int width, int height) {
    // Data cache: threadIdx.x , threadIdx.y
    int ty = threadIdx.y;
    int tx = threadIdx.x;

    // Shared memory represented here by 1D array
    const int n = Mask_size / 2;
    __shared__ int s_data[BLOCKSIZE * (BLOCKSIZE + Mask_size * 2)];

    // Global memory address of the current thread in the whole grid
    const int pos = tx + blockIdx.x * blockDim.x + ty * width + blockIdx.y * blockDim.y * width;

    // Load cache (32x32 shared memory, 16x16 threads blocks)
    int y0 = ty + blockIdx.y * blockDim.y;
    int y = y0 - n;

    if (y >= 0 && y0 < height) {
        // Load upper half into shared memory
        s_data[tx + ty * BLOCKSIZE] = data[pos - (width * n)];
        // Load lower half into shared memory
        s_data[tx + (ty + n) * BLOCKSIZE] = data[pos + (width * n)];
    } else {
        s_data[tx + ty * BLOCKSIZE] = 0;
        s_data[tx + (ty + n) * BLOCKSIZE] = 0;
    }

    __syncthreads();

    // Convolution using optimized memory accesses
    int sum = 0;
    for (int i = 0; i <= n * 2; i++)
        sum += s_data[tx + (ty + i) * BLOCKSIZE] * Global_Mask[i];

    result[pos] = sum;
}