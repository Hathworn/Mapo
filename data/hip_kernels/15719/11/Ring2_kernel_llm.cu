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

__global__ void Ring2_kernel(float *A, float *BP, int *corrAB, int *mask, int *m, int ring, int c, int h, int w)
{
    int id1 = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;
    if (id1 < size && mask[id1] != 0) {  // Combine conditions for early exit
        int y2 = corrAB[2 * id1 + 1], x2 = corrAB[2 * id1 + 0];
        
        for (int dy = -ring; dy <= ring; dy++) {
            int _y2 = y2 + dy;
            if (_y2 >= 0 && _y2 < h) {  // Pre-check y-boundary condition
                for (int dx = -ring; dx <= ring; dx++) {
                    int _x2 = x2 + dx;
                    if (_x2 >= 0 && _x2 < w) {  // Check x-boundary condition
                        m[_y2 * w + _x2] = 1;  // Update m only when both conditions are satisfied
                    }
                }
            }
        }
    }

    return;
}