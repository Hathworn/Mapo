#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __host__ static inline uint8_t xnor_bit1(uint8_t a, uint8_t b) {
    return ~(a^b) & 0b1;
}

__device__ __host__ static inline unsigned char get_bit(unsigned char const* const src, size_t index) {
    size_t src_i = index / 8;
    int src_shift = index % 8;
    unsigned char val = (src[src_i] & (1 << src_shift)) > 0;
    return val;
}

__global__ void convolve_bin_gpu_kernel(float *input, float *weights, float *output, int in_w, int in_h, int in_c, int n, int size, int pad, int new_lda, float *mean_arr_gpu)
{
    int index = blockIdx.x*blockDim.x + threadIdx.x;
    int x = index % in_w;
    int index2 = index / in_w;
    int y = index2 % in_h;
    int fil = index2 / in_h;

    __shared__ uint32_t weights_shared[3*3*1024*6/32 + 1];
    __shared__ uint32_t input_shared[416*416/32 + 1];

    int weights_size = size*size*in_c / 32 + 1;
    int input_shared_size = in_w*in_h / 32 + 1;

    int min_index = blockIdx.x*blockDim.x;
    int min_fil = (min_index / in_w) / in_h;
    int max_index = (blockIdx.x+1)*blockDim.x - 1;
    int max_fil = (max_index / in_w) / in_h;

    for (int tmp_fil = min_fil; tmp_fil <= max_fil; tmp_fil++) {
        for (int s = threadIdx.x; s < weights_size; s += blockDim.x) {
            weights_shared[s + (tmp_fil - min_fil)*new_lda/32] = ((uint32_t *)weights)[tmp_fil*new_lda / 32 + s];
        }
    }
    __syncthreads();  // Sync threads after loading weights into shared memory

    for (int chan = 0; chan < in_c; ++chan)
    {
        int input_pre_index = chan*in_w*in_h;
        int add_input_index = input_pre_index % 32;

        for (int s = threadIdx.x; s < input_shared_size; s += blockDim.x) {
            input_shared[s] = ((uint32_t *)input)[input_pre_index / 32 + s];
        }
        __syncthreads();  // Sync threads after loading input into shared memory

        if (fil < n) 
        {
            int sum = 0;
            int good_val = 0;
            int output_index = fil*in_w*in_h + y*in_w + x;
            
            for (int f_y = 0; f_y < size; ++f_y) {
                int input_y = y + f_y - pad;
                if (input_y < 0 || input_y >= in_h) continue;  // Skip invalid indices

                for (int f_x = 0; f_x < size; ++f_x) {
                    int input_x = x + f_x - pad;
                    if (input_x < 0 || input_x >= in_w) continue;  // Skip invalid indices

                    int weights_shared_index = (fil - min_fil)*new_lda + chan*size*size + f_y*size + f_x;
                    uint8_t w_bit = get_bit((uint8_t *)weights_shared, weights_shared_index);

                    int input_shared_index = input_y*in_w + input_x + add_input_index;
                    uint8_t in_bit = get_bit((uint8_t *)input_shared, input_shared_index);

                    int res = xnor_bit1(in_bit, w_bit);
                    sum += res;
                    good_val++;
                }
            }
            sum = sum - (good_val - sum);
            atomicAdd(&output[output_index], sum * mean_arr_gpu[fil]);
        }
    }
}