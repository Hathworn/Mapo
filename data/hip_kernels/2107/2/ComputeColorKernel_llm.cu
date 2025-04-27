#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeColorKernel(float *u, float *v, int width, int height, int stride, float3 *uvRGB, float flowscale) {
    int r = blockIdx.y * blockDim.y + threadIdx.y;  // current row
    int c = blockIdx.x * blockDim.x + threadIdx.x;  // current column

    if (r < height && c < width) {
        int pos = c + stride * r;
        float du = u[pos] / flowscale;
        float dv = v[pos] / flowscale;

        int ncols = 55;
        float rad = sqrtf(du * du + dv * dv);
        float a = atan2f(-dv, -du) / 3.14159f;
        float fk = (a + 1) * 0.5f * ((float)ncols - 1);
        int k0 = __float2int_rd(fk);  // fast floor alternative
        int k1 = k0 + 1;
        if (k1 >= ncols) {
            k1 = 0;
        }
        float f = fk - (float)k0;

        __shared__ float colorwheelR[55], colorwheelG[55], colorwheelB[55];
        if (threadIdx.x == 0 && threadIdx.y == 0) {
            float tempR[55] = {255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
                               255, 213, 170, 128, 85, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                               0, 0, 0, 0, 0, 0, 0, 19, 39, 58, 78, 98, 117, 137, 156,
                               176, 196, 215, 235, 255, 255, 255, 255, 255, 255};
            float tempG[55] = {0, 17, 34, 51, 68, 85, 102, 119, 136, 153, 170, 187, 204, 221, 238,
                               255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 232, 209, 186, 163,
                               140, 116, 93, 70, 47, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                               0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
            float tempB[55] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                               0, 0, 0, 0, 0, 0, 0, 63, 127, 191, 255, 255, 255, 255, 255,
                               255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
                               255, 255, 255, 255, 255, 213, 170, 128, 85, 43};
            for (int i = 0; i < 55; i++) {
                colorwheelR[i] = tempR[i];
                colorwheelG[i] = tempG[i];
                colorwheelB[i] = tempB[i];
            }
        }
        __syncthreads();

        float colR = (1 - f) * (colorwheelR[k0] / 255.0f) + f * (colorwheelR[k1] / 255.0f);
        float colG = (1 - f) * (colorwheelG[k0] / 255.0f) + f * (colorwheelG[k1] / 255.0f);
        float colB = (1 - f) * (colorwheelB[k0] / 255.0f) + f * (colorwheelB[k1] / 255.0f);

        if (rad <= 1) {
            colR = 1 - rad * (1 - colR);
            colG = 1 - rad * (1 - colG);
            colB = 1 - rad * (1 - colB);
        } else {
            colR *= 0.75f;
            colG *= 0.75f;
            colB *= 0.75f;
        }

        uvRGB[pos] = make_float3(colB, colG, colR);
    }
}