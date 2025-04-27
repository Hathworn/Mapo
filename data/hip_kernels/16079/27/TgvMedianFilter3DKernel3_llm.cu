#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TgvMedianFilter3DKernel3(float* X, float* Y, float *Z, int width, int height, int stride, float *X1, float *Y1, float *Z1)
{
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;
    const int iy = threadIdx.y + blockIdx.y * blockDim.y;

    const int pos = ix + iy * stride;

    if (ix >= width || iy >= height) return;

    float mX[9], mY[9], mZ[9];

    // Store indices for boundary checks
    int col, row, index;
    int last_col = width - 1;
    int last_row = height - 1;

    // Load data using the 3x3 neighborhood
    for (int j = 0; j < 3; j++) {
        for (int i = 0; i < 3; i++) {
            col = min(max(ix + i - 1, 0), last_col);
            row = min(max(iy + j - 1, 0), last_row);
            index = j * 3 + i;
            mX[index] = X[col + stride * row];
            mY[index] = Y[col + stride * row];
            mZ[index] = Z[col + stride * row];
        }
    }

    // Perform in-place selection sort for median filter
    for (int j = 0; j < 5; j++) {
        for (int i = j + 1; i < 9; i++) {
            if (mX[j] > mX[i]) {
                // Swap the elements
                float tmp = mX[j];
                mX[j] = mX[i];
                mX[i] = tmp;
            }
            if (mY[j] > mY[i]) {
                // Swap the elements
                float tmp = mY[j];
                mY[j] = mY[i];
                mY[i] = tmp;
            }
            if (mZ[j] > mZ[i]) {
                // Swap the elements
                float tmp = mZ[j];
                mZ[j] = mZ[i];
                mZ[i] = tmp;
            }
        }
    }

    // Store the median value to output arrays
    X1[pos] = mX[4];
    Y1[pos] = mY[4];
    Z1[pos] = mZ[4];
}