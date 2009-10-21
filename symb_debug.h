#include <e32std.h>

//#define __DEBUG_PRINT
//#define __DEBUG_PRINT_FILE

#if defined(__DEBUG_PRINT) || defined(__WINS__)
	#ifdef __DEBUG_PRINT_FILE
			#include <e32svr.h> // RDebug
			void debugPrintFileInit();
			void debugPrintFile(TRefByValue<const TDesC> aFmt, ...);
		#define DEBUG_PRINT_FILE_INIT debugPrintFileInit()
		#define DEBUGPRINT debugPrintFile

		#else
		#define DEBUG_PRINT_FILE_INIT()
		#define DEBUGPRINT RDebug::Print
	#endif
	TDesC* DO_CONV(const char* s);
	#ifdef __DEBUG_PRINT_C
		#ifdef __cplusplus
		extern "C"
		#endif
		void dprintf(char *format, ...);
	#endif
#else
	#define DEBUG_PRINT_FILE_INIT
	#define DEBUGPRINT
#endif

void ExceptionHandler(TExcType exc);
