#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

int MaxThreadsPerBlock;
int MaxThreadsX;
int MaxThreadsY;

// Optimized Kernel function
__global__ void Kernel_Expansion1(double *tb1, double *tb2, int width, int height, double Dx, double x0, double Dy, double y0)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= width || y >= height) return;

    // Precompute terms that are used more than once
    double invDx = 1.0 / Dx;
    double invDy = 1.0 / Dy;

    double xt = (x - x0) * invDx + x0;
    double yt = (y - y0) * invDy + y0;

    int x1 = static_cast<int>(xt) % width;
    int y1 = static_cast<int>(yt) % height;

    int xp1 = (x1 + 1) % width;
    int yp1 = (y1 + 1) % height;

    // Load values with less index calculations
    double dx = xt - floor(xt);
    double dy = yt - floor(yt);

    double z1 = tb1[width * y1 + x1];
    double z2 = tb1[width * yp1 + x1];
    double z3 = tb1[width * yp1 + xp1];
    double z4 = tb1[width * y1 + xp1];

    // Reduce redundant calculations
    double zp = z1 + dy * (z2 - z1);
    double zq = z4 + dy * (z3 - z4);
    double ZR = zp + dx * (zq - zp);

    tb2[width * y + x] = ZR;
}