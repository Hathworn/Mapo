#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blurKernel(uchar3 *in, uchar3 *out, int w, int h)
{
    int Col = blockIdx.x * blockDim.x + threadIdx.x;
    int Row = blockIdx.y * blockDim.y + threadIdx.y;

    if (Col < w && Row < h)
    {
        int pixValR = 0, pixValG = 0, pixValB = 0; // Separate channels
        int pixels = 0;

        for (int blurRow = -BLUR_SIZE; blurRow <= BLUR_SIZE; ++blurRow)
        {
            for (int blurCol = -BLUR_SIZE; blurCol <= BLUR_SIZE; ++blurCol)
            {
                int curRow = Row + blurRow;
                int curCol = Col + blurCol;

                if (curRow >= 0 && curRow < h && curCol >= 0 && curCol < w)
                {
                    uchar3 pixel = in[curRow * w + curCol];
                    pixValR += static_cast<int>(pixel.x);
                    pixValG += static_cast<int>(pixel.y);
                    pixValB += static_cast<int>(pixel.z);
                    pixels++;
                }
            }
        }

        // Assign accumulated values to output
        out[Row * w + Col].x = static_cast<unsigned char>(pixValR / pixels);
        out[Row * w + Col].y = static_cast<unsigned char>(pixValG / pixels);
        out[Row * w + Col].z = static_cast<unsigned char>(pixValB / pixels);
    }
}