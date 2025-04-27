#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Correlation_backward_input1(int item, float *gradInput1, int nInputChannels, int inputHeight, int inputWidth, float *gradOutput, int nOutputChannels, int outputHeight, int outputWidth, float *rInput2, int pad_size, int kernel_size, int max_displacement, int stride1, int stride2) {
    // Calculate coordinates with padding offset
    int n = item;
    int y = blockIdx.x * stride1 + pad_size;
    int x = blockIdx.y * stride1 + pad_size;
    int c = blockIdx.z;
    int tch_off = threadIdx.x;

    // Pre-compute constants
    const int kernel_rad = (kernel_size - 1) / 2;
    const int displacement_rad = max_displacement / stride2;
    const int displacement_size = 2 * displacement_rad + 1;

    int xmin = max(0, (x - kernel_rad - max_displacement) / stride1);
    int ymin = max(0, (y - kernel_rad - max_displacement) / stride1);
    int xmax = min(outputWidth - 1, (x + kernel_rad - max_displacement) / stride1);
    int ymax = min(outputHeight - 1, (y + kernel_rad - max_displacement) / stride1);

    if (xmax < 0 || ymax < 0 || xmin >= outputWidth || ymin >= outputHeight || xmin > xmax || ymin > ymax) return;

    const int pInputWidth = inputWidth + 2 * pad_size;
    const int pdimyxc = pInputWidth * (inputHeight + 2 * pad_size) * nInputChannels;
    const int pdimxc = pInputWidth * nInputChannels;
    const int tdimcyx = nOutputChannels * outputHeight * outputWidth;
    const int tdimyx = outputHeight * outputWidth;
    const int tdimx = outputWidth;
    const int odimcyx = nInputChannels * inputHeight * inputWidth;
    const int odimx = inputWidth;

    float nelems = kernel_size * kernel_size * nInputChannels;

    __shared__ float prod_sum[CUDA_NUM_THREADS];
    prod_sum[tch_off] = 0;

    // Loop unrolling and memory coalescing optimization
    #pragma unroll
    for (int tc = tch_off; tc < nOutputChannels; tc += CUDA_NUM_THREADS) {
        int i2 = (tc % displacement_size - displacement_rad) * stride2;
        int j2 = (tc / displacement_size - displacement_rad) * stride2;

        int indx2 = n * pdimyxc + (y + j2) * pdimxc + (x + i2) * nInputChannels + c;
        float val2 = rInput2[indx2];

        for (int j = ymin; j <= ymax; ++j) {
            for (int i = xmin; i <= xmax; ++i) {
                int tindx = n * tdimcyx + tc * tdimyx + j * tdimx + i;
                prod_sum[tch_off] += gradOutput[tindx] * val2;
            }
        }
    }

    // Threadblock reduction
    __syncthreads();
    if (tch_off == 0) {
        float reduce_sum = 0;
        for (int idx = 0; idx < CUDA_NUM_THREADS; ++idx) {
            reduce_sum += prod_sum[idx];
        }
        const int indx1 = n * odimcyx + c * (inputHeight * inputWidth) + (y - pad_size) * odimx + (x - pad_size);
        gradInput1[indx1] = reduce_sum / nelems;
    }
}