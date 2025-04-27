#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_memory_kernel(int *d_go_to_state, unsigned int *d_failure_state, unsigned int *d_output_state, unsigned char *d_text, unsigned int *d_out, size_t pitch, int m, int n, int p_size, int alphabet, int num_blocks ) {

    // Calculate unique global thread index.
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int effective_pitch = pitch / sizeof (int);

    int chars_per_block = n / num_blocks;

    int start_block = blockIdx.x * chars_per_block;
    int stop_block = min(n, start_block + chars_per_block); // Ensure bounds safety

    int chars_per_thread = (stop_block - start_block + blockDim.x - 1) / blockDim.x; // Ensure full coverage

    int start_thread = start_block + chars_per_thread * threadIdx.x;
    int stop_thread = min(n, start_thread + chars_per_thread + m - 1); // Ensure bounds safety

    int r = 0, s;

    for (int column = start_thread; (column < stop_thread && column < n); column++) {

        // Follow failure links until a valid goto state is found.
        while ((s = d_go_to_state[r * effective_pitch + (d_text[column] - (unsigned char)'A')]) == -1)
            r = d_failure_state[r];
        r = s;

        // Accumulate results for this thread.
        d_out[idx] += d_output_state[r];
    }
}