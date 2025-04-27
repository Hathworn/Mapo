#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NmDistanceKernel(int b, int n, const float *xyz, int m, const float *xyz2, float *result, int *result_i) {
    const int batch = 512;
    __shared__ float buf[batch * 3];

    // Loop over batches
    for (int i = blockIdx.x; i < b; i += gridDim.x) {
        for (int k2 = 0; k2 < m; k2 += batch) {
            // Load current batch into shared memory
            int end_k = min(m, k2 + batch) - k2;
            for (int j = threadIdx.x; j < end_k * 3; j += blockDim.x) {
                buf[j] = xyz2[(i * m + k2) * 3 + j];
            }
            __syncthreads();

            // Compute distances for each point
            for (int j = threadIdx.x + blockIdx.y * blockDim.x; j < n; j += blockDim.x * gridDim.y) {
                float x1 = xyz[(i * n + j) * 3 + 0];
                float y1 = xyz[(i * n + j) * 3 + 1];
                float z1 = xyz[(i * n + j) * 3 + 2];
                int best_i = 0;
                float best = INFINITY;  // Use INFINITY for initialization for better numerical safety

                // Loop unrolling for batch calculations
                int end_ka = end_k - (end_k & 3);
                for (int k = 0; k < end_ka; k += 4) {
                    #pragma unroll
                    for (int offset = 0; offset < 4; ++offset) {
                        float x2 = buf[(k + offset) * 3 + 0] - x1;
                        float y2 = buf[(k + offset) * 3 + 1] - y1;
                        float z2 = buf[(k + offset) * 3 + 2] - z1;
                        float d = x2 * x2 + y2 * y2 + z2 * z2;
                        if (k == 0 || d < best) {
                            best = d;
                            best_i = k + offset + k2;
                        }
                    }
                }

                // Handle the remaining cases if any
                for (int k = end_ka; k < end_k; k++) {
                    float x2 = buf[k * 3 + 0] - x1;
                    float y2 = buf[k * 3 + 1] - y1;
                    float z2 = buf[k * 3 + 2] - z1;
                    float d = x2 * x2 + y2 * y2 + z2 * z2;
                    if (d < best) {
                        best = d;
                        best_i = k + k2;
                    }
                }

                // Update result only if the current best is better
                if (k2 == 0 || result[(i * n + j)] > best) {
                    result[(i * n + j)] = best;
                    result_i[(i * n + j)] = best_i;
                }
            }
            __syncthreads();
        }
    }
}