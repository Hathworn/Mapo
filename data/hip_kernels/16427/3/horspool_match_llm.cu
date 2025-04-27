#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void horspool_match(char* text, char* pattern, int* shift_table, unsigned int* num_matches, int chunk_size, int num_chunks, int text_size, int pat_len, unsigned int* d_output) {
    extern __shared__ int s[];

    int count = 0;
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    if (myId >= num_chunks) { // Use '>=' to ensure correct range checking
        return;
    }

    int text_start = myId * chunk_size; // Calculate start for this thread
    int text_length = text_start + chunk_size + pat_len - 1;

    // Use local register variable for text index
    int i = text_start + pat_len - 1;
    int k = 0;
    while (i < text_length && i < text_size) { // Combine boundary checks
        k = 0;
        while (k <= pat_len - 1 && pattern[pat_len - 1 - k] == text[i - k]) {
            k++;
        }
        if (k == pat_len) {
            ++count;
            i++; // Increment pointer by 1
        } else {
            i = i + shift_table[text[i]];
        }
    }

    // Store counts in shared memory
    s[threadIdx.x] = count;
    __syncthreads();

    // Use thread 0 to perform block-wide reduction
    if (threadIdx.x == 0) {
        int sum = 0;
        for (int idx = 0; idx < blockDim.x; idx++) { // Use blockDim for loop bound
            sum += s[idx];
        }
        d_output[blockIdx.x] = sum;
    }
}