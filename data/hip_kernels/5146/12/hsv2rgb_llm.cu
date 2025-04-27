#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hsv2rgb(float *inputH, float *inputS, float *inputV, uchar3 *output, int width, int height) {
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int tid = y * width + x;

    // Ensure within image bounds
    if (x < width && y < height) {
        float H = inputH[tid];
        float S = inputS[tid];
        float V = inputV[tid];

        // Precompute common values
        float d = H / 60.0f;
        int hi = (int)d % 6;
        float f = d - hi;
        float l = V * (1.0f - S);
        float m = V * (1.0f - f * S);
        float n = V * (1.0f - (1.0f - f) * S);

        // Use switch to reduce repeated comparisons
        switch(hi) {
            case 0:
                output[tid] = make_uchar3((int)(V * 255), (int)(n * 255), (int)(l * 255));
                break;
            case 1:
                output[tid] = make_uchar3((int)(m * 255), (int)(V * 255), (int)(l * 255));
                break;
            case 2:
                output[tid] = make_uchar3((int)(l * 255), (int)(V * 255), (int)(n * 255));
                break;
            case 3:
                output[tid] = make_uchar3((int)(l * 255), (int)(m * 255), (int)(V * 255));
                break;
            case 4:
                output[tid] = make_uchar3((int)(n * 255), (int)(l * 255), (int)(V * 255));
                break;
            case 5:
                output[tid] = make_uchar3((int)(V * 255), (int)(l * 255), (int)(m * 255));
                break;
        }
    }
}