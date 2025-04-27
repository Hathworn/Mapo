#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE_X 16
#define BLOCK_SIZE_Y 16

__global__ void gameOfLifeKernel(unsigned char* d_src, unsigned char* d_dst, const size_t width, const size_t height) {
    extern __shared__ unsigned char board_sh[];

    size_t glob_x = blockDim.x * blockIdx.x + threadIdx.x;
    size_t glob_y = blockDim.y * blockIdx.y + threadIdx.y;
    size_t glob_idx = glob_y * width + glob_x;

    size_t index = blockDim.x * threadIdx.y + threadIdx.x;

    int share_width = blockDim.x + 2;
    int share_height = blockDim.y + 2;
    
    bool isActive = (glob_x < width && glob_y < height);

    // Optimized shared memory copying using contiguous memory access
    for (int share_idx = index; share_idx < share_width * share_height; share_idx += (blockDim.x * blockDim.y)) {
        int x_img = (blockDim.x * blockIdx.x - 1) + (share_idx % share_width);
        int y_img = (blockDim.y * blockIdx.y - 1) + (share_idx / share_width);

        x_img = (x_img + width) % width; // Wrap around logic
        y_img = (y_img + height) % height; // Wrap around logic

        board_sh[share_idx] = d_src[width * y_img + x_img];
    }

    __syncthreads();

    if (isActive) {
        unsigned char me = board_sh[share_width * (threadIdx.y + 1) + threadIdx.x + 1];

        // Count neighbors from shared memory
        int count = 0;
        count += board_sh[share_width * (threadIdx.y) + threadIdx.x];
        count += board_sh[share_width * (threadIdx.y) + threadIdx.x + 1];
        count += board_sh[share_width * (threadIdx.y) + threadIdx.x + 2];
        count += board_sh[share_width * (threadIdx.y + 1) + threadIdx.x];
        count += board_sh[share_width * (threadIdx.y + 1) + threadIdx.x + 2];
        count += board_sh[share_width * (threadIdx.y + 2) + threadIdx.x];
        count += board_sh[share_width * (threadIdx.y + 2) + threadIdx.x + 1];
        count += board_sh[share_width * (threadIdx.y + 2) + threadIdx.x + 2];

        // Game of life rules applied
        if (me == 1) {
            d_dst[glob_idx] = (count == 2 || count == 3) ? 1 : 0;
        } else {
            d_dst[glob_idx] = (count == 3) ? 1 : 0;
        }
    }
}