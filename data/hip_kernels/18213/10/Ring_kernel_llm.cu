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

__global__ void Ring_kernel(float *A, float *BP, int *corrAB, float *M, int ring, int c, int h, int w)
{
    int id1 = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;
    int ringSize = 2 * ring + 1;
    int ringPatch = ringSize * ringSize;

    if (id1 < size) {
        int y1 = id1 / w, x1 = id1 % w;
        int y2 = corrAB[2 * id1 + 1], x2 = corrAB[2 * id1 + 0];

        for (int dx = -ring; dx <= ring; dx++) {
            for (int dy = -ring; dy <= ring; dy++) {
                int pIdx = (dy + ring) * ringSize + (dx + ring);
                int _x2 = x2 + dx, _y2 = y2 + dy;

                // Optimize to reduce redundant computations
                if (_x2 >= 0 && _x2 < w && _y2 >= 0 && _y2 < h) {
                    int M_index_base = (y1 * w) * ringPatch + pIdx * w + x1;
                    int BP_index_base = _y2 * w + _x2;
                    for (int dc = 0; dc < c; dc++) {
                        int dc_size = dc * size;
                        M[dc_size + M_index_base] = BP[dc_size + BP_index_base];
                    }
                }
            }
        }
    }
    return;
}