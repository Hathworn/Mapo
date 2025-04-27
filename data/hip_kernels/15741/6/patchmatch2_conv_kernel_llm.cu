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
    int _id = blockIdx.x * blockDim.x + threadIdx.x;
    int size1 = h * w;
    int s_size = 2 * s_rad + 1;
    int s_n = s_size * s_size;

    if (_id < size1 * s_n) {
        conv[_id] = -1;

        int id1 = _id / s_n, s_idx = _id % s_n;
        int y1 = id1 / w, x1 = id1 % w;
        int dy2 = s_idx / s_size - s_rad, dx2 = s_idx % s_size - s_rad;

        int x2 = prev_corrAB_upsampled[2 * id1 + 0];
        int y2 = prev_corrAB_upsampled[2 * id1 + 1];

        int new_y2 = y2 + dy2;
        int new_x2 = x2 + dx2;
        if (!(new_x2 >= 0 && new_x2 < w && new_y2 >= 0 && new_y2 < h)) {
            return;
        }

        // Utilize shared memory for accessing data in a block
        __shared__ float sharedA[TB];
        __shared__ float sharedB[TB];
        __shared__ float sharedAP[TB];
        __shared__ float sharedBP[TB];

        int kernel_radius = (patch - 1) / 2;
        float conv_result = 0;
        int cnt = 0;

        for (int dy = -kernel_radius; dy <= kernel_radius; dy++) {
            for (int dx = -kernel_radius; dx <= kernel_radius; dx++) {
                int xx1 = x1 + dx, yy1 = y1 + dy;
                int xx2 = new_x2 + dx, yy2 = new_y2 + dy;
                if (0 <= xx1 && xx1 < w && 0 <= yy1 && yy1 < h &&
                    0 <= xx2 && xx2 < w && 0 <= yy2 && yy2 < h)
                {
                    int _id1 = yy1 * w + xx1, _id2 = yy2 * w + xx2;
                    for (int dc = 0; dc < c; dc++) {
                        // Assign shared memory variables
                        int sharedIdx = threadIdx.x;
                        sharedA[sharedIdx] = A[dc * size1 + _id1];
                        sharedB[sharedIdx] = B[dc * size1 + _id2];
                        sharedAP[sharedIdx] = AP[dc * size1 + _id1];
                        sharedBP[sharedIdx] = BP[dc * size1 + _id2];

                        __syncthreads(); // Ensure all threads have loaded data

                        conv_result += sharedA[sharedIdx] * sharedB[sharedIdx];
                        conv_result += sharedAP[sharedIdx] * sharedBP[sharedIdx];
                    }
                    cnt++;
                }
            }
        }

        if (cnt > 0)
            conv[_id] = conv_result / cnt;
    }
    return;
}