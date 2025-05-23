#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Correlation_forward(float *output, int nOutputChannels, int outputHeight, int outputWidth, 
                                    float *rInput1, int nInputChannels, int inputHeight, int inputWidth, 
                                    float *rInput2, int pad_size, int kernel_size, int max_displacement, 
                                    int stride1, int stride2) {
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
    
    // Optimize shared memory use by only initializing needed elements
    prod_sum[c] = 0;

    // element-wise product along channel axis
    for (int tj = -displacement_rad; tj <= displacement_rad; ++tj) {
        for (int ti = -displacement_rad; ti <= displacement_rad; ++ti) {
            int x2 = x1 + ti * stride2;
            int y2 = y1 + tj * stride2;
            
            for (int j = -kernel_rad; j <= kernel_rad; ++j) {
                for (int i = -kernel_rad; i <= kernel_rad; ++i) {
                    for (int ch = c; ch < pdimc; ch += THREADS_PER_BLOCK) {
                        int indx1 = n * pdimyxc + (y1 + j) * pdimxc + (x1 + i) * pdimc + ch;
                        int indx2 = n * pdimyxc + (y2 + j) * pdimxc + (x2 + i) * pdimc + ch;
                        
                        prod_sum[c] += rInput1[indx1] * rInput2[indx2];
                    }
                }
            }
            
            // Use built-in warp shuffle for reduction
            __syncthreads();
            if (c < 32) {
                for (int offset = 32 / 2; offset > 0; offset /= 2) {
                    prod_sum[c] += __shfl_down_sync(0xFFFFFFFF, prod_sum[c], offset);
                }
            }
            
            if (c == 0) {
                float reduce_sum = prod_sum[0]; 
                int tc = (tj + displacement_rad) * displacement_size + (ti + displacement_rad);
                const int tindx = n * tdimcyx + tc * tdimyx + blockIdx.y * tdimx + blockIdx.z;
                output[tindx] = reduce_sum / nelems;
            }
            __syncthreads();
        }
    }
}
```
