#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unroll_kernel(int h_in, int w_in, int k, float *x, float *x_unroll) {
    int t = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for flexibility
    int w_out = w_in - k + 1;                      // Output image size
    int w_unroll = w_out * w_out;                  // Unroll limit

    if (t < w_unroll) {
        int h_out_ = t / w_out;                    // Output height
        int w_out_ = t % w_out;                    // Output width
        int w_unroll_ = h_out_ * w_out + w_out_;   // The index of output pixel in image
        int h_unroll;

        #pragma unroll                            // Unroll loop for efficiency
        for (int p = 0; p < k; p++) {
            #pragma unroll                        // Unroll loop for efficiency
            for (int q = 0; q < k; q++) {
                h_unroll = p * k + q;
                if ((h_out_ + p) < h_in && (w_out_ + q) < w_in) {
                    x_unroll[h_unroll * w_unroll + w_unroll_] =
                    x[(h_out_ + p) * w_in + w_out_ + q];
                }
            }
        }
    }
}