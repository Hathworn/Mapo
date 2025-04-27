#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_blur(unsigned char* Pout, unsigned char* Pin, int width, int height) {
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int k_size = 1; // Update kernel size as +1 to include only center pixels

    if (col < width && row < height) {
        int pixVal = 0;
        int pixels = 0;

        // Use loop unrolling for performance optimization
        #pragma unroll
        for (int blurRow = -k_size; blurRow <= k_size; blurRow++) {
            #pragma unroll
            for (int blurCol = -k_size; blurCol <= k_size; blurCol++) {
                int curRow = row + blurRow;
                int curCol = col + blurCol;

                if (curRow >= 0 && curRow < height && curCol >= 0 && curCol < width) {
                    pixVal += Pin[curRow * width + curCol];
                    pixels++;
                }
            }
        }

        Pout[row * width + col] = static_cast<unsigned char>(pixVal / pixels); // Ensure proper casting
    }
}