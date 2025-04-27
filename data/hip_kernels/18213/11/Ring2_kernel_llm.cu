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

__global__ void Ring2_kernel( float *A, float *BP, int *corrAB, int *mask, int *m, int ring, int c, int h, int w )
{
    int id1 = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;

    if (id1 < size && mask[id1] != 0) {
        int y2 = corrAB[2 * id1 + 1], x2 = corrAB[2 * id1];
        int start_x = MAX(0, x2 - ring), end_x = MIN(w - 1, x2 + ring);
        int start_y = MAX(0, y2 - ring), end_y = MIN(h - 1, y2 + ring);

        // Unroll the inner loops for better performance
        for (int _x2 = start_x; _x2 <= end_x; ++_x2) {
            for (int _y2 = start_y; _y2 <= end_y; ++_y2) {
                m[_y2 * w + _x2] = 1;
            }
        }
    }
}
