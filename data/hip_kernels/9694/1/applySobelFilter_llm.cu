#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

#define GAUSS_WIDTH 5
#define SOBEL_WIDTH 3

typedef struct images {
    char *pType;
    int width;
    int height;
    int maxValColor;
    unsigned char *data;
} image;

__global__ void applySobelFilter(unsigned char *in, unsigned char *intensity, float *direction, int ih, int iw) {
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    // Check bounds once to avoid repeating checks
    if (x > 0 && x + 1 < iw && y > 0 && y + 1 < ih) {
        // Pre-compute common indices for efficiency
        int idx = y * iw + x;
        int idx_north = (y - 1) * iw;
        int idx_south = (y + 1) * iw;
        int idx_west = x - 1;
        int idx_east = x + 1;

        // Calculate gx and gy using pre-computed indices
        int gx = 
            in[idx_north + idx_west] - in[idx_north + idx_east] + 
            2 * (in[idx + idx_west] - in[idx + idx_east]) + 
            in[idx_south + idx_west] - in[idx_south + idx_east];

        int gy = 
            in[idx_north + idx_west] + 2 * in[idx_north + x] + in[idx_north + idx_east] - 
            in[idx_south + idx_west] - 2 * in[idx_south + x] - in[idx_south + idx_east];

        // Use single assignment statements for result calculations
        float gx_float = (float)gx;
        float gy_float = (float)gy;
        intensity[idx] = (unsigned char)sqrt(gx_float * gx_float + gy_float * gy_float);
        direction[idx] = atan2(gy_float, gx_float);
    }
}