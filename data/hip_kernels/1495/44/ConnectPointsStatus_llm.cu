#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void ConnectPointsStatus(int* PointType_BestN, int* ConnectStatus, int size, int rows, int ChooseBestN, int ConnectRadius)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size * rows * ChooseBestN)  
        return;

    // Precompute common expressions
    int sizeChooseBestN = size * rows * ChooseBestN;
    int sizeIndex = id / (rows * ChooseBestN);
    int tempID = id % (rows * ChooseBestN);
    int rowIndex = tempID / ChooseBestN;
    int chooseIndex = tempID % ChooseBestN;
    int baseIdx = sizeIndex * rows * ChooseBestN + rowIndex * ChooseBestN + chooseIndex;

    if (PointType_BestN[baseIdx] == -1)
        return;

    int connectRadiusSquared = ConnectRadius * ConnectRadius;
    int finalPos = min(rowIndex + ConnectRadius, rows);

    for (int i = rowIndex + 1; i < finalPos; i++) {
        for (int j = 0; j < ChooseBestN; j++) {

            int nextIdx = sizeIndex * rows * ChooseBestN + i * ChooseBestN + j;
            if (PointType_BestN[nextIdx] != -1) {
                // Calculate differences
                int diffX = PointType_BestN[baseIdx] - PointType_BestN[nextIdx];
                int diffY = i - rowIndex;
                int Radius = diffX * diffX + diffY * diffY;

                if (Radius < connectRadiusSquared) {
                    // Calculate index for ConnectStatus
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