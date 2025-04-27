#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void d_sobelFilter(unsigned char* imageIn, unsigned char* imageOut, int width, int height, int maskWidth, char* M) {
    int Row = blockDim.y * blockIdx.y + threadIdx.y;
    int Col = blockDim.x * blockIdx.x + threadIdx.x;

    if(Row < height && Col < width) {
        int res = 0;
        for(int i = 0; i < maskWidth; i++) {
            for(int j = 0; j < maskWidth; j++) {
                int nrow = Row + i - (maskWidth / 2);
                int ncol = Col + j - (maskWidth / 2);
                // Check image boundary before accessing memory
                if(nrow >= 0 && nrow < height && ncol >= 0 && ncol < width) {
                    res += imageIn[nrow * width + ncol] * M[i * maskWidth + j];
                }
            }
        }
        // Clamp result to valid range
        imageOut[Row * width + Col] = (unsigned char)min(max(res, 0), 255);
    }
}