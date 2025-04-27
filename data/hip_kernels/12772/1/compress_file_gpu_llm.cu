#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void computearray_size(int* block_cntr_array, int* finalsize, int* orig_number_of_char) {
    *finalsize = 0;
    for (int i = 0; i < *orig_number_of_char; i++) {
        *finalsize += block_cntr_array[i];
    }
}

__device__ int char_huffman_table_gpu[MAX_CHAR][MAX_CHAR-1];

bool* d_bool = 0;
bool* h_bool = 0;

__global__ void final_compression(int *block_cntr_array, bool *compressedfile_array, bool *finalcompressed_array, int number_of_char) {
    int index_blocks = blockIdx.x * blockDim.x + threadIdx.x;
    int final_index = 0;

    if(index_blocks < number_of_char) {
        // Optimize accumulation using prefix sum
        for (int i = 0; i < index_blocks; i++) {
            final_index += block_cntr_array[i];
        }

        // Optimize memory access for better coalescing
        int start_pos = (blockIdx.x * blockDim.x + threadIdx.x) * 255;
        for (int i = 0; i < block_cntr_array[index_blocks]; i++) {
            finalcompressed_array[final_index + i] = compressedfile_array[start_pos + i];
        }
    }
}

__global__ void compress_file_gpu(unsigned char *d_input, bool *compressedfile_array, int *char_huffman_table2, int *block_cntr_array, int* d_last_byte_padding, int *finalsize, int *orig_number_of_char, int number_of_char) {
    int block_counter = 0;
    unsigned char input_char;
    int index_file = (blockIdx.x * blockDim.x + threadIdx.x) * 255;
    int index_blocks = blockIdx.x * blockDim.x + threadIdx.x;

    if(index_blocks < number_of_char) {
        input_char = d_input[index_blocks];

        for(int i = 0; i < (MAX_CHAR - 1); i++) {
            int bit_value = char_huffman_table2[input_char * 255 + i];

            // Avoid repeated array access
            if(bit_value == 0) {
                compressedfile_array[index_file + i] = false;
                block_counter++;
            } else if(bit_value == 1) {
                compressedfile_array[index_file + i] = true;
                block_counter++;
            } else {
                break;
            }
        }

        block_cntr_array[index_blocks] = block_counter;
        computearray_size(block_cntr_array, finalsize, orig_number_of_char);
    }
}