#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

__global__ void int_bubble_filter(int* input, const int* vec1, int* output, const int count) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int offset = 2 * tid;
    if (offset < count) {
        // Initialize the output with vec1
        output[offset] = vec1[offset];
        output[offset + 1] = vec1[offset + 1];

        bool k;
        for (int n = 0; n < count; ++n) {
            k = n % 2;
            int i = offset + k;
            if (i + 1 < count) {
                if (!input[i] && input[i + 1]) {
                    // Swap elements
                    input[i] = 1;
                    input[i + 1] = 0;
                    output[i] = output[i + 1];
                    output[i + 1] = 0;
                }
                else {
                    // Clear output if needed
                    if (!input[i]) output[i] = 0;
                    if (!input[i + 1]) output[i + 1] = 0;
                }
            }
            __syncthreads();  // Synchronize threads
        }
    }
}

#ifdef __cplusplus
}
#endif