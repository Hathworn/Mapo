#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blurKernel(float *out, const float *in, int width, int height) {
    // Calculate global thread coordinates
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (col < width && row < height) {
        float pixVal = 0.0f;
        int pixels = 0;

        // Optimize loop by using registers for constants
        int blurSize = BLUR_SIZE;
        
        // Unroll loops for better performance
        #pragma unroll
        for (int blurrow = -blurSize; blurrow <= blurSize; ++blurrow) {
            #pragma unroll
            for (int blurcol = -blurSize; blurcol <= blurSize; ++blurcol) {
                int currow = row + blurrow;
                int curcol = col + blurcol;
                
                // Verify valid image pixel using boundary checks
                if (currow >= 0 && currow < height && curcol >= 0 && curcol < width) {
                    pixVal += in[currow * width + curcol];
                    pixels++;
                }
            }
        }

        // Write new pixel value
        out[row * width + col] = pixVal / pixels;
    }
}