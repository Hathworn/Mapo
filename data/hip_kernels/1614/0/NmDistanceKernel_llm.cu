#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NmDistanceKernel(int b, int n, const float *xyz, int m, const float *xyz2, float *result, int *result_i) {
    const int batch = 512;
    __shared__ float buf[batch * 3];
    
    for (int i = blockIdx.x; i < b; i += gridDim.x) {
        for (int k2 = 0; k2 < m; k2 += batch) {
            int end_k = min(m, k2 + batch) - k2;
            
            for (int j = threadIdx.x; j < end_k * 3; j += blockDim.x) {
                buf[j] = xyz2[(i * m + k2) * 3 + j];
            }
            __syncthreads();
            
            for (int j = threadIdx.x + blockIdx.y * blockDim.x; j < n; j += blockDim.x * gridDim.y) {
                float x1 = xyz[(i * n + j) * 3 + 0];
                float y1 = xyz[(i * n + j) * 3 + 1];
                float z1 = xyz[(i * n + j) * 3 + 2];
                int best_i = 0;
                float best = FLT_MAX; // Initialize with maximum float value

                int end_ka = end_k - (end_k & 3);
                
                for (int k = 0; k < end_ka; k += 4) {
                    #pragma unroll 4 // Unroll loop for better performance
                    for (int x = 0; x < 4; ++x) {
                        float x2 = buf[(k + x) * 3 + 0] - x1;
                        float y2 = buf[(k + x) * 3 + 1] - y1;
                        float z2 = buf[(k + x) * 3 + 2] - z1;
                        float d = x2 * x2 + y2 * y2 + z2 * z2;
                        if (d < best) {
                            best = d;
                            best_i = k + k2 + x;
                        }
                    }
                }

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

                if (k2 == 0 || result[(i * n + j)] > best) {
                    result[(i * n + j)] = best;
                    result_i[(i * n + j)] = best_i;
                }
            }
            __syncthreads();
        }
    }
}