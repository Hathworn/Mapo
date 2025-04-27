#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blur(float *input, float *output, int height, int width)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < height && y < width)
    {
        for (int k = 0; k < 3; k++)
        {
            float sum = 0.0f;
            int count = 0;
            // Use shared memory and loop unrolling for optimization
            __shared__ float input_shared[BLOCK_SIZE_X][BLOCK_SIZE_Y + 2 * BLUR_SIZE];
            
            // Load data into shared memory
            for (int i = -BLUR_SIZE; i <= BLUR_SIZE; i += BLOCK_SIZE_Y)
            {
                for (int j = -BLUR_SIZE; j <= BLUR_SIZE; j += BLOCK_SIZE_X)
                {
                    int shared_x = threadIdx.x + j;
                    int shared_y = threadIdx.y + i;

                    if (shared_x >= 0 && shared_x < width && shared_y >= 0 && shared_y < height)
                    {
                        input_shared[threadIdx.x + BLUR_SIZE][threadIdx.y + BLUR_SIZE] = input[3 * ((shared_y + x) * width + (shared_x + y)) + k];
                    }
                }
            }
            __syncthreads();
            
            // Compute blur using shared memory
            for (int i = -BLUR_SIZE; i <= BLUR_SIZE; ++i)
            {
                for (int j = -BLUR_SIZE; j <= BLUR_SIZE; ++j)
                {
                    int shared_x = threadIdx.x + BLUR_SIZE + j;
                    int shared_y = threadIdx.y + BLUR_SIZE + i;
                    
                    if (shared_x >= 0 && shared_x < width && shared_y >= 0 && shared_y < height)
                    {
                        count++;
                        sum += input_shared[shared_x][shared_y];
                    }
                }
            }
            
            output[3 * (x * width + y) + k] = sum / count;
        }
    }
}