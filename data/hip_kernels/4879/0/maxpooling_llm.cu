#include "hip/hip_runtime.h"
#include "includes.h"

#define CUDA_CHECK_ERROR
#define CudaSafeCall(err) __CudaSafeCall(err, __FILE__, __LINE__)
#define CudaCheckError() __CudaCheckError(__FILE__, __LINE__)

__global__ void maxpooling(float *output, const float *input, const int width, const int channels)
{
    int thread_id = blockDim.x * blockIdx.x + threadIdx.x;
    int new_width = width / 2;
    
    // Calculate 2D coordinates directly to reduce redundant calculations
    int row = thread_id / new_width;
    int col = thread_id % new_width;
    
    // Calculate top-left corner index of the 2x2 window
    int i = row * 2;
    int j = col * 2;
    
    int index = i * width + j;
    
    for (int c = 0; c < channels; c++) {
        // Initialize max with the first element
        float max = input[index * channels + c];
        
        // Use fmaxf to simplify comparisons
        max = fmaxf(max, input[(index + 1) * channels + c]);
        max = fmaxf(max, input[(index + width) * channels + c]);
        max = fmaxf(max, input[(index + width + 1) * channels + c]);
        
        output[thread_id * channels + c] = max;
    }
}