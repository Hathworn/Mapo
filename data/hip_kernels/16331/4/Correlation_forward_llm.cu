#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Correlation_forward(float *output, int nOutputChannels, int outputHeight, int outputWidth, float *rInput1, int nInputChannels, int inputHeight, int inputWidth, float *rInput2, int pad_size, int kernel_size, int max_displacement, int stride1, int stride2) {

    int pInputWidth = inputWidth + 2 * pad_size;
    int pInputHeight = inputHeight + 2 * pad_size;

    int kernel_rad = (kernel_size - 1) / 2;
    int displacement_rad = max_displacement / stride2;
    int displacement_size = 2 * displacement_rad + 1;

    int n  = blockIdx.x;
    int base_y1 = blockIdx.y * stride1 + max_displacement + kernel_rad;
    int base_x1 = blockIdx.z * stride1 + max_displacement + kernel_rad;
    int c = threadIdx.x;

    int pdimyxc = pInputHeight * pInputWidth * nInputChannels;
    int pdimxc = pInputWidth * nInputChannels;
    int pdimc = nInputChannels;

    int tdimcyx = nOutputChannels * outputHeight * outputWidth;
    int tdimyx = outputHeight * outputWidth;
    int tdimx = outputWidth;

    float nelems = kernel_size * kernel_size * pdimc;

    __shared__ float prod_sum[BLOCK_SIZE_X];
    prod_sum[c] = 0.0f;  // Initialize shared memory

    // Parallelize over the elements in the displacement window
    for (int tj = -displacement_rad; tj <= displacement_rad; ++tj) {
        int y2 = base_y1 + tj * stride2;
        for (int ti = -displacement_rad; ti <= displacement_rad; ++ti) {
            int x2 = base_x1 + ti * stride2;

            float sum = 0.0f;
            // Parallelize over the kernel region
            for (int j = -kernel_rad; j <= kernel_rad; ++j) {
                for (int i = -kernel_rad; i <= kernel_rad; ++i) {
                    int indx1_base = n * pdimyxc + (base_y1 + j) * pdimxc + (base_x1 + i) * pdimc;
                    int indx2_base = n * pdimyxc + (y2 + j) * pdimxc + (x2 + i) * pdimc;

                    for (int ch = c; ch < pdimc; ch += BLOCK_SIZE_X) {
                        sum += rInput1[indx1_base + ch] * rInput2[indx2_base + ch];
                    }
                }
            }

            prod_sum[c] = sum;

            // Accumulate with reduction
            __syncthreads();
            if (c == 0) {
                float reduce_sum = 0;
                for (int index = 0; index < BLOCK_SIZE_X; ++index) {
                    reduce_sum += prod_sum[index];
                }
                int tc = (tj + displacement_rad) * displacement_size + (ti + displacement_rad);
                const int tindx = n * tdimcyx + tc * tdimyx + blockIdx.y * tdimx + blockIdx.z;
                output[tindx] = reduce_sum / nelems;
            }
            __syncthreads();
        }
    }
}
```
