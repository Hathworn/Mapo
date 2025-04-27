#include "hip/hip_runtime.h"
#include "includes.h"
#define BLUR_SIZE 1

__global__ void Blurrig(unsigned char* output, unsigned char* input, int height, int width) {
    // Calculate thread position within the grid
    int Col = threadIdx.x + blockIdx.x * blockDim.x;
    int Row = threadIdx.y + blockIdx.y * blockDim.y;

    if (Col < width && Row < height) {
        int pixVal = 0;
        int pixels = 0;

        // Optimize loop calculations by pre-calculating bounds
        int rowStart = max(0, Row - BLUR_SIZE);
        int rowEnd = min(height - 1, Row + BLUR_SIZE);
        int colStart = max(0, Col - BLUR_SIZE);
        int colEnd = min(width - 1, Col + BLUR_SIZE);

        for (int curRow = rowStart; curRow <= rowEnd; ++curRow) {
            for (int curCol = colStart; curCol <= colEnd; ++curCol) {
                pixVal += input[curRow * width + curCol];
                pixels++; // count valid pixels
            }
        }
        // Write blurred pixel value
        output[Row * width + Col] = (unsigned char)(pixVal / pixels);
    }
}