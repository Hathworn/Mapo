#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InitLabelKernel (double *Label, double xp, double yp, double rhill, double *Rmed, int nrad, int nsec)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Ensure indices are within bounds
    if (i < nrad && j < nsec) {
        // Compute angle, x, y values
        double angle = ((double)j / nsec) * 2.0 * PI;
        double x = Rmed[i] * cos(angle);
        double y = Rmed[i] * sin(angle);

        // Compute distance and label condition
        double dx = x - xp;
        double dy = y - yp;
        double distance = hypot(dx, dy); // Use hypot for numerical stability

        // Set Label based on distance comparison
        Label[i * nsec + j] = (distance < rhill) ? 1.0 : 0.0;
    }
}