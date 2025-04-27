#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Correlation_backward_input1(int item, float *gradInput1, int nInputChannels, int inputHeight, int inputWidth, float *gradOutput, int nOutputChannels, int outputHeight, int outputWidth, float *rInput2, int pad_size, int kernel_size, int max_displacement, int stride1, int stride2)
{
    // Calculate global coordinates
    int n = item;
    int y = blockIdx.x * stride1 + pad_size;
    int x = blockIdx.y * stride1 + pad_size;
    int c = blockIdx.z;
    
    // Calculate shared memory index
    int tch_off = threadIdx.x;

    // Precompute constants
    int kernel_rad = (kernel_size - 1) / 2;
    int displacement_rad = max_displacement / stride2;
    int displacement_size = 2 * displacement_rad + 1;
    int pInputWidth = inputWidth + 2 * pad_size;

    // Compute bounds for iteration
    int xmin = max((x - kernel_rad - max_displacement) / stride1, 0);
    int ymin = max((y - kernel_rad - max_displacement) / stride1, 0);
    int xmax = min((x + kernel_rad - max_displacement) / stride1, outputWidth - 1);
    int ymax = min((y + kernel_rad - max_displacement) / stride1, outputHeight - 1);

    if (xmax < 0 || ymax < 0 || xmin > xmax || ymin > ymax) {
        return;
    }

    // Precompute offsets
    int pdimyxc = pInputWidth * nInputChannels * (inputHeight + 2 * pad_size);
    int pdimxc = pInputWidth * nInputChannels;
    int pdimc = nInputChannels;

    int tdimyx = outputHeight * outputWidth;
    int tdimx = outputWidth;

    int odimcyx = nInputChannels * inputHeight * inputWidth;
    int odimyx = inputHeight * inputWidth;
    int odimx = inputWidth;

    float nelems = kernel_size * kernel_size * nInputChannels;

    // Use shared memory for keeping accumulated products
    __shared__ float prod_sum[CUDA_NUM_THREADS];
    prod_sum[tch_off] = 0.0f;

    // Loop over output channels
    for (int tc = tch_off; tc < nOutputChannels; tc += CUDA_NUM_THREADS) {
        int i2 = (tc % displacement_size - displacement_rad) * stride2;
        int j2 = (tc / displacement_size - displacement_rad) * stride2;

        int indx2 = n * pdimyxc + (y + j2) * pdimxc + (x + i2) * pdimc + c;

        float val2 = rInput2[indx2];

        // Accumulate product within bounds
        for (int j = ymin; j <= ymax; ++j) {
            for (int i = xmin; i <= xmax; ++i) {
                int tindx = n * nOutputChannels * tdimyx + tc * tdimyx + j * tdimx + i;
                prod_sum[tch_off] += gradOutput[tindx] * val2;
            }
        }
    }
    __syncthreads();

    // Reduce the sum across threads
    if (tch_off == 0) {
        float reduce_sum = 0.0f;
        for (int idx = 0; idx < CUDA_NUM_THREADS; idx++) {
            reduce_sum += prod_sum[idx];
        }
        const int indx1 = n * odimcyx + c * odimyx + (y - pad_size) * odimx + (x - pad_size);
        gradInput1[indx1] = reduce_sum / nelems;
    }
}