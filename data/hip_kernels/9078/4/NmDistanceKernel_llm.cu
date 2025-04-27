#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NmDistanceKernel(int b, int n, const float *xyz, int m, const float *xyz2, float *result, int *result_i) {
    const int batch = 512;
    __shared__ float buf[batch * 3];

    for (int i = blockIdx.x; i < b; i += gridDim.x) {
        for (int k2 = 0; k2 < m; k2 += batch) {
            int end_k = min(m, k2 + batch) - k2;

            // Load batch of xyz2 into shared memory
            for (int j = threadIdx.x; j < end_k * 3; j += blockDim.x) {
                buf[j] = xyz2[(i * m + k2) * 3 + j];
            }
            __syncthreads();

            // Parallelize over the `n` dimensions
            for (int j = threadIdx.x + blockIdx.y * blockDim.x; j < n; j += blockDim.x * gridDim.y) {
                float x1 = xyz[(i * n + j) * 3 + 0];
                float y1 = xyz[(i * n + j) * 3 + 1];
                float z1 = xyz[(i * n + j) * 3 + 2];
                int best_i = 0;
                float best = FLT_MAX;

                // Unroll 4 times
                for (int k = 0; k < end_k; k += 4) {
                    if (k + 0 < end_k) { // Check boundary for unrolling
                        float x2 = buf[(k + 0) * 3 + 0] - x1;
                        float y2 = buf[(k + 0) * 3 + 1] - y1;
                        float z2 = buf[(k + 0) * 3 + 2] - z1;
                        float d = x2 * x2 + y2 * y2 + z2 * z2;
                        if (d < best) {
                            best = d;
                            best_i = k + k2;
                        }
                    }
                    if (k + 1 < end_k) {
                        float x2 = buf[(k + 1) * 3 + 0] - x1;
                        float y2 = buf[(k + 1) * 3 + 1] - y1;
                        float z2 = buf[(k + 1) * 3 + 2] - z1;
                        float d = x2 * x2 + y2 * y2 + z2 * z2;
                        if (d < best) {
                            best = d;
                            best_i = k + k2 + 1;
                        }
                    }
                    if (k + 2 < end_k) {
                        float x2 = buf[(k + 2) * 3 + 0] - x1;
                        float y2 = buf[(k + 2) * 3 + 1] - y1;
                        float z2 = buf[(k + 2) * 3 + 2] - z1;
                        float d = x2 * x2 + y2 * y2 + z2 * z2;
                        if (d < best) {
                            best = d;
                            best_i = k + k2 + 2;
                        }
                    }
                    if (k + 3 < end_k) {
                        float x2 = buf[(k + 3) * 3 + 0] - x1;
                        float y2 = buf[(k + 3) * 3 + 1] - y1;
                        float z2 = buf[(k + 3) * 3 + 2] - z1;
                        float d = x2 * x2 + y2 * y2 + z2 * z2;
                        if (d < best) {
                            best = d;
                            best_i = k + k2 + 3;
                        }
                    }
                }

                if (k2 == 0 || result[i * n + j] > best) {
                    result[i * n + j] = best;
                    result_i[i * n + j] = best_i;
                }
            }
            __syncthreads();
        }
    }
}