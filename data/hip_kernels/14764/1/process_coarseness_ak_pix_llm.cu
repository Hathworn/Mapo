#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double efficientLocalMean_dev(const long x, const long y, const long k, double *input_img, int rowsize, int colsize) {
    long k2 = k / 2;

    long dimx = rowsize;
    long dimy = colsize;

    // Calculate region of interest
    long starty = max(0, y - k2);
    long startx = max(0, x - k2);
    long stopy = min(dimy - 1, y + k2 - 1);
    long stopx = min(dimx - 1, x + k2 - 1);

    // Fetch boundary values ensuring no out-of-bound memory access
    double links = (startx - 1 < 0) ? 0 : *(input_img + (stopy * dimx + startx - 1));
    double oben = (starty - 1 < 0) ? 0 : *(input_img + ((stopy - 1) * dimx + startx));
    double obenlinks = ((starty - 1 < 0) || (startx - 1 < 0)) ? 0 : *(input_img + ((stopy - 1) * dimx + startx - 1));
    double unten = *(input_img + (stopy * dimx + startx));

    long counter = (stopy - starty + 1) * (stopx - startx + 1);
    return (unten - links - oben + obenlinks) / counter;
}

__global__ void process_coarseness_ak_pix(double *output_ak, double *input_img, int colsize, int rowsize, long lenOf_ak) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within image boundaries
    if (y < colsize && x < rowsize) {
        int index = y * rowsize + x;
        output_ak[index] = efficientLocalMean_dev(x, y, lenOf_ak, input_img, rowsize, colsize);
    }
}