#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int locationAlgo(double *x, double xadv, unsigned int nx)
{
    unsigned int location = 0;
    while (x[location] < xadv && location < nx)
        location++;
    if (location == 0)
        return location;
    else
        return location - 1;
}

__global__ void find_advection_point_location_cuda(double *x, double *y, double *xadv, double *yadv, unsigned int nx, unsigned int ny, unsigned int *cellx, unsigned int *celly, unsigned int *tracker, double xlim1, double xlim2, double ylim1, double ylim2, unsigned int TileSize)
{
    unsigned int index_x = blockIdx.x * TileSize + threadIdx.x;
    unsigned int index_y = blockIdx.y * TileSize + threadIdx.y;
    unsigned int indexToWrite = index_y * nx + index_x;

    // Check bounds for x and y
    bool xoutofbounds = (xadv[indexToWrite] <= xlim1 || xadv[indexToWrite] >= xlim2);
    bool youtofbounds = (yadv[indexToWrite] <= ylim1 || yadv[indexToWrite] >= ylim2);

    // Optimize branch conditions using single pass logic
    tracker[indexToWrite] = xoutofbounds * 2 + youtofbounds;

    if (tracker[indexToWrite] == 0) // in bounds
    {
        cellx[indexToWrite] = locationAlgo(x, xadv[indexToWrite], nx);
        celly[indexToWrite] = locationAlgo(y, yadv[indexToWrite], ny);
    }
    else if (tracker[indexToWrite] == 1) // y out of bounds
    {
        cellx[indexToWrite] = locationAlgo(x, xadv[indexToWrite], nx);
        celly[indexToWrite] = (yadv[indexToWrite] <= ylim1) ? 0 : ny - 2;
    }
    else if (tracker[indexToWrite] == 2) // x out of bounds
    {
        celly[indexToWrite] = locationAlgo(y, yadv[indexToWrite], ny);
        cellx[indexToWrite] = (xadv[indexToWrite] <= xlim1) ? 0 : nx - 2;
    }
    // tracker 3 means both out of bounds, no action needed
}