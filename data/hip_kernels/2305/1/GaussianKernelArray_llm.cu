#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GaussianKernelArray(const uint8_t *src, uint8_t *dst, int width, int height, int step, int ks)
{
    __shared__ float filter[5][5];
    if (threadIdx.x < ks && threadIdx.y < ks) {
        filter[threadIdx.y][threadIdx.x] = 
            (threadIdx.y == 0 || threadIdx.y == ks-1 || threadIdx.x == 0 || threadIdx.x == ks-1) ? 0.002969017f : 
            (threadIdx.y == 1 || threadIdx.y == ks-2 || threadIdx.x == 1 || threadIdx.x == ks-2) ? 0.01330621f : 
            (threadIdx.y == 2 && threadIdx.x == 2) ? 0.162102822f : 0.098320331f;
    }
    __syncthreads();

    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        float sum = 0;
        // Unrolling loop to reduce overhead and improve performance
        for (int dy = 0; dy < ks; ++dy) {
            int offset = (y + dy) * step;
            for (int dx = 0; dx < ks; ++dx) {
                sum += filter[dy][dx] * src[(x + dx) + offset];
            }
        }
        dst[x + y * step] = static_cast<uint8_t>(sum + 0.5f);
    }
}