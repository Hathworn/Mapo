#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __host__ static inline uint8_t xnor_bit1(uint8_t a, uint8_t b) {
    return ~(a ^ b) & 0b1;
}

__device__ __host__ static inline unsigned char get_bit(unsigned char const* const src, size_t index) {
    size_t src_i = index / 8;
    int src_shift = index % 8;
    unsigned char val = (src[src_i] & (1 << src_shift)) > 0;
    return val;
}

__global__ void convolve_bin_gpu_kernel(float *input, float *weights, float *output, int in_w, int in_h, int in_c, int n, int size, int pad, int new_lda, float *mean_arr_gpu) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int x = index % in_w;
    int index2 = index / in_w;
    int y = index2 % in_h;
    int fil = index2 / in_h;

    if (fil < n) {
        int const output_index = fil * in_w * in_h + y * in_w + x;
        int sum = 0;
        int good_val = 0;
        
        for (int chan = 0; chan < in_c; ++chan) {
            int const weights_pre_index = fil * new_lda + chan * size * size;
            int const input_pre_index = chan * in_w * in_h;
            
            // Use shared memory for weights and inputs
            __shared__ uint8_t shared_weights[BLOCK_SIZE];
            __shared__ uint8_t shared_input[BLOCK_SIZE];

            // Efficient data reading into shared memory
            for (int f_y = 0; f_y < size; ++f_y) {
                int input_y = y + f_y - pad;
                for (int f_x = 0; f_x < size; ++f_x) {
                    int input_x = x + f_x - pad;
                    if (input_y < 0 || input_x < 0 || input_y >= in_h || input_x >= in_w) continue;

                    int input_index = input_pre_index + input_y * in_w + input_x;
                    int weights_index = weights_pre_index + f_y * size + f_x;

                    shared_input[threadIdx.x] = get_bit((uint8_t *)input, input_index);
                    shared_weights[threadIdx.x] = get_bit((uint8_t *)weights, weights_index);
                    __syncthreads();  // Synchronize to ensure all threads have read the necessary data

                    uint8_t in_bit = shared_input[threadIdx.x];
                    uint8_t w_bit = shared_weights[threadIdx.x];
                    int res = xnor_bit1(in_bit, w_bit);
                    sum += res;
                    good_val++;
                }
            }
        }
        sum = sum - (good_val - sum);
        output[output_index] = sum * mean_arr_gpu[fil];
    }
}