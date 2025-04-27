#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CalculateSampleB(const float *background, float *subBG, const int wb, const int hb, const int ws, const int hs, const int sRate) {
    // Calculate current sample position
    const int ys = blockIdx.y * blockDim.y + threadIdx.y;
    const int xs = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within the sample space
    if (ys < hs && xs < ws) {
        const int curst = ws * ys + xs;
        const int yb = ys * sRate;
        const int xb = xs * sRate;
        
        int num = 0;
        float sum[3] = {0.0f, 0.0f, 0.0f};

        // Improved memory coalescing by adjusting index calculation
        for (int i = 0; i < sRate; ++i) {
            for (int j = 0; j < sRate; ++j) {
                int y_offset = yb + i;
                int x_offset = xb + j;
                if (y_offset < hb && x_offset < wb) {
                    int curb = wb * y_offset + x_offset;
                    sum[0] += background[curb * 3 + 0];
                    sum[1] += background[curb * 3 + 1];
                    sum[2] += background[curb * 3 + 2];
                    ++num;
                }
            }
        }
        
        // Assign averaged color values
        subBG[curst * 3 + 0] = sum[0] / num;
        subBG[curst * 3 + 1] = sum[1] / num;
        subBG[curst * 3 + 2] = sum[2] / num;
    }
}