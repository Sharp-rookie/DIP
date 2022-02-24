#include <stdio.h>
#include <string>
#include <unistd.h>

using namespace std;

string message[15] = {"type", "imgsize", "bfReserved1&2", "bfOffBits", "biSize", "biWidth", "biHeight", "biPlanes", "biBitCount", "biCompression", "biSizeImage", "biXPelsPerMeter", "biYPelsPerMeter", "biClrUsed", "biClrImportant"};

void bmp_analysis(string filename, int *result)
{
    if (access(filename.c_str(), F_OK) == -1)
    {
        printf("%s not exist!\n", filename.c_str());
        return;
    }

    FILE *bmp = 0;
    if ((bmp = fopen(filename.c_str(), "rb")) == 0)
    {
        printf("Something wrong when read %s!\n", filename.c_str());
        return;
    }

    fread(&result[0], 1, sizeof(char) * 2, bmp);
    fread(&result[1], 1, sizeof(int), bmp);
    fread(&result[2], 1, sizeof(int), bmp);
    fread(&result[3], 1, sizeof(int), bmp);
    fread(&result[4], 1, sizeof(int), bmp);
    fread(&result[5], 1, sizeof(int), bmp);
    fread(&result[6], 1, sizeof(int), bmp);
    fread(&result[7], 1, sizeof(short), bmp);
    fread(&result[8], 1, sizeof(short), bmp);
    fread(&result[9], 1, sizeof(int), bmp);
    fread(&result[10], 1, sizeof(int), bmp);
    fread(&result[11], 1, sizeof(int), bmp);
    fread(&result[12], 1, sizeof(int), bmp);
    fread(&result[13], 1, sizeof(int), bmp);
    fread(&result[14], 1, sizeof(int), bmp);

    fclose(bmp);
}

int main()
{
    string filename;
    filename = "派蒙.bmp";
    int result[15] = {0};
    bmp_analysis(filename, result);
    for (int i = 0; i < 15; i++)
    {
        if (i == 0)
        {
            printf("%s: %x\n", message[i].c_str(), result[i]);
            continue;
        }
        printf("%s: %d\n", message[i].c_str(), result[i]);
    }

    return 0;
}