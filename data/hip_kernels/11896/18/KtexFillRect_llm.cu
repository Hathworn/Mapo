#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

int MaxThreadsPerBlock;
int MaxThreadsX;
int MaxThreadsY;

__global__ void KtexFillRect(void* surface, double* tb, int width, int height, size_t pitch, float2* Pts, int k, float th) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Early exit if out of bounds
    if (x >= width || y >= height) return;

    unsigned char *pixel1 = (unsigned char *)((char*)surface + y * pitch) + 4 * x;

    // Check if point is inside the polygon
    bool insidePolygon = ((Pts[1].y - Pts[0].y) * (x - Pts[0].x) - (y - Pts[0].y) * (Pts[1].x - Pts[0].x) >= 0) &&
                         ((Pts[2].y - Pts[1].y) * (x - Pts[1].x) - (y - Pts[1].y) * (Pts[2].x - Pts[1].x) >= 0) &&
                         ((Pts[3].y - Pts[2].y) * (x - Pts[2].x) - (y - Pts[2].y) * (Pts[3].x - Pts[2].x) >= 0) &&
                         ((Pts[0].y - Pts[3].y) * (x - Pts[3].x) - (y - Pts[3].y) * (Pts[0].x - Pts[3].x) >= 0);

    if (insidePolygon && (pixel1[k] >= th)) {
        tb[x + width * y] = 1;
    }
}