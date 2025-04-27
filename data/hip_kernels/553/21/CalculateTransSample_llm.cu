#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CalculateTransSample( const float *input, float *output, const int wtss, const int htss, const int wts, const int hts, const int ratio ) {
    const int yts = blockIdx.y * blockDim.y + threadIdx.y;
    const int xts = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if thread is out of bounds
    if (yts >= hts || xts >= wts) return;

    const int curst = wts * yts + xts;
    const int yt = yts * ratio;
    const int xt = xts * ratio;

    // Unroll the loop if ratio is small and known at compile time (e.g., ratio == 2 or 4)
    #pragma unroll
    for (int i = 0; i < ratio; i++) {
        #pragma unroll
        for (int j = 0; j < ratio; j++) {
            int yt_i = yt + i;
            int xt_j = xt + j;
            if (yt_i < htss && xt_j < wtss) {
                const int curt = wtss * yt_i + xt_j;
                output[curt * 3 + 0] = input[curst * 3 + 0];
                output[curt * 3 + 1] = input[curst * 3 + 1];
                output[curt * 3 + 2] = input[curst * 3 + 2];
            }
        }
    }
}