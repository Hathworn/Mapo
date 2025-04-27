#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_256_OuterProduct_256(float *A, float *B, float *C) {
    int Tile = blockIdx.x, Part = blockIdx.y;
    int tX = threadIdx.x, tY = threadIdx.y;
    int c_input = tY * 256 + tX;
    int T_offset = (Tile << 12) + (Part << 11) + c_input;
    int B_offset = (Tile << 16) + c_input;

    extern __shared__ float shared_mem[];
    float *input = shared_mem;
    float *kernel = input + 2048;
    float *out = kernel + 8192;

    const int B_stride[32] = {
        0, 256, 512, 768, 1024, 1280, 1536, 1792, 
        2048, 2304, 2560, 2816, 3072, 3328, 3584, 3840, 
        4096, 4352, 4608, 4864, 5120, 5376, 5632, 5888, 
        6144, 6400, 6656, 6912, 7168, 7424, 7680, 7936
    };

    // Zero out partial results
    out[c_input] = 0.0f;
    out[c_input + 1024] = 0.0f;

    // Load inputs from global memory
    input[c_input] = A[T_offset];
    input[c_input + 1024] = A[T_offset + 1024];

    #pragma unroll
    for (int k = 0; k < 8; k++) {
        int B_start = B_offset + (k << 13);

        // Load kernel values from global memory
        #pragma unroll
        for (int i = 0; i < 8; ++i) {
            kernel[c_input + i * 1024] = B[B_start + i * 1024];
        }

        __syncthreads();

        float sum = 0, sum1 = 0;
        int y_tmp = (tY << 8) + (k << 5);
        int y_tmp1 = y_tmp + 1024;

        // Compute outer product
        #pragma unroll
        for (int j = 0; j < 32; j++) {
            float k_val = kernel[tX + B_stride[j]];
            sum += input[y_tmp + j] * k_val;
            sum1 += input[y_tmp1 + j] * k_val;
        }
        
        out[c_input] += sum;
        out[c_input + 1024] += sum1;

        __syncthreads();
    }

    // Store results to global memory
    C[T_offset] = out[c_input];
    C[T_offset + 1024] = out[c_input + 1024];
}