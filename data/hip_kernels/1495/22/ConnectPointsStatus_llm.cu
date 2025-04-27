#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void ConnectPointsStatus(int* PointType_BestN, int* ConnectStatus, int size, int rows, int ChooseBestN, int ConnectRadius)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size * rows * ChooseBestN) // Check if id is out of bounds
        return;

    // Calculate indices
    int sizeIndex = id / (rows * ChooseBestN);
    int tempID = id % (rows * ChooseBestN);
    int rowIndex = tempID / ChooseBestN;
    int chooseIndex = tempID % ChooseBestN;

    // Check for invalid point
    if (PointType_BestN[sizeIndex * rows * ChooseBestN + rowIndex * ChooseBestN + chooseIndex] == -1)
        return;

    // Effective point processing
    int finalPos = min(rowIndex + ConnectRadius, rows);
    int currentPoint = PointType_BestN[sizeIndex * rows * ChooseBestN + rowIndex * ChooseBestN + chooseIndex];

    for (int i = rowIndex + 1; i < finalPos; i++)
    {
        for (int j = 0; j < ChooseBestN; j++)
        {
            // Get next point position
            int nextPoint = PointType_BestN[sizeIndex * rows * ChooseBestN + i * ChooseBestN + j];
            if (nextPoint != -1)
            {
                // Compute differences
                int diffX = currentPoint - nextPoint;
                int diffY = i - rowIndex;
                int Radius = diffX * diffX + diffY * diffY;

                // Check if within radius
                if (Radius < ConnectRadius * ConnectRadius)
                {
                    // Calculate index and update ConnectStatus
                    int index = sizeIndex * rows * ChooseBestN * ConnectRadius * ChooseBestN +
                                rowIndex * ChooseBestN * ConnectRadius * ChooseBestN +
                                chooseIndex * ConnectRadius * ChooseBestN +
                                (i - rowIndex) * ChooseBestN +
                                j;
                    
                    ConnectStatus[index] = Radius;
                }
            }
        }
    }
}