#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Correlation_backward_input1(int item, float *gradInput1, int nInputChannels, int inputHeight, int inputWidth, float *gradOutput, int nOutputChannels, int outputHeight, int outputWidth, float *rInput2, int pad_size, int kernel_size, int max_displacement, int stride1, int stride2)
{
    // Calculate thread coordinates
    int n = item;
    int y = blockIdx.x * stride1 + pad_size;
    int x = blockIdx.y * stride1 + pad_size;
    int c = blockIdx.z;
    int tch_off = threadIdx.x;

    // Pre-compute commonly used values to minimize calculations in the loop
    int kernel_rad = (kernel_size - 1) / 2;
    int displacement_rad = max_displacement / stride2;
    int displacement_size = 2 * displacement_rad + 1;
    int pInputWidth = inputWidth + 2 * pad_size;
    int pdimc = nInputChannels;
    float nelems = kernel_size * kernel_size * nInputChannels;

    // Calculate bounds, optimized initialization
    int xmin = max(0, (x - kernel_rad - max_displacement) / stride1);
    int ymin = max(0, (y - kernel_rad - max_displacement) / stride1);
    int xmax = min(outputWidth-1, (x + kernel_rad - max_displacement) / stride1);
    int ymax = min(outputHeight-1, (y + kernel_rad - max_displacement) / stride1);

    if (xmax < xmin || ymax < ymin) return;

    // Declare shared memory for partial product sums
    __shared__ float prod_sum[CUDA_NUM_THREADS];
    prod_sum[tch_off] = 0;  // Reset shared memory for each thread

    // Loop over output channels
    for (int tc = tch_off; tc < nOutputChannels; tc += CUDA_NUM_THREADS) {

        // Calculate i2 and j2, reuse common computations
        int i2 = (tc % displacement_size - displacement_rad) * stride2;
        int j2 = (tc / displacement_size - displacement_rad) * stride2;
        
        int indx2 = n * pInputWidth * (inputHeight + 2 * pad_size) * nInputChannels + (y + j2) * pInputWidth * pdimc + (x + i2) * pdimc + c;
        float val2 = rInput2[indx2];

        // Loop over the relevant grid region and compute product sum
        for (int j = ymin; j <= ymax; ++j) {
            for (int i = xmin; i <= xmax; ++i) {
                int tindx = n * nOutputChannels * outputHeight * outputWidth + tc * outputHeight * outputWidth + j * outputWidth + i;
                prod_sum[tch_off] += gradOutput[tindx] * val2;
            }
        }
    }
    
    // Synchronize and reduce results
    __syncthreads();
    if(tch_off == 0) {
        float reduce_sum = 0;
        for(int idx = 0; idx < CUDA_NUM_THREADS; idx++) {
            reduce_sum += prod_sum[idx];
        }
        const int indx1 = n * nInputChannels * inputHeight * inputWidth + c * inputHeight * inputWidth + (y - pad_size) * inputWidth + (x - pad_size);
        gradInput1[indx1] = reduce_sum / nelems;
    }
}