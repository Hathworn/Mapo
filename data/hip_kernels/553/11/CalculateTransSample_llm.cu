#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CalculateTransSample(const float *input, float *output, const int wtss, const int htss, const int wts, const int hts, const int ratio) {
    const int yts = blockIdx.y * blockDim.y + threadIdx.y;
    const int xts = blockIdx.x * blockDim.x + threadIdx.x;
    const int curst = wts * yts + xts;
    const int yt = yts * ratio;
    const int xt = xts * ratio;

    if (yts < hts && xts < wts) {
        // Loop unrolling for better performance
        int idx;
        for (int i = 0; i < ratio; i++) {
            idx = yt + i;
            if (idx < htss) {
                for (int j = 0; j < ratio; j++) {
                    int jdx = xt + j;
                    if (jdx < wtss) {
                        const int curt = wtss * idx + jdx;
                        output[curt * 3 + 0] = input[curst * 3 + 0];
                        output[curt * 3 + 1] = input[curst * 3 + 1];
                        output[curt * 3 + 2] = input[curst * 3 + 2];
                    }
                }
            }
        }
    }
}