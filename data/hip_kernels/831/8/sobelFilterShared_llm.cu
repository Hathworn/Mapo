#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCKSIZE 16
#define Mask_size 3

__global__ void sobelFilterShared(unsigned char *data, unsigned char *result, int width, int height) {
    // Data cache: threadIdx.x , threadIdx.y
    const int n = Mask_size / 2;
    __shared__ int s_data[BLOCKSIZE + Mask_size * 2][BLOCKSIZE + Mask_size * 2];

    // global mem address of the current thread in the whole grid
    const int x0 = threadIdx.x + blockIdx.x * blockDim.x;
    const int y0 = threadIdx.y + blockIdx.y * blockDim.y;
    const int pos = x0 + y0 * width;

    // Load data from global memory into shared memory
    for (int dy = -n; dy <= n; ++dy) {
        for (int dx = -n; dx <= n; ++dx) {
            int xi = x0 + dx;
            int yi = y0 + dy;
            int shared_x = threadIdx.x + dx + n;
            int shared_y = threadIdx.y + dy + n;
            if (xi < 0 || xi >= width || yi < 0 || yi >= height) {
                // Boundary check
                s_data[shared_y][shared_x] = 0;
            } else {
                // Load valid data
                s_data[shared_y][shared_x] = data[xi + yi * width];
            }
        }
    }

    __syncthreads();

    // Convolution
    int sum = 0;
    int x = n + threadIdx.x;
    int y = n + threadIdx.y;
    for (int i = -n; i <= n; i++) {
        for (int j = -n; j <= n; j++) {
            sum += s_data[y + i][x + j] * Global_Mask[n + i] * Global_Mask[n + j];
        }
    }

    result[pos] = sum;
}