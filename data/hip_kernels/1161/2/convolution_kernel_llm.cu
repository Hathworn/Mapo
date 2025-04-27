#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution_kernel(unsigned char *input_img, unsigned char *output_img, int height, int width)
{
    __shared__ unsigned char input_shared[W][W]; //Shared Memory required for a tile and its halo elements(3 channels)

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int output_row = blockIdx.x * TILE_WIDTH + tx;
    int output_col = blockIdx.y * TILE_WIDTH + ty;
    int input_row = output_row - MASK_WIDTH / 2;
    int input_col = output_col - MASK_WIDTH / 2;
    int global_idx = (input_row * width + input_col) * 3;

    for (int chan = 0; chan < 3; chan++) // 3 Channel Image
    {
        // Load input data into shared memory with boundary checks
        if (input_row >= 0 && input_row < height && input_col >= 0 && input_col < width) {
            input_shared[tx][ty] = input_img[global_idx + chan];
        } else {
            input_shared[tx][ty] = 0;
        }
        __syncthreads();

        // Only perform convolution on valid output pixels
        if (tx < TILE_WIDTH && ty < TILE_WIDTH && output_row < height && output_col < width) {
            int freq[256] = {0}; // Initialize frequency array

            // Calculate histogram for median filter
            for (int i = 0; i < MASK_WIDTH; i++) {
                for (int j = 0; j < MASK_WIDTH; j++) {
                    freq[input_shared[tx + i][ty + j]]++;
                }
            }

            // Find median
            int median = 0, sum = 0;
            for (int i = 0; i < 256; i++) {
                sum += freq[i];
                if (sum > (MASK_WIDTH * MASK_WIDTH) / 2) {
                    median = i;
                    break;
                }
            }
            
            // Store the median to the output image
            output_img[(output_row * width + output_col) * 3 + chan] = median;
        }
        __syncthreads();
    }
}