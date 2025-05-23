```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_mixed_derivatives(double *temppsix, double *temppsiy, double *temppsixy, unsigned int nx, unsigned int ny, double dx, double dy, unsigned int TileSize)
{
    unsigned int bx = blockIdx.x;
    unsigned int by = blockIdx.y;

    unsigned int tx = threadIdx.x;
    unsigned int ty = threadIdx.y;

    unsigned int index_x = bx * TileSize + tx;
    unsigned int index_y = by * TileSize + ty;

    unsigned int indexToWrite = index_y * nx + index_x;

    // Check for boundary nodes
    if ((index_y == 0 || index_y == ny - 1) && (index_x != 0 && index_x != nx - 1)) {
        temppsixy[indexToWrite] = (temppsiy[indexToWrite+1] - temppsiy[indexToWrite-1]) / (2 * dx);
    } else if ((index_y != 0 && index_y != ny - 1) && (index_x == 0 || index_x == nx - 1)) {
        temppsixy[indexToWrite] = (temppsix[indexToWrite + nx] - temppsix[indexToWrite - nx]) / (2 * dy);
    } else if ((index_y == 0 || index_y == ny - 1) && (index_x == 0 || index_x == nx - 1)) {
        double d1, d2, d3, d4;
        
        // Top-left corner
        if (index_y == 0 && index_x == 0) {
            d1 = (temppsiy[1] - temppsiy[0]) / dx;
            d2 = (temppsix[nx] - temppsix[0]) / dy;
            d3 = (temppsix[nx+1] - temppsix[1]) / dy;
            d4 = (temppsiy[nx+1] - temppsiy[nx]) / dx;
            temppsixy[indexToWrite] = 0.75 * (d1 + d2) - 0.25 * (d3 + d4);
        }
        // Top-right corner
        else if (index_y == 0 && index_x == nx-1) {
            d1 = (temppsiy[nx-1] - temppsiy[nx-2]) / dx;
            d2 = (temppsix[nx+nx-2] - temppsix[nx-2]) / dy;
            d3 = (temppsix[nx+nx-1] - temppsix[nx-1]) / dy;
            d4 = (temppsiy[nx+nx-1] - temppsiy[nx+nx-2]) / dx;
            temppsixy[indexToWrite] = 0.75 * (d1 + d3) - 0.25 * (d2 + d4);
        }
        // Bottom-left corner
        else if (index_y == ny-1 && index_x == 0) {
            d1 = (temppsiy[nx *(ny-2) + 1] - temppsiy[nx *(ny-2)]) / dx;
            d2 = (temppsix[nx *(ny-1)] - temppsix[nx *(ny-2)]) / dy;
            d3 = (temppsix[nx *(ny-1)] - temppsix[nx *(ny-2) + 1]) / dy;
            d4 = (temppsiy[nx *(ny-1) + 1] - temppsiy[nx *(ny-1)]) / dx;
            temppsixy[indexToWrite] = 0.75 * (d2 + d4) - 0.25 * (d3 + d1);
        }
        // Bottom-right corner
        else if (index_y == ny-1 && index_x == nx-1) {
            d1 = (temppsiy[nx *(ny-2) + nx - 1] - temppsiy[nx *(ny-2) + nx - 2]) / dx;
            d2 = (temppsix[nx *(ny-1) + nx - 2] - temppsix[nx *(ny-2) + nx - 2]) / dy;
            d3 = (temppsix[nx *(ny-1) + nx - 1] - temppsix[nx *(ny-2) + nx - 1]) / dy;
            d4 = (temppsiy[nx *(ny-1) + nx - 1] - temppsiy[nx *(ny-1) + nx - 2]) / dx;
            temppsixy[indexToWrite] = 0.75 * (d3 + d4) - 0.25 * (d1 + d2);
        }
    } else {
        // General case for inner nodes
        double dxy1 = (temppsiy[indexToWrite+1] - temppsiy[indexToWrite-1]) / (2 * dx);
        double dxy2 = (temppsix[indexToWrite + nx] - temppsix[indexToWrite - nx]) / (2 * dy);
        temppsixy[indexToWrite] = 0.5 * (dxy1 + dxy2);
    }
}