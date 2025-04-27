#include "hip/hip_runtime.h"
#include "includes.h"

#pragma diag_suppress integer_sign_change

static unsigned short* d_in;
static unsigned char* d_out;

static unsigned int h_Width;
static unsigned int h_Height;

static unsigned int h_BlockWidth;
static unsigned int h_BlockHeight;

#define THREAD_TOTAL_X_LEN 12
#define THREAD_AUX_X_LEN 4
#define THREAD_WORKING_X_LEN (THREAD_TOTAL_X_LEN - THREAD_AUX_X_LEN)

#define THREAD_TOTAL_Y_LEN 12
#define THREAD_AUX_Y_LEN 4
#define THREAD_WORKING_Y_LEN (THREAD_TOTAL_Y_LEN - THREAD_AUX_Y_LEN)

#define OFFSET(x,y) sIdx + y * THREAD_TOTAL_X_LEN + x

__global__ void Sobel(const unsigned short* in, unsigned char* out, const unsigned int width, const unsigned int height)
{
    extern __shared__ float s[];

    const unsigned int xPos = (blockIdx.x * THREAD_WORKING_X_LEN + threadIdx.x) - (THREAD_AUX_X_LEN / 2);
    const unsigned int yPos = (blockIdx.y * THREAD_WORKING_Y_LEN + threadIdx.y) - (THREAD_AUX_Y_LEN / 2);
    const unsigned int inPos = (xPos + yPos * width);
    const unsigned int sIdx = (threadIdx.x + threadIdx.y * THREAD_TOTAL_X_LEN);
    unsigned int outIt = inPos * 4;

    // Efficient shared memory usage
    if (xPos < width && yPos < height)
        s[sIdx] = in[inPos] / float(USHRT_MAX);
    else
        s[sIdx] = 0.0f;

    __syncthreads();

    // Optimize bounds checking within kernel
    if ((threadIdx.x - (THREAD_AUX_X_LEN / 2)) < THREAD_WORKING_X_LEN && (threadIdx.y - (THREAD_AUX_Y_LEN / 2)) < THREAD_WORKING_Y_LEN)
    {
        // Optimize Sobel calculations by clearly defining the sobel kernels
        const float sobelXKernel[5] = {-1, -2, 0, 2, 1};
        const float sobelYKernel[5] = {1, 2, 0, -2, -1};

        float sobelX = 0.0f;
        float sobelY = 0.0f;

        for (int i = -2; i <= 2; ++i) {
            sobelX += sobelXKernel[i + 2] * (s[OFFSET(i, -2)] + s[OFFSET(i, -1)] * 2 + s[OFFSET(i, 0)] * 4 + s[OFFSET(i, 1)] * 2 + s[OFFSET(i, 2)]);
            sobelY += sobelYKernel[i + 2] * (s[OFFSET(-2, i)] + s[OFFSET(-1, i)] * 2 + s[OFFSET(0, i)] * 4 + s[OFFSET(1, i)] * 2 + s[OFFSET(2, i)]);
        }
        sobelX *= (512 / 8) / 18;
        sobelY *= (512 / 8) / 18;

        const float gradientLen = sqrt(sobelX * sobelX + sobelY * sobelY + 1.0f);

        const unsigned char xLen = -(sobelX * 128) / gradientLen + 128;
        const unsigned char yLen = -(sobelY * 128) / gradientLen + 128;
        const unsigned char zLen = UCHAR_MAX / gradientLen;

        out[outIt++] = xLen;
        out[outIt++] = yLen;
        out[outIt++] = zLen;
        out[outIt] = 255;
    }
}