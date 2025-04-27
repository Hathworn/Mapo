#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_with_average(unsigned char *img, int *nz, int *average, int scale)
{
    // Calculate thread's global position
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;

    // Loop over tile dimension with stride of block size
    for (int j = y; j < y + TILE_DIM; j += BLOCK_ROWS)
    {
        int iw = x;
        int ih = j;

        // Only process pixels that meet condition
        if ((img[3 * (ih * width + iw)] + img[3 * (ih * width + iw) + 1] + img[3 * (ih * width + iw) + 2] == 0) && 
            (nz[ih / scale * width + iw / scale] > 0))
        {
            // Use shared memory to reduce bank access conflicts if needed (not used here)
            int index_scaled = (ih / scale) * width + iw / scale;
            int nz_value = nz[index_scaled];
            img[3 * (ih * width + iw)] = (unsigned char)(average[3 * index_scaled] / nz_value);
            img[3 * (ih * width + iw) + 1] = (unsigned char)(average[3 * index_scaled + 1] / nz_value);
            img[3 * (ih * width + iw) + 2] = (unsigned char)(average[3 * index_scaled + 2] / nz_value);
        }
    }
}