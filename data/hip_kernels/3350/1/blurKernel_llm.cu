#include "hip/hip_runtime.h"
#include "includes.h"

#define index(i, j, w)  ((i)*(w)) + (j)

__global__ void blurKernel(unsigned char *d_inputArray, unsigned char *d_outputArray, int w, int h, int blurSize) {
    // Calculate global thread coordinates
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread operates within image boundaries
    if (Col < w && Row < h) {
        int pixVal = 0;
        int pixels = 0;

        // Loop over the blur window
        for (int blurRow = -blurSize; blurRow <= blurSize; ++blurRow) {
            int curRow = Row + blurRow;
            if (curRow >= 0 && curRow < h) { // Valid row check outside inner loop
                for (int blurCol = -blurSize; blurCol <= blurSize; ++blurCol) {
                    int curCol = Col + blurCol;
                    // Validate column, calculate pixel value, increment pixel count
                    if (curCol >= 0 && curCol < w) {
                        pixVal += d_inputArray[index(curRow, curCol, w)];
                        pixels++;
                    }
                }
            }
        }

        // Write the averaged pixel value to the output array
        d_outputArray[index(Row, Col, w)] = (unsigned char)(pixVal / pixels);
    }
}