#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Correlation_backward_input1(int item, float *gradInput1, int nInputChannels, int inputHeight, int inputWidth, float *gradOutput, int nOutputChannels, int outputHeight, int outputWidth, float *rInput2, int pad_size, int kernel_size, int max_displacement, int stride1, int stride2)
{
    // Calculate pixel indices with padding offset for the batch item
    int n = item;
    int y = blockIdx.x * stride1 + pad_size;
    int x = blockIdx.y * stride1 + pad_size;
    int c = blockIdx.z;
    int tch_off = threadIdx.x;

    // Precompute constants
    int kernel_rad = (kernel_size - 1) / 2;
    int displacement_rad = max_displacement / stride2;
    int displacement_size = 2 * displacement_rad + 1;
    
    // Compute bounds for processing
    int xmin = (x - kernel_rad - max_displacement) / stride1;
    int ymin = (y - kernel_rad - max_displacement) / stride1;
    int xmax = (x + kernel_rad - max_displacement) / stride1;
    int ymax = (y + kernel_rad - max_displacement) / stride1;

    // Return early if out of bounds
    if (xmax < 0 || ymax < 0 || xmin >= outputWidth || ymin >= outputHeight) {
        return;
    }
    if (xmin > xmax || ymin > ymax) {
        return;
    }

    // Clamp bounds within valid range
    xmin = max(0, xmin);
    xmax = min(outputWidth - 1, xmax);
    ymin = max(0, ymin);
    ymax = min(outputHeight - 1, ymax);

    // Precompute dimensional offsets
    int pInputWidth = inputWidth + 2 * pad_size;
    int pInputHeight = inputHeight + 2 * pad_size;
    int pdimyxc = pInputHeight * pInputWidth * nInputChannels;
    int pdimxc = pInputWidth * nInputChannels;
    int pdimc = nInputChannels;
    int tdimcyx = nOutputChannels * outputHeight * outputWidth;
    int tdimyx = outputHeight * outputWidth;
    int tdimx = outputWidth;

    // Compute total elements of kernel window
    float nelems = kernel_size * kernel_size * nInputChannels;

    // Shared memory allocation for warp-wide sum
    __shared__ float prod_sum[CUDA_NUM_THREADS];
    prod_sum[tch_off] = 0;

    // Accumulate results across channels within a block
    for (int tc = tch_off; tc < nOutputChannels; tc += CUDA_NUM_THREADS) {
        int i2 = (tc % displacement_size - displacement_rad) * stride2;
        int j2 = (tc / displacement_size - displacement_rad) * stride2;
        int indx2 = n * pdimyxc + (y + j2) * pdimxc + (x + i2) * pdimc + c;

        // Load co-located value from rInput2
        float val2 = rInput2[indx2];

        // Accumulate correlation contributions within specified bounds
        for (int j = ymin; j <= ymax; ++j) {
            for (int i = xmin; i <= xmax; ++i) {
                int tindx = n * tdimcyx + tc * tdimyx + j * tdimx + i;
                prod_sum[tch_off] += gradOutput[tindx] * val2;
            }
        }
    }
    __syncthreads();

    // Accumulate results across threads
    if (tch_off == 0) {
        float reduce_sum = 0;
        for (int idx = 0; idx < CUDA_NUM_THREADS; idx++) {
            reduce_sum += prod_sum[idx];
        }
        const int indx1 = n * pdimyxc + c * (pInputHeight * inputWidth) + (y - pad_size) * inputWidth + (x - pad_size);
        gradInput1[indx1] = reduce_sum / nelems;
    }
}