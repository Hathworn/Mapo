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
    // Calculate thread index
    int id1 = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;
    
    // Check if index is valid
    if (id1 < size) {
        // Check mask condition
        if (mask[id1] != 0) {
            int y2 = corrAB[2 * id1 + 1], x2 = corrAB[2 * id1 + 0];
            
            // Optimize loop using shared variables
            #pragma unroll
            for (int dx = -ring; dx <= ring; dx++) {
                #pragma unroll
                for (int dy = -ring; dy <= ring; dy++) {
                    int _x2 = x2 + dx, _y2 = y2 + dy;
                    
                    // Ensure coordinates are within bounds
                    if (_x2 >= 0 && _x2 < w && _y2 >= 0 && _y2 < h) {
                        // Update mask matrix
                        m[_y2 * w + _x2] = 1;
                    }
                }
            }
        }
    }
}