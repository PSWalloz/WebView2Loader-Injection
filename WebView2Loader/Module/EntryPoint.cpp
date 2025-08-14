#include <Windows.h>
#include <thread>

void EntryPoint()
{
    MessageBoxA(0, "Hello niggas", "WebView2Loader emulation", MB_OK);
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID reserved)
{
    if (reason == 1)
    {
        std::thread(EntryPoint).detach();
    }

    return 1;
}

