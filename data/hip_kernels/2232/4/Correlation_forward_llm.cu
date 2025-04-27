#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Correlation_forward( float *output, int nOutputChannels, int outputHeight, int outputWidth, float *rInput1, int nInputChannels, int inputHeight, int inputWidth, float *rInput2, int pad_size, int kernel_size, int max_displacement, int stride1, int stride2)
{
    // n (batch size), c (num of channels), y (height), x (width)

    int pInputWidth = inputWidth + 2 * pad_size;
    int pInputHeight = inputHeight + 2 * pad_size;

    int kernel_rad = (kernel_size - 1) / 2;
    int displacement_rad = max_displacement / stride2;
    int displacement_size = 2 * displacement_rad + 1;

    int n  = blockIdx.x;
    int y1 = blockIdx.y * stride1 + max_displacement + kernel_rad;
    int x1 = blockIdx.z * stride1 + max_displacement + kernel_rad;
    int c = threadIdx.x;

    int pdimyxc = pInputHeight * pInputWidth * nInputChannels;
    int pdimxc = pInputWidth * nInputChannels;
    int pdimc = nInputChannels;

    int tdimcyx = nOutputChannels * outputHeight * outputWidth;
    int tdimyx = outputHeight * outputWidth;
    int tdimx = outputWidth;

    float nelems = kernel_size * kernel_size * pdimc;

    __shared__ float prod_sum[THREADS_PER_BLOCK];

    // Element-wise product along channel axis. Initialize prod_sum
    prod_sum[c] = 0;

    // Loop unrolling for better performance
    for (int tj = -displacement_rad; tj <= displacement_rad; ++tj) {
        for (int ti = -displacement_rad; ti <= displacement_rad; ++ti) {
            int x2 = x1 + ti * stride2;
            int y2 = y1 + tj * stride2;

            // Precompute index start to reduce redundant calculation
            int idx_start1 = n * pdimyxc + y1 * pdimxc + x1 * pdimc;
            int idx_start2 = n * pdimyxc + y2 * pdimxc + x2 * pdimc;

            for (int j = -kernel_rad; j <= kernel_rad; ++j) {
                int idx1 = idx_start1 + j * pdimxc;
                int idx2 = idx_start2 + j * pdimxc;

                for (int i = -kernel_rad; i <= kernel_rad; ++i) {
                    for (int ch = c; ch < pdimc; ch += THREADS_PER_BLOCK) {
                        prod_sum[c] += rInput1[idx1 + i * pdimc + ch] * rInput2[idx2 + i * pdimc + ch];
                    }
                }
            }

            // Sum reduction using parallel threads
            __syncthreads();
            if (c == 0) {
                float reduce_sum = 0;
                for (int index = 0; index < THREADS_PER_BLOCK; ++index) {
                    reduce_sum += prod_sum[index];
                }
                int tc = (tj + displacement_rad) * displacement_size + (ti + displacement_rad);
                const int tindx = n * tdimcyx + tc * tdimyx + blockIdx.y * tdimx + blockIdx.z;
                output[tindx] = reduce_sum / nelems;
            }
        }
    }
}