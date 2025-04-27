#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NmDistanceKernel(int b, int n, const float * xyz, int m, const float * xyz2, float * result, int * result_i) {
    const int batch = 512;
    __shared__ float buf[batch * 2];

    for (int i = blockIdx.x; i < b; i += gridDim.x) {
        for (int k2 = 0; k2 < m; k2 += batch) {
            int end_k = min(m, k2 + batch) - k2;

            // Load xyz2 data into shared memory
            for (int j = threadIdx.x; j < end_k * 2; j += blockDim.x) {
                buf[j] = xyz2[(i * m + k2) * 2 + j];
            }
            __syncthreads();

            for (int j = threadIdx.x + blockIdx.y * blockDim.x; j < n; j += blockDim.x * gridDim.y) {
                float x1 = xyz[(i * n + j) * 2 + 0];
                float y1 = xyz[(i * n + j) * 2 + 1];
                float best = FLT_MAX;  // Initialize with maximum float value
                int best_i = 0;

                // Unroll loop to improve performance
                int k;
                for (k = 0; k <= end_k - 4; k += 4) {
                    #pragma unroll
                    for (int offset = 0; offset < 4; ++offset) {
                        float x2 = buf[(k + offset) * 2 + 0] - x1;
                        float y2 = buf[(k + offset) * 2 + 1] - y1;
                        float d = x2 * x2 + y2 * y2;
                        if (d < best) {
                            best = d;
                            best_i = k + offset + k2;
                        }
                    }
                }

                // Handle remaining elements
                for (; k < end_k; ++k) {
                    float x2 = buf[k * 2 + 0] - x1;
                    float y2 = buf[k * 2 + 1] - y1;
                    float d = x2 * x2 + y2 * y2;
                    if (d < best) {
                        best = d;
                        best_i = k + k2;
                    }
                }

                // Update the result if necessary
                int result_idx = i * n + j;
                if (k2 == 0 || result[result_idx] > best) {
                    result[result_idx] = best;
                    result_i[result_idx] = best_i;
                }
            }
            __syncthreads();
        }
    }
}