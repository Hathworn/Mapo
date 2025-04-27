#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to perform 2D filtering using shared memory
__global__ void cuda_filter2D(float *dst, float *src, float *kernel, int src_width, int src_height, int kernel_rows, int kernel_cols)
{
    // Calculate row and column indices
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int col = threadIdx.x + blockIdx.x * blockDim.x;

    // Allocate shared memory for the input tile and kernel
    extern __shared__ float sharedMem[];
    float *sharedSrc = sharedMem;
    float *sharedKernel = &sharedMem[blockDim.x * blockDim.y];

    // Load kernel into shared memory
    for(int i = threadIdx.y; i < kernel_rows * kernel_cols; i += blockDim.y)
    {
        sharedKernel[i] = kernel[i];
    }
    __syncthreads();

    // Check if within bounds
    if(row < src_height && col < src_width)
    {
        float sum = 0;

        // Calculate start points
        int rowOffset = row - (kernel_rows - 1) / 2;
        int colOffset = col - (kernel_cols - 1) / 2;

        // Iterate over the kernel
        for(int i = 0; i < kernel_rows; i++)
        {
            for(int j = 0; j < kernel_cols; j++)
            {
                int curRow = rowOffset + i;
                int curCol = colOffset + j;

                // Bounds check
                if(curRow >= 0 && curRow < src_height && curCol >= 0 && curCol < src_width)
                {
                    sum += sharedKernel[i * kernel_cols + j] * src[curRow * src_width + curCol];
                }
            }
        }

        // Store the result with clamping
        dst[row * src_width + col] = fmaxf(0.0f, fminf(255.0f, sum));

        #ifdef debug
        printf("filter2D: dst[%d] = %f\n", row * src_width + col, dst[row * src_width + col]);
        #endif
    }
}