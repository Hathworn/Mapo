#include "hip/hip_runtime.h"
#include "includes.h"

// Gaussian blur CUDA kernel
__global__ void GaussianBlurCuda(unsigned char *pic, unsigned char *outpic, double *mask, int *size) {
    // Calculate pixel position
    int pxPosCen = blockIdx.x * blockDim.x + threadIdx.x;
    if (pxPosCen >= size[0] * size[1]) return;

    int row = pxPosCen / size[0];
    int col = pxPosCen % size[0];
    
    // Border check
    if (row < size[2] / 2 || row >= (size[1] - size[2] / 2)) return;
    if (col < size[2] / 2 || col >= (size[0] - size[2] / 2)) return;

    double sumout[3] = {0.0, 0.0, 0.0};

    // Compute Gaussian blur
    for (int i = 0; i < size[2]; i++) {    // Loop over the mask's height
        for (int j = 0; j < size[2]; j++) { // Loop over the mask's width
            int x = j + col - size[2] / 2;
            int y = i + row - size[2] / 2;
            int pos = (y * size[0] + x) * 3;

            // Accumulate sum for RGB channels
            sumout[0] += static_cast<double>(pic[pos]) * mask[i * size[2] + j];
            sumout[1] += static_cast<double>(pic[pos + 1]) * mask[i * size[2] + j];
            sumout[2] += static_cast<double>(pic[pos + 2]) * mask[i * size[2] + j];
        }
    }

    // Write back output pixels
    int pos = pxPosCen * 3;
    outpic[pos] = static_cast<unsigned char>(sumout[0]);
    outpic[pos + 1] = static_cast<unsigned char>(sumout[1]);
    outpic[pos + 2] = static_cast<unsigned char>(sumout[2]);
}