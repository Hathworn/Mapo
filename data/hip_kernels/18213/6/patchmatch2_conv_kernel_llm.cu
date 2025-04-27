#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 0.1

#undef MIN
#define MIN(a, b) ((a) < (b) ? (a) : (b))

#undef MAX
#define MAX(a, b) ((a) > (b) ? (a) : (b))

__global__ void patchmatch2_conv_kernel( float *A, float *B, float *AP, float *BP, float *conv, int *prev_corrAB_upsampled, int patch, int s_rad, int c, int h, int w )
{
    int h1 = h, w1 = w;
    int _id = blockIdx.x * blockDim.x + threadIdx.x;
    int size1 = h * w;
    int s_size = 2 * s_rad + 1;
    int s_n = s_size * s_size;

    // Check within bounds
    if (_id >= size1 * s_n) return;
  
    conv[_id] = -1;

    int id1 = _id / s_n, s_idx = _id % s_n;
    int y1 = id1 / w1, x1 = id1 % w1;
    int dy2 = s_idx / s_size - s_rad, dx2 = s_idx % s_size - s_rad;

    int x2 = prev_corrAB_upsampled[2 * id1 + 0];
    int y2 = prev_corrAB_upsampled[2 * id1 + 1];

    int new_y2 = y2 + dy2;
    int new_x2 = x2 + dx2;

    // Boundary check
    if (new_x2 < 0 || new_x2 >= w1 || new_y2 < 0 || new_y2 >= h1) return;

    int kernel_radius = (patch - 1) / 2;
    float conv_result = 0.0f;
    int cnt = 0;

    for (int dy = -kernel_radius; dy <= kernel_radius; dy++) {
        for (int dx = -kernel_radius; dx <= kernel_radius; dx++) {
            int xx1 = x1 + dx, yy1 = y1 + dy;
            int xx2 = new_x2 + dx, yy2 = new_y2 + dy;
            if (xx1 >= 0 && xx1 < w1 && yy1 >= 0 && yy1 < h1 &&
                xx2 >= 0 && xx2 < w1 && yy2 >= 0 && yy2 < h1)
            {
                int _id1 = yy1 * w1 + xx1, _id2 = yy2 * w1 + xx2;
                
                // Loop unrolling and memory coalescing
                #pragma unroll
                for (int dc = 0; dc < c; dc++) {
                    float term1A = A[dc * size1 + _id1];
                    float term1B = B[dc * size1 + _id2];
                    conv_result += term1A * term1B;

                    float term2A = AP[dc * size1 + _id1];
                    float term2B = BP[dc * size1 + _id2];
                    conv_result += term2A * term2B;
                }
                cnt++;
            }
        }
    }

    // Avoid division by zero
    if (cnt > 0)
        conv[_id] = conv_result / static_cast<float>(cnt);
}