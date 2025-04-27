#include "hip/hip_runtime.h"
#include "includes.h"

#define CUDA_CHECK_ERROR

#define CudaSafeCall(err) __CudaSafeCall(err, __FILE__, __LINE__)
#define CudaCheckError() __CudaCheckError(__FILE__, __LINE__)

__global__ void transform_image(float *input, const float *raw_input, const int width, const int channels)
{
    int thread_id = blockDim.x * blockIdx.x + threadIdx.x;
    int start_i = thread_id / width - 1;
    int start_j = thread_id % width - 1;
    int per_channel_width = width * width;
    int hidden_width = 3 * 3 * channels + 1;
    int global_offset = thread_id * hidden_width;

    // Unroll the loop for better performance and reduce branching
    #pragma unroll
    for (int c = 0; c < channels; c++) {
        int offset = 0;
        for (int i = start_i; i < start_i + 3; i++) {
            bool valid_i = (i >= 0 && i < width); // Cache comparison result
            for (int j = start_j; j < start_j + 3; j++) {
                if (valid_i && j >= 0 && j < width) { // Use cached result
                    input[global_offset + c * 9 + offset] = raw_input[c * per_channel_width + i * width + j];
                }
                offset++;
            }
        }
    }
    input[(thread_id + 1) * hidden_width - 1] = 1;
}