#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void boxBlur(uchar4 *d_img, uchar4 *d_blurred, int numRows, int numCols, int k){

    // Calculate global thread ID
    int threadX = blockIdx.x * blockDim.x + threadIdx.x;
    int threadY = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the current thread is within bounds
    if (threadX >= numRows || threadY >= numCols) return;

    int pixel = numCols * threadX + threadY;
    int cornerX = threadX - (k / 2);
    int cornerY = threadY - (k / 2);

    int sumR = 0, sumG = 0, sumB = 0, count = 0;

    // Iterate over the kernel
    for (int i = 0; i < k; ++i) {
        for (int j = 0; j < k; ++j) {
            int currentX = cornerX + i;
            int currentY = cornerY + j;

            // Check if within bounds
            if (currentX >= 0 && currentX < numRows && currentY >= 0 && currentY < numCols) {
                int index = numCols * currentX + currentY;
                uchar4 currentColor = d_img[index];
                sumR += (int)currentColor.x;
                sumG += (int)currentColor.y;
                sumB += (int)currentColor.z;
                count++;
            }
        }
    }

    // Average color values
    uchar4 blurredColor;
    blurredColor.x = count ? (sumR / count) : d_img[pixel].x;
    blurredColor.y = count ? (sumG / count) : d_img[pixel].y;
    blurredColor.z = count ? (sumB / count) : d_img[pixel].z;

    // Write the resulting color to the blurred image
    d_blurred[pixel] = blurredColor;
}