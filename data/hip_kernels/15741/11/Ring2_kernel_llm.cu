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
        int y2 = corrAB[2 * id1 + 1], x2 = corrAB[2 * id1 + 0];
        int x_start = MAX(x2 - ring, 0);
        int x_end = MIN(x2 + ring, w - 1);
        int y_start = MAX(y2 - ring, 0);
        int y_end = MIN(y2 + ring, h - 1);

        for (int dx = x_start; dx <= x_end; dx++)
            for (int dy = y_start; dy <= y_end; dy++)
                m[dy * w + dx] = 1;
    }
}